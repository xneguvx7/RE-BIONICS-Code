clearvars

cyc = 100; % maximum number of cv cycles between two consecutive samples
n_samp = 100; % number of sample points in the input signal
c_avg = 500e-15;% average input concentration
t_cv = 20;% time period for each cv; this is fixed based on simulation
Freqs = zeros(cyc,1); % frequency values

%Noise calc initialization
N_var = zeros(cyc,1); % variance. This becomes noise power
Op_IbycC = zeros(cyc,n_samp);
Op_ipn = zeros(cyc,n_samp);
Arr = zeros(2,cyc);

% %Other power calc initialization
% Oput(cyc,:) = load(strcat('CurrentValues/freqAnlys/NH-ChN/IbyC_',num2str(c_avg),'_',num2str(cyc),'_cycles_freqA_NH_TAll.mat')).IbyC;
% N_var(cyc,:) = var(Oput);

for ii=cyc:-1:1
    Freqs(ii) = 1/(ii*t_cv*n_samp);
    Op_IbycC(ii,:) = load(strcat('CurrentValues/freqAnlys/NH-ChN/IbyC_',num2str(c_avg),'_',num2str(ii),'_cycles_freqA_NH_TAll.mat')).IbyC;
    N_var(ii,:) = var(Op_IbycC(ii,:));

    Op_ipn(ii,:) = load(strcat('CurrentValues/freqAnlys/NH-ChN/ip_n_',num2str(c_avg),'_',num2str(ii),'_cycles_freqA_NH_TAll.mat')).ip_n(2,:);
    T = t_cv*ii;        % Sampling period in seconds  
    Fs = 1/T;           % Sampling frequency                        
    L = n_samp;         % Length of signal
    Y = fft(Op_ipn(ii,:));
    P2 = abs(Y/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    
    f = Fs*(1:(L/2)+1)/L;
    
    [val,Ind] = max(P1,[],'all');
    Arr(2,ii) = val;
    Arr(1,ii) = f(Ind);
end


figure()
plot(Arr(1,2:end),Arr(2,2:end)./c_avg,"-",'LineWidth',2);
set(gca,'FontSize',10); set(gca,'FontName','Arial');
grid on;
xlabel('Frequency (Hz)'), ylabel('Amplitude (A)');
title('Frequency Response');
print ('figures/FreqResponse','-depsc');


figure()
hAx=axes;
hAx.XScale='log';
% hAx.YScale='log';
% xlim([min(f) max(f)])
hold all
plot(Freqs(2:end),N_var(2:end),"-",'LineWidth',2);
set(gca,'FontSize',10); set(gca,'FontName','Arial');
grid on;
% annotation('textarrow',[1e-4 1e-4],[3.5e-7 N_var(indx)],'String','{\it v}');
xlabel('Frequency (Hz)'), ylabel('Noise Power (A^{2}s^{2}/M^{2})');
title('Noise Power Spectral Density');
print ('figures/NoiseSpectral_Final','-depsc');
print ('figures/NoiseSpectral','-dpdf');


figure()
hAx=axes;
hAx.XScale='log';
% hAx.YScale='log';
% xlim([min(f) max(f)])
hold all
plot(Freqs(2:end),N_var(2:end),"-o",'LineWidth',2);
hold on
indx = 23; % water filling line index just of respresentation purpose and not the actual water line values
yline(N_var(indx),"--r",'LineWidth',3);

%The below 3  lines are for coloring water-filled area. Values can change based on index
ffreqs = [Freqs(2:indx-5)' 2.6607e-5 2.6035e-5 Freqs(indx-3:indx)']; 
x2 = [ffreqs fliplr(ffreqs(1:indx-1))]; 
y2 = [N_var(2:indx-5)' N_var(indx) N_var(indx) N_var(indx-3:indx)' ones(1,indx-1).*N_var(indx)];

patch(x2,y2,'g','FaceAlpha',.5)
set(gca,'FontSize',10); set(gca,'FontName','Arial');
grid on;
% annotation('textarrow',[1e-4 1e-4],[3.5e-7 N_var(indx)],'String','{\it v}');
xlabel('Frequency (Hz)'), ylabel('Noise Power (A^{2}s^{2}/M^{2})');
title('Noise Power Spectral Density');
print ('figures/NoiseSpectral','-depsc');
print ('figures/NoiseSpectral','-dpdf');

%v = min(N_var):(max(N_var)-min(N_var))/99:max(N_var); % waterline for calculation which is average noisy output power
max2 = max(N_var) ; % vary this to look at how the max value changes the capacity value
v = min(N_var):(max2-min(N_var))/99:max2; 
Cpac = zeros(size(v));
for i=1:1:size(v,2)
    for j=2:1:cyc
        P = v(i)-N_var(j);
        if P>0
            logVal = log2(1+(P/N_var(j)));
            dW = Freqs(j-1)-Freqs(j);
            Cpac(i) = Cpac(i) + (logVal*dW);
        end
    end
end

figure()
% hAx=axes;
% hAx.XScale='log';
% hAx.YScale='log';
% xlim([min(f) max(f)])
%hold all
plot(v,Cpac,"-o",'LineWidth',2);
set(gca,'FontSize',10); set(gca,'FontName','Arial');
grid on;
xlabel('Desired Received Power (A^2)'), ylabel('Capcity (bits/sec)');
title('Desired Power vs Capacity');
print ('figures/CapacityAll','-depsc');