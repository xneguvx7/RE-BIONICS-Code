clear all
% clearvars -except ip_ne ip_pe
% delete(gcp('nocreate'))
% parpool('Processes',10)
    % %load project
    % out = sbioloadproject('../Redox.sbproj');
    % m1 = out.m1;
    % configsetObj = getconfigset(m1);
    % configsetObj.SolverType = 'ssa';
    
    n_runs = 1000; % number of runs
    bitSize = 32; %input stream length

    % x_in = randi([0,1],n_runs,bitSize); % binary , rows, columns
    in_duration = 100; % input bit duration in seconds
    in_rate = 1/in_duration; % input bit rate in bits/sec

    rateMul = [0.01, 0.02, 0.03, 0.05, 0.1, 0.2, 0.3, 0.5, 1, 2, 3, 4.5 6 12 18 27];
    sizeMul = [0.25 0.5 1 2 4];
    concsVal   = 200e-18.*[1 2 3 4 5 6 7 8 9 10]; % 200-2000 aM
    concsLbl   = 200.*[1 2 3 4 5 6 7 8 9 10];

    % %test
    % rateMul = [27];
    % sizeMul = [4];
    % concsVal   = 200e-18.*[10]; % 2e-15 or 2fM or 2000aM
    % concsLbl   = 200.*[10];

    

    % 1.9 fM
    % tic
    % runBatch(1.9e-15,n_runs,x_in,in_duration);
    % toc
    
    %single rate multi input
    % runBatch(1.9e-16,n_runs,x_in,in_duration);

    % %multi rate multi input
    % for xx = 1:size(rateMul,2)
    %     runBatch(1.9e-16,n_runs,x_in,in_duration*rateMul(1,xx));
    % end

    % % %full spectrum
    % parfor xz = 1:size(rateMul,2)
    %     for xy = 1:size(sizeMul,2)
    %         for xx = 1:size(concsVal,2)
    %             x_in = randi([0,1],n_runs,bitSize*sizeMul(1,xy));
    %             fprintf('----------------------------------------------------------------------------------- \n');
    %             fprintf(strcat('started conc\t',num2str(xx),'\tfor size\t',num2str(xy),'\twith rate\t',num2str(xz),'\tat\t',string(datetime),'\n'));
    %             runBatch(concsVal(1,xx),concsLbl(1,xx),n_runs,x_in,in_duration*rateMul(1,xz));
    %             fprintf(strcat('ended conc\t',num2str(xx),'\tfor size\t',num2str(xy),'\twith rate\t',num2str(xz),'\tat\t',string(datetime),'\n'))
    %         end
    %     end
    % end   
    
    % %selected spectrum

            for xx = 5:8
                x_in = randi([0,1],n_runs,bitSize*4);
                fprintf('----------------------------------------------------------------------------------- \n');
                fprintf(strcat('started conc\t',num2str(xx),'\tfor size\t',num2str(5),'\twith rate\t',num2str(16),'\tat\t',string(datetime),'\n'));
                runBatch(concsVal(1,xx),concsLbl(1,xx),n_runs,x_in,in_duration*27);
                fprintf(strcat('ended conc\t',num2str(xx),'\tfor size\t',num2str(5),'\twith rate\t',num2str(16),'\tat\t',string(datetime),'\n'))
            end


    

 
    function JO = runBatch(c,cLbl,n_runs,x_in,in_duration)

        bitSize = size(x_in,2);

        C_O = zeros(bitSize,n_runs);  % 10 is 1 over sample time - needs to make it generalized by definiting it earlier - feature removed
        C_R = zeros(bitSize,n_runs);

        Dt1  = 0.1;
        L1 = (bitSize*in_duration)/Dt1;
        C_O_all = zeros(L1,n_runs);
        C_R_all = zeros(L1,n_runs);

 for ij = 1:n_runs   

    %% INDEPENDENT VARIABLES %%
    C      = c * 1e-3;    % [=] mol/cm^3, initial concentration of O. multiply by 1e-3 to convert Molarity to mol/cm^3. Default = 200 uM
    DO      = 3.79E-6;   % [=] cm^2/s, O diffusion coefficient. Default = 1E-5
    DR      = 4.98E-6;   % [=] cm^2/s, R diffusion coefficient. Default = 1E-5
    etai   = +0.5;   % [=] V, initial overpotential (relative to redox potential). Default = +0.2
    etaf   = -0.5;   % [=] V, final overpotential (relative to redox potential). Default = -0.2
    v      = 0.01;   % [=] V/s, sweep rate. Default = 1E-3
    n      = 1.0;    % [=] number of electrons transfered. Default = 1
    alpha  = 0.55;    % [=] dimensionless charge-transfer coefficient. Default = 0.5
    k0     = 1.75E-2;   % [=] cm/s, electrochemical rate constant. Default = 1E-2
    T      = 300.15; % [=] K, temperature. Default = 298.15
    Ar     = 0.0314; % [=] cm^2, Area of reacting surface region of electrode. Default = pi*r*r, r=0.1cm(radius of circular reacting surface)
    %% PHYSICAL CONSTANTS %%
    F      = 96485;   % [=] C/mol, Faraday's constant
    R      = 8.3145;  % [=] J/mol-K, ideal gas constant
    f      = F/(R*T); % [=] 1/V, normalized Faraday's constant at room temperature

    %% SIMULATION VARIABLES %%
    Dt  = 0.1;          % [=] s, delta time (Eqn B.1.10, pg 790)
    % configsetObj = getconfigset(m1);
    % set(configsetObj, 'StopTime', Dt); %setting stop time for simbiology simulation
%     set(configsetObj.SolverOptions, 'OutputTimes', [Dt]); %set output times
    Dv = v*Dt;         % [=] v, delta voltage
    DM = 0.45;          % [=] model diffusion coefficient (pg 788). Default = 0.45
    D = max(DO,DR);
    Dx  = sqrt(D*Dt/DM);
    DMO = DO*Dt/(Dx^2);
    DMR = DR*Dt/(Dx^2);
    

    %% DERIVED CONSTANTS %%
    % tk  = 1*(2*(etai-etaf)/v);    % [=] s, characteristic exp. time (pg 790). In this case, total time of fwd and rev scans
    tk = bitSize*in_duration;
    L   = tk/Dt;    % [=] number of iterations per t_k (pg 790). Default = 500
    % j   = ceil(4.2*L^0.5)+5;  % number of boxes (pg 792-793). If L~200, j=65
    j = 75;

    %% PRE-INITIALIZATION %%
    k = 0:L;                % time index vector
    t = Dt * k;             % time vector
%     eta1 = etai - v*t;      % overpotential vector, negative scan
%     eta2 = etaf + v*t;      % overpotential vector, positive scan
%     eta = [eta1(eta1>etaf) eta2(eta2<=etai)]'; % overpotential scan, both directions
    
    v1 = 0.5*ones(1,in_duration/Dt);
    v0 = -0.3*ones(1,in_duration/Dt);
    eta = v1;

    if(x_in(ij,1)==0)
        eta = v0;
    end

    for ii = 2:bitSize
        if(x_in(ij,ii)==0)
            eta = [eta v0];
        else
            eta = [eta v1];
        end
    end
    
    % v1 = 0:Dv:0.5;
    % v2 = 0.5-Dv:-Dv:-0.5;
    % v3 = -0.5+Dv:Dv:0;
    % v4 = Dv:Dv:0.5;
    % eta = [v1 v2 v3 v4 v2 v3];
    eta = [eta 0];
    e0=0.247;
    eta0 = eta-e0;
    Enorm = eta0*f;          % normalized overpotential
    kf = k0.*exp(  -alpha *n*Enorm); % [=] cm/s, fwd rate constant (pg 799)
    kb = k0.*exp((1-alpha)*n*Enorm); % [=] cm/s, rev rate constant (pg 799)
    
    O = zeros(L+1,j); % [=] mol/cm^3, concentration of O
    R = C*ones(L+1,j);  % [=] mol/cm^3, concentration of R
    JO = zeros(1,L+1); % [=] mol/cm^2-s, flux of O at the surface

    jk = 1;

    %% START SIMULATION %%
    % i1 = time index. i2 = distance index
    for i1 = 1:L
      % Update bulk concentrations of O and R
        %applying poisson noise for area next to electrode
           zO = DMO*(O(i1,3)+O(i1,1)-2*O(i1,2));
           zO_abs = abs(zO);
           zO_sign = sign(zO);
           zO_mol = zO_abs*Ar*Dx*6.023e23;
           zO_mol = floor(zO_mol);
           zO_pos = poissrnd(zO_mol,1,1);
           zO_new = zO_pos/(Ar*Dx*6.023e23);
           if(isnan(zO_new))
               zO_new = 0;
           end
           O(i1+1,2) = O(i1,2) + (zO_new*zO_sign);
           zR = DMR*(R(i1,3)+R(i1,1)-2*R(i1,2));
           zR_abs = abs(zR);
           zR_sign = sign(zR);
           zR_mol = zR_abs*Ar*Dx*6.023e23;
           zR_mol = floor(zR_mol);
           zR_pos = poissrnd(zR_mol,1,1);
           zR_new = zR_pos/(Ar*Dx*6.023e23);
           if(isnan(zR_new))
               zR_new = 0;
           end
           R(i1+1,2) = R(i1,2) + (zR_new*zR_sign);
        %rest of the region
        for i2 = 3:j-1
            O(i1+1,i2) = O(i1,i2) + DMO*(O(i1,i2+1)+O(i1,i2-1)-2*O(i1,i2));

            R(i1+1,i2) = R(i1,i2) + DMR*(R(i1,i2+1)+R(i1,i2-1)-2*R(i1,i2));
        end
        
        % Update flux
        JO(i1+1)   = ( kf(i1+1).*O(i1+1,2) - kb(i1+1).*R(i1+1,2) ) ./ (1 + Dx*((kf(i1+1)/DO) + (kb(i1+1)/DR)) );
        %JO(i1+1)   = simbio(O(i1+1,2),R(i1+1,2),kf(i1+1),kb(i1+1),Dx,Ar,DO,DR,Dt,m1);

        % Update surface concentrations
        O(i1+1,1) = O(i1+1,2) - JO(i1+1)*(Dx/DO);
        R(i1+1,1) = R(i1+1,2) + JO(i1+1)*(Dx/DR);

        C_O_all(i1,ij) = O(i1,j-1);
        C_R_all(i1,ij) = R(i1,j-1);
        
        if(mod(i1,in_duration/Dt)==0)
            C_O(jk,ij) = O(i1,j-1);
            C_R(jk,ij) = R(i1,j-1);
            jk = jk+1;
        end
    end

    % Calculate current density, Z, from flux of O
    % Z = n.*F.*JO; % [=] A/cm^2 , current density
    % I = Z*Ar;
%     figure()
%     plot(I);
%     ip_ne = min(I);
%     ip_pe = max(I);
    

 end

    % function JO = simbio(O,R,k_f,k_b,Dx,Ar,DO,DR,Dt,m1)
    % %converting into molecules
    % m_CO = O*Ar*Dx*6.023e23;
    % %number of molecules should always be integer values
    % if(isnan(m_CO))
    %     m_CO = 0;
    % else
    %     m_CO = floor(m_CO);
    % end
    % m_CR = R*Ar*Dx*6.023e23;
    % if(isnan(m_CR))
    %     m_CR = 0;
    % else
    %     m_CR = floor(m_CR);
    % end
    % %Set Oxidized and Reduced Initial Amount
    % Oxidized = sbioselect(m1,'Type','species','Name','Oxidized');
    % Oxidized.InitialAmount = m_CO;
    % Reduced = sbioselect(m1,'Type','species','Name','Reduced');
    % Reduced.InitialAmount = m_CR;
    % %Set Forward and Backward reaction rates
    % kfwd = m1.Reactions(1).KineticLaw(1).Parameters(1);
    % set(kfwd, 'Value', k_f/Dx);
    % kr = m1.Reactions(1).KineticLaw(1).Parameters(2);
    % set(kr, 'Value', k_b/Dx);
    % 
    % [~,x,~] = sbiosimulate(m1);
    % %difference in concentrations (in molecules)
    % SB_CO = x(end,1)-m_CO;
    % SB_CR = x(end,2)-m_CR;
    % %convert molecules to moles/cm^2
    % d_CO =SB_CO/(Ar*6.023e23);
    % d_CR =SB_CR/(Ar*6.023e23);
    % %calculating flux
    % JO = ((d_CR-d_CO)/(1+(Dx*((k_f/DO)+(k_b/DR)))))/Dt; % divide by Dt to get rate
    % end
 
 save(strcat('ConcValues/runMulti5/C_O_',num2str(cLbl),'aM_multi',num2str(bitSize),'_',num2str(in_duration),'_',num2str(75),'_runs',num2str(n_runs)),'C_O');
 save(strcat('ConcValues/runMulti5/C_R_',num2str(cLbl),'aM_multi',num2str(bitSize),'_',num2str(in_duration),'_',num2str(75),'_runs',num2str(n_runs)),'C_R');
 %save(strcat('ConcValues/runMulti5/C_O_all_',num2str(cLbl),'aM_multi',num2str(bitSize),'_',num2str(in_duration),'_',num2str(75),'_runs',num2str(n_runs)),'C_O_all');
 %save(strcat('ConcValues/runMulti5/C_R_all_',num2str(cLbl),'aM_multi',num2str(bitSize),'_',num2str(in_duration),'_',num2str(75),'_runs',num2str(n_runs)),'C_R_all');
 save(strcat('ConcValues/runMulti5/x_in_',num2str(cLbl),'aM_multi',num2str(bitSize),'_',num2str(in_duration),'_',num2str(75),'_runs',num2str(n_runs)),'x_in');
end