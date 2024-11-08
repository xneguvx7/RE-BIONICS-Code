clearvars

cyc = 100; % maximum number of cv cycles between two consecutive samples
n_samp = 100; % number of sample points in the input signal
c_avg = 500e-15;% average input concentration
t_cv = 20;% time period for each cv; this is fixed based on simulation
Freqs = zeros(1,cyc); % frequency values
scl = 1; %scale factor for changing electrode area

%Freq response initialization
Op_ipn = zeros(cyc,n_samp);
Arr = zeros(2,cyc);

%noise PSD initialization
Op_C = zeros(cyc,n_samp);
Op_dIbyC = zeros(cyc,n_samp);
N_var = zeros(1,cyc); % variance. This becomes noise power 

for ii=cyc:-1:1
    Op_ipn(ii,:) = (load(strcat('run2Data/CurrentValues/freqAnlys/width75/ip_n_',num2str(c_avg),'_',num2str(ii),'_cycles_freqA_NH_TAll.mat')).ip_n(2,:))./scl;
    Freqs(ii) = 1/(ii*t_cv*n_samp);
    temp = [Op_ipn(ii,1) diff(Op_ipn(ii,:))];
    Op_C(ii,:) = load(strcat('run2Data/CurrentValues/freqAnlys/width75/ip_n_',num2str(c_avg),'_',num2str(ii),'_cycles_freqA_NH_TAll.mat')).ip_n(1,:);
    Op_dIbyC(ii,:) = temp./Op_C(ii,:);
    N_var(ii) = var(Op_dIbyC(ii,:));


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

temp2 = flip(Freqs);
trmp2 = [temp2(1) diff(temp2)];
temp3 = flip(N_var);
N_S = N_var./trmp2; % noise spectral density



figure()
% hAx=axes;
% hAx.XScale='log';
% % hAx.YScale='log';
% hold all
plot(Arr(1,2:end),Arr(2,2:end)./c_avg,"-",'LineWidth',2);
% plot(Arr(1,2:end),20*log10(Arr(2,2:end)./c_avg),"-",'LineWidth',2);
set(gca,'FontSize',12); set(gca,'FontName','Arial');
grid on;
xlabel('Frequency (Hz)'), ylabel('Amplitude (A/M)');
title('Frequency Response');
print ('run2Data/figures/FreqResponseLinear','-depsc');


figure()
hAx=axes;
hAx.XScale='log';
% hAx.YScale='log';
% xlim([min(f) max(f)])
hold all
plot(temp2(2:end-1),N_S(2:end-1),"-",'LineWidth',2);
set(gca,'FontSize',12); set(gca,'FontName','Arial');
grid on;
% annotation('textarrow',[1e-4 1e-4],[3.5e-7 N_var(indx)],'String','{\it v}');
xlabel('Frequency (Hz)'), ylabel('Noise Power (A^{2}s^{2}/M^{2})');
title('Noise Power Spectral Density');
print ('run2Data/figures/NoiseSpectral_Final','-depsc');
% print ('figures/NoiseSpectral','-dpdf');


%capacity for different waterlines
max2 = max(N_S) ; % vary this to look at how the max value changes the capacity value
v = min(N_S):(max2-min(N_S))/99:max2; 
Cpac = zeros(size(v));
for i=1:1:size(v,2)
    for j=2:1:cyc
        P = v(i)-N_S(j);
        if P>0
            logVal = log2(1+(P/N_S(j)));
            dW = Freqs(j-1)-Freqs(j);
            Cpac(i) = Cpac(i) + (logVal*dW);
        end
    end
end

% save('run2Data/CurrentValues/freqAnlys/width30/Cpac30by1.mat',"Cpac");
% save('run2Data/CurrentValues/freqAnlys/width30/vline30by1.mat',"v");

% figure()
% % hAx=axes;
% % hAx.XScale='log';
% % hAx.YScale='log';
% % xlim([min(f) max(f)])
% %hold all
% plot(v,Cpac,"-o",'LineWidth',2);
% set(gca,'FontSize',12); set(gca,'FontName','Arial');
% grid on;
% xlabel('Desired Received Power (A^2)'), ylabel('Capcity (bits/sec)');
% title('Desired Power vs Capacity');
% %print ('run2Data/figures/CapacityAll','-depsc');



figure()
hAx=axes;
hAx.XScale='log';
% hAx.YScale='log';
% xlim([min(f) max(f)])
hold all
plot(temp2(2:end),N_S(2:end),"-o",'LineWidth',2);
hold on
indx = 30; % water filling line index just of respresentation purpose and not the actual water line values
yline(N_S(indx),"--r",'LineWidth',3);

%The below 3  lines are for coloring water-filled area. Values can change based on index
ffreqs = [temp2(2:indx-5)' 2.6607e-5 2.6035e-5 temp2(indx-3:indx)']; 
x2 = [ffreqs fliplr(ffreqs(1:indx-1))]; 
y2 = [N_S(2:indx-5)' N_S(indx) N_S(indx) N_S(indx-3:indx)' ones(1,indx-1).*N_S(indx)];

patch(x2,y2,'g','FaceAlpha',.5)
set(gca,'FontSize',10); set(gca,'FontName','Arial');
grid on;
% annotation('textarrow',[1e-4 1e-4],[3.5e-7 N_var(indx)],'String','{\it v}');
xlabel('Frequency (Hz)'), ylabel('Noise Power (A^{2}s^{2}/M^{2})');
title('Noise Power Spectral Density');