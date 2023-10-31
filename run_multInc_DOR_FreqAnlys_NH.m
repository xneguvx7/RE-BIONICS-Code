clearvars -except ip_ne ip_pe 
    %load project
    out = sbioloadproject('Redox.sbproj');
    m1 = out.m1;
    configsetObj = getconfigset(m1);
    configsetObj.SolverType = 'ssa';

     c_avg = 500e-15; % average conc in M
     n_samp = 100; % number of samples; preferably multiple of 4 - need to verfiy this
     cyc = 100;% number of CV cycles for each interval; 42 cycles equates to almost a day
     % widt = 7; % in cm
     % nB = ceil(widt/0.011); % max diffsuing number of blocks
    
%     tp_cy = 20; % time period of each cycle in sec; based on CV data
%     tp_s = tp_cy*cy;    
%     tt = 0:tp_s:tp_s*(size(conc,2)-1);
    
    
global ip_n;
global ip_p;
for ii=1:1:cyc
    dt = ii*20; % one sample times = number of cycles * time perdiod of one cycle
    fs = 1/dt;
    f = fs/n_samp;
    t=0:dt:(1/f)-dt;
    sigAmplitude = 200e-15; % amplitude of sinusoidal wave   
    conc = c_avg + sigAmplitude*sin(2*pi*f*t); % assumed concentration signal 

%         %Add noise
%         noiseAmplitude = 0.01;
%         concN = conc + noiseAmplitude * randn(1, length(conc));

    ip_n = zeros(2,size(conc,2));
    ip_p = zeros(2,size(conc,2));
    ip_n(1,:) = conc(1,:);
    ip_p(1,:) = conc(1,:);
    
    fprintf('----------------------------------------------------------------------------------- \n');
    fprintf(strcat('started run for cycle\t',num2str(ii),'\tat\t',datestr(now,'HH:MM:SS'),'\n'));
    [IO,ip_p,ip_n] = runBatches(conc,ii,size(conc,2),m1,ip_p,ip_n);
%    figure()
%    plot(IO);
%    IbyC = ip_n(2,:)./conc(1,:);

    %Noisy
    save(strcat('run2Data/CurrentValues/freqAnlys/width10/ip_n_',num2str(c_avg),'_',num2str(ii),'_cycles_freqA_NH_TAll.mat'),'ip_n');
    %save(strcat('run2Data/CurrentValues/freqAnlys/width750/ip_p_',num2str(c_avg),'_',num2str(ii),'_cycles_freqA_NH_TAll.mat'),'ip_p');   
    %save(strcat('run2Data/CurrentValues/freqAnlys/IbyC_',num2str(c_avg),'_',num2str(ii),'_cycles_freqA_NH_TAll.mat'),'IbyC');

    fprintf(strcat('ended run for cycle\t',num2str(ii),'\tat\t',datestr(now,'HH:MM:SS'),'\n'))
end

function [I,ip_p,ip_n] = runBatches(c,cy,n_samp,m1,ip_p,ip_n)
    %fprintf('----------------------------------------------------------------------------------- \n');
    %fprintf(strcat(num2str(c),' started at ',datestr(now,'HH:MM:SS'),'\n'))
    n_runs = 1; % number of times each concentration is repeated from scratch
    
    etai   = +0.5;   % [=] V, initial overpotential (relative to redox potential). Default = +0.2
	etaf   = -0.5;   % [=] V, final overpotential (relative to redox potential). Default = -0.2
	v      = 0.1;   % [=] V/s, sweep rate. Default = 1E-3
    Dt  = 0.1;          % [=] s, delta time (Eqn B.1.10, pg 790)
	tk  = cy*2*(etai-etaf)/v;    % [=] s, characteristic exp. time (pg 790). In this case, total time of fwd and rev scans
	L   = tk/Dt;    % [=] number of iterations per t_k (pg 790). Default = 500
	%j   = ceil(4.2*L^0.5)+5;  % number of boxes (pg 792-793). If L~200, j=65
    j=10; % vary it to vary the width of the channel. width = j*Dx
	
	O = zeros(L+1,j); % [=] mol/cm^3, concentration of O
	R = c(1,1)*1e-3*ones(L+1,j);  % [=] mol/cm^3, concentration of R
	JO = zeros(1,L+1); % [=] mol/cm^2-s, flux of O at the surface
	
	[O,R,JO,ip_p(2,1),ip_n(2,1)] = runBatch(O,R,JO,n_runs,cy,m1,1);
    for jk = 2:n_samp
		%R(1,j) = R(1,j) + (c(1,jk)*1e-3); %adding a concentration increment at the last block
        temp = zeros(L+1,j);
        temp(:,j) = ones(L+1,1); % add concentration at almost the end
        Rjk = (c(1,jk)-c(1,jk-1))*1e-3*temp;
        %R = R + j.*Rjk; % multiply by number of blocks so that when it reaches equilibrium, that is how much it will be sensing; amplifier
        R = R + Rjk; % multiply by number of blocks so that when it reaches equilibrium, that is how much it will be sensing; amplifier
		[O,R,JO,ip_p(2,jk),ip_n(2,jk)] = runBatch(O,R,JO,n_runs,cy,m1,jk);
    end
    
    function [O,R,JO,ipp,ipn] = runBatch(O,R,JO,n_runs,cycl,m1,jk)

         for ij = 1:n_runs
             %fprintf(strcat(num2str(jk),' increment in ', num2str(ij) ,' run ','\n'));

            %% INDEPENDENT VARIABLES %%
            %C      = c * 1e-3;    % [=] mol/cm^3, initial concentration of O. multiply by 1e-3 to convert Molarity to mol/cm^3. Default = 200 uM
            DO      = 3.79E-6;   % [=] cm^2/s, O diffusion coefficient. Default = 1E-5
            DR      = 4.98E-6;   % [=] cm^2/s, R diffusion coefficient. Default = 1E-5
            etai   = +0.5;   % [=] V, initial overpotential (relative to redox potential). Default = +0.2
            etaf   = -0.5;   % [=] V, final overpotential (relative to redox potential). Default = -0.2
            v      = 0.1;   % [=] V/s, sweep rate. Default = 1E-3
            n      = 1.0;    % [=] number of electrons transfered. Default = 1
            alpha  = 0.55;    % [=] dimensionless charge-transfer coefficient. Default = 0.5
            k0     = 1.75E-2;   % [=] cm/s, electrochemical rate constant. Default = 1E-2
            T      = 300.15; % [=] K, temperature. Default = 298.15
            Ar     = 0.0314; % [=] cm^2, Area of reacting surface region of electrode. Default = pi*r*r, r=0.1cm(radius of circular reacting surface)
            %% PHYSICAL CONSTANTS %%
            F      = 96485;   % [=] C/mol, Faraday's constant
            r      = 8.3145;  % [=] J/mol-K, ideal gas constant
            f      = F/(r*T); % [=] 1/V, normalized Faraday's constant at room temperature

            %% SIMULATION VARIABLES %%
            Dt  = 0.1;          % [=] s, delta time (Eqn B.1.10, pg 790)
            configsetObj = getconfigset(m1);
            set(configsetObj, 'StopTime', Dt); %setting stop time for simbiology simulation
        %     set(configsetObj.SolverOptions, 'OutputTimes', [Dt]); %set output times
            Dv = v*Dt;         % [=] v, delta voltage
            DM = 0.45;          % [=] model diffusion coefficient (pg 788). Default = 0.45
            D = max(DO,DR);
            Dx  = sqrt(D*Dt/DM);
            DMO = DO*Dt/(Dx^2);
            DMR = DR*Dt/(Dx^2);


            %% DERIVED CONSTANTS %%
            tk  = cycl*(2*(etai-etaf)/v);    % [=] s, characteristic exp. time (pg 790). In this case, total time of fwd and rev scans
            L   = tk/Dt;    % [=] number of iterations per t_k (pg 790). Default = 500
            %j   = ceil(4.2*L^0.5)+5;  % number of boxes (pg 792-793). If L~200, j=65
            j=10; %vary it to vary the width of the channel. width = j*Dx

            %% PRE-INITIALIZATION %%
            k = 0:L;                % time index vector
            t = Dt * k;             % time vector
        %     eta1 = etai - v*t;      % overpotential vector, negative scan
        %     eta2 = etaf + v*t;      % overpotential vector, positive scan
        %     eta = [eta1(eta1>etaf) eta2(eta2<=etai)]'; % overpotential scan, both directions

            v1 = 0:Dv:0.5;
            v2 = 0.5-Dv:-Dv:-0.5;
            v3 = -0.5+Dv:Dv:0;
            v4 = Dv:Dv:0.5;
            eta1 = [v1 v2 v3];
            etar = [v4 v2 v3]';
            etaR = ones(size(etar,1),cycl-1).*etar;% trimming in case there are eccesive elements
            eta = [eta1 etaR(:)'];% final voltage signal

            e0 = 0.247;
            eta0 = eta-e0;
            Enorm = eta0*f;          % normalized overpotential
            kf = k0.*exp(  -alpha *n*Enorm); % [=] cm/s, fwd rate constant (pg 799)
            kb = k0.*exp((1-alpha)*n*Enorm); % [=] cm/s, rev rate constant (pg 799)

    %         O = zeros(L+1,j); % [=] mol/cm^3, concentration of O
    %         R = C*ones(L+1,j);  % [=] mol/cm^3, concentration of R
    %         JO = zeros(1,L+1); % [=] mol/cm^2-s, flux of O at the surface

            %% START SIMULATION %%
            % i1 = time index. i2 = distance index
                for i1 = 1:L
                  % Update bulk concentrations of O and R
                    %applying poisson noise for area next to electrode
                       % zO = DMO*(O(i1,3)+O(i1,1)-2*O(i1,2));
                       % zO_abs = abs(zO);
                       % zO_sign = sign(zO);
                       % zO_mol = zO_abs*Ar*Dx*6.023e23;
                       % zO_mol = floor(zO_mol);
                       % zO_pos = poissrnd(zO_mol,1,1);
                       % zO_new = zO_pos/(Ar*Dx*6.023e23);
                       % if(isnan(zO_new))
                       %     zO_new = 0;
                       % end
                       % O(i1+1,2) = O(i1,2) + (zO_new*zO_sign);
                       % zR = DMR*(R(i1,3)+R(i1,1)-2*R(i1,2));
                       % zR_abs = abs(zR);
                       % zR_sign = sign(zR);
                       % zR_mol = zR_abs*Ar*Dx*6.023e23;
                       % zR_mol = floor(zR_mol);
                       % zR_pos = poissrnd(zR_mol,1,1);
                       % zR_new = zR_pos/(Ar*Dx*6.023e23);
                       % if(isnan(zR_new))
                       %     zR_new = 0;
                       % end
                       % R(i1+1,2) = R(i1,2) + (zR_new*zR_sign);
                    %rest of the region
                    for i2 = 2:j-1
                        O(i1+1,i2) = O(i1,i2) + DMO*(O(i1,i2+1)+O(i1,i2-1)-2*O(i1,i2));

                        R(i1+1,i2) = R(i1,i2) + DMR*(R(i1,i2+1)+R(i1,i2-1)-2*R(i1,i2));
                    end

                    %adding diffusion noise at the electrode
                    O(i1+1,2) = diffPos(O(i1+1,2), Ar, Dx);
                    R(i1+1,2) = diffPos(R(i1+1,2), Ar, Dx);

                    % Update flux
                    JO(i1+1)   = ( kf(i1+1).*O(i1+1,2) - kb(i1+1).*R(i1+1,2) ) ./ (1 + Dx*((kf(i1+1)/DO) + (kb(i1+1)/DR)) );
                    %JO(i1+1)   = simbio(O(i1+1,2),R(i1+1,2),kf(i1+1),kb(i1+1),Dx,Ar,DO,DR,Dt,m1);

                    % Update surface concentrations
                    O(i1+1,1) = O(i1+1,2) - JO(i1+1)*(Dx/DO);
                    R(i1+1,1) = R(i1+1,2) + JO(i1+1)*(Dx/DR);
                end

            % Calculate current density, Z, from flux of O
            Z = n.*F.*JO; % [=] A/cm^2 , current density
            I = Z*Ar;
            
%             figure()
%             plot(I);
%             ip_ne = min(I);
%             ip_pe = max(I);
            ipn = min(I);
            ipp = max(I);
         end
        

        function x_new = diffPos(x, Ar, Dx)
            if(isnan(x))
                x_new = 0;
            else
                %the final concentration will never be negative
                x_count = floor(x*Ar*Dx*6.023e23);
                x_pos = poissrnd(x_count);
                x_new = x_pos/(Ar*Dx*6.023e23);
            end
        end 
        function JO = simbio(O,R,k_f,k_b,Dx,Ar,DO,DR,Dt,m1)
        %converting into molecules
        m_CO = O*Ar*Dx*6.023e23;
        %number of molecules should always be integer values
        if(isnan(m_CO))
            m_CO = 0;
        else
            m_CO = floor(m_CO);
        end
        m_CR = R*Ar*Dx*6.023e23;
        if(isnan(m_CR))
            m_CR = 0;
        else
            m_CR = floor(m_CR);
        end
        %Set Oxidized and Reduced Initial Amount
        Oxidized = sbioselect(m1,'Type','species','Name','Oxidized');
        Oxidized.InitialAmount = m_CO;
        Reduced = sbioselect(m1,'Type','species','Name','Reduced');
        Reduced.InitialAmount = m_CR;
        %Set Forward and Backward reaction rates
        kfwd = m1.Reactions(1).KineticLaw(1).Parameters(1);
        set(kfwd, 'Value', k_f/Dx);
        kr = m1.Reactions(1).KineticLaw(1).Parameters(2);
        set(kr, 'Value', k_b/Dx);

        [~,x,~] = sbiosimulate(m1);
        %difference in concentrations (in molecules)
        SB_CO = x(end,1)-m_CO;
        SB_CR = x(end,2)-m_CR;
        %convert molecules to moles/cm^2
        d_CO =SB_CO/(Ar*6.023e23);
        d_CR =SB_CR/(Ar*6.023e23);
        %calculating flux
        JO = ((d_CR-d_CO)/(1+(Dx*((k_f/DO)+(k_b/DR)))))/Dt; % divide by Dt to get rate
        end

    end
    
    
end
    
