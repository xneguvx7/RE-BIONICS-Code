%clear, clc, close all

% 0.005Hz---------------
Dt  = 0.1;
v   = 0.01;
Fre = 0.005;
% % 0.01Hz---------------
% Dt  = 0.05;
% v   = 0.02;
% Fre = 0.01;
% % 0.05Hz---------------
% Dt  = 0.01;
% v   = 0.1;
% Fre = 0.05;
% % 0.1Hz---------------
% Dt  = 0.005;
% v   = 0.2;
% Fre = 0.1;
% % 0.5Hz---------------
% Dt  = 0.001;
% v   = 1;
% Fre = 0.5;

    %% INDEPENDENT VARIABLES %%
    C      = 200e-9;    % [=] mol/cm^3, initial concentration of O. Default = 1.0
    DO      = 5.39E-6;   % [=] cm^2/s, O & R diffusion coefficient. Default = 1E-5
    DR      = 2.94E-6;   % [=] cm^2/s, O & R diffusion coefficient. Default = 1E-5
    etai   = +0.5;   % [=] V, initial overpotential (relative to redox potential). Default = +0.2
    etaf   = -0.5;   % [=] V, final overpotential (relative to redox potential). Default = -0.2
%     v      = 0.1;   % [=] V/s, sweep rate or scan rate. Default = 1E-3
    n      = 1.0;    % [=] number of electrons transfered. Default = 1
    alpha  = 0.74;    % [=] dimensionless charge-transfer coefficient. Default = 0.5
    k0     = 0.0254;   % [=] cm/s, electrochemical rate constant. Default = 1E-2
    T      = 298.15; % [=] K, temperature. Default = 298.15

    %% PHYSICAL CONSTANTS %%
    F      = 96485;   % [=] C/mol, Faraday's constant
    R      = 8.3145;  % [=] J/mol-K, ideal gas constant
    f      = F/(R*T); % [=] 1/V, normalized Faraday's constant at room temperature

    %% SIMULATION VARIABLES %%
%     Dt  = 0.01;               % [=] s, delta time (Eqn B.1.10, pg 790)
%     Dx  = 0.001;      % [=] cm, delta x (Eqn B.1.13, pg 791)
    Dv = 0.001;       % [=] v, delta voltage
    DM = 0.45;
    D = max(DO,DR);
    Dx  = sqrt(D*Dt/DM);
    DMO = DO*Dt/(Dx^2);
    DMR = DR*Dt/(Dx^2);

    %% DERIVED CONSTANTS %%
    tk  = 4*(2*(etai-etaf)/v);    % [=] s, characteristic exp. time (pg 790). In this case, total time of fwd and rev scans
    L   = tk/Dt;    % [=] number of iterations per t_k (pg 790). Default = 500
%     DM     = (D*Dt)/(Dx*Dx);   % [=] model diffusion coefficient (pg 788). Default = 0.45
    j   = ceil(4.2*L^0.5)+5;  % number of boxes (pg 792-793). If L~200, j=65

    %% PRE-INITIALIZATION %%
    k = 0:L;                % time index vector
    t = Dt * k;             % time vector
%     eta1 = etai - v*t;      % overpotential vector, negative scan
%     eta2 = etaf + v*t;      % overpotential vector, positive scan
%     eta = [eta1(eta1>etaf) eta2(eta2<=etai)]'; % overpotential scan, both directions

    v1 = 0:Dv:0.5;
    v2 = 0.499:-Dv:-0.5;
    v3 = -0.499:Dv:0;
    v4 = 0.001:Dv:0.5;
    eta = [v1 v2 v3 v4 v2 v3 v4 v2 v3 v4 v2 v3]';
%     eta = [v1 v2 v3]';
    e0=-0.207;
    eta0 = eta-e0;
    Enorm = eta0*f;          % normalized overpotential
    kf = k0.*exp(  -alpha *n*Enorm); % [=] cm/s, fwd rate constant (pg 799)
    kb = k0.*exp((1-alpha)*n*Enorm); % [=] cm/s, rev rate constant (pg 799)
    
    R = zeros(L+1,j); % [=] mol/cm^3, concentration of O
    O = C*ones(L+1,j);  % [=] mol/cm^3, concentration of R
    JO = zeros(1,L+1); % [=] mol/cm^2-s, flux of O at the surface

    %% START SIMULATION %%
    % i1 = time index. i2 = distance index
    for i1 = 1:L
        % Update bulk concentrations of O and R
        for i2 = 2:j-1
            O(i1+1,i2) = O(i1,i2) + DMO*(O(i1,i2+1)+O(i1,i2-1)-2*O(i1,i2));

            R(i1+1,i2) = R(i1,i2) + DMR*(R(i1,i2+1)+R(i1,i2-1)-2*R(i1,i2));
        end

        % Update flux
        JO(i1+1)   = ( kf(i1+1).*O(i1+1,2) - kb(i1+1).*R(i1+1,2) ) ./ (1 + Dx*((kf(i1+1)/DO) + (kb(i1+1)/DR)) );

        % Update surface concentrations
        O(i1+1,1) = O(i1+1,2) - JO(i1+1)*(Dx/DO);
        R(i1+1,1) = R(i1+1,2) + JO(i1+1)*(Dx/DR);
    end

    % Calculate current density, Z, from flux of O
    Z = n.*F.*JO; % [=] A/cm^2 , current density
%     I13 = Z(6001:8000)*0.0314;
    I13 = Z(6001:8000).*0.0314;
%     save(strcat('CurrentSim/I_Ru_',num2str(C),'_',num2str(Fre),'.mat'),'I13');

    %% PLOT RESULTS %%
    % Sometimes length(eta) = length(Z) + 1. If this is the case, truncate last value
    if length(eta0) > length(Z)
        eta0 = eta0(1:end-1);
    end
    
    
    tt = 0.1:0.1:200;
    I_Ru = xlsread('Data.xlsx','Buffer-Ru','AA6006:AA8005');
    I_buff = xlsread('Data.xlsx','Buffer','AA6006:AA8005');    
    
    figure()
    plot(tt,I13,'x');
    hold on;
    plot(tt,I_Ru-I_buff);
    set(gca,'FontSize',14); set(gca,'FontName','Arial');
    legend('simulated','experimental');
    grid on;
    xlabel('Time (s)'), ylabel('Current (A)');
    title('Ru - 200uM - 0.005 Hz');
    print ('Ru_Comp','-depsc');
    
    %pl(i7)=subplot(1,plotId,i7);%
%     plot(eta,Z)
%     figure
%     plot(t(1:2000),(Z(1:2000))*0.0314,'x');
%     set(gca,'FontSize',10); set(gca,'FontName','Arial');
% %     legend('simulated','experimental');
%     grid on;
%     xlabel('Time (s)'), ylabel('Current (A)');
%     title('Ru - 200uM - 0.005 Hz');
    
%     set(gca,'xdir','reverse');
%     xlabel('Overpotential (V)'), ylabel('Current density (mA/cm^2)');
    %legend;%
%     hold on;

% figure(201)
% figR = imagesc(R(1,1:100));
% for i=2:1:2001
%     set(figR,'Cdata',R(i,1:100));
%     pause(0.005);
% end
% 
% figure(202)
% figO = imagesc(O(1,1:100));
% for i=2:1:2001
%     set(figO,'Cdata',O(i,1:100));
%     pause(0.005);
% end
