% SS = load('C:/Users/Karthik Reddy Gorla/Desktop/CurrentValues/ip_ne_200uM');
% ip_ne_1uM = (SS.ip_ne)/200;

S1 = load('run2Data/CurrentValues/forPDF1000/ip_n_1e-04.mat');
% ip_ne_1e_04 = ip_ne_1e_13/10;
S2 = load('run2Data/CurrentValues/forPDF1000/ip_n_1e-05.mat');
% ip_ne_1e_05 = ip_ne_1e_14/10;
S3 = load('run2Data/CurrentValues/forPDF1000/ip_n_1e-06.mat');
% ip_ne_1e_06 = (ip_ne_1uM) * ones(1,100);
S4 = load('run2Data/CurrentValues/forPDF1000/ip_n_1e-07.mat');
% ip_ne_1e_07 = ip_ne_1e_06/10;
S5 = load('run2Data/CurrentValues/forPDF1000/ip_n_1e-08.mat');
% ip_ne_1e_08 = ip_ne_1e_07/10;
S6 = load('run2Data/CurrentValues/forPDF1000/ip_n_1e-09.mat');
% ip_ne_1e_09 = ip_ne_1e_08/10;
S7 = load('run2Data/CurrentValues/forPDF1000/ip_n_1e-10.mat');
% ip_ne_1e_10 = ip_ne_1e_09/10;
S8 = load('run2Data/CurrentValues/forPDF1000/ip_n_1e-11.mat');
% ip_ne_1e_11 = ip_ne_1e_10/10;
S9 = load('run2Data/CurrentValues/forPDF1000/ip_n_1e-12.mat');
% ip_ne_1e_12 = ip_ne_1e_11/10;
S10 = load('run2Data/CurrentValues/forPDF1000/ip_n_1e-13.mat');
% ip_ne_1e_13 = ip_ne_1e_12/10;
S11 = load('run2Data/CurrentValues/forPDF1000/ip_n_1e-14.mat');
% ip_ne_1e_14 = ip_ne_1e_13/10;
S12 = load('run2Data/CurrentValues/forPDF1000/ip_n_1e-15.mat');
% ip_ne_1e_15 = ip_ne_1e_14/10;
S13 = load('run2Data/CurrentValues/forPDF1000/ip_n_1e-16.mat');
% ip_ne_1e_16 = ip_ne_1e_14/10;
% S14 = load('run2Data/CurrentValues/forPDF1000/ip_n_1e-17.mat');
% % ip_ne_1e_17 = ip_ne_1e_14/10;
% S15 = load('run2Data/CurrentValues/forPDF1000/ip_n_1e-18.mat');
% % ip_ne_1e_18 = ip_ne_1e_14/10;
% S16 = load('run2Data/CurrentValues/forPDF1000/ip_n_1e-19.mat');
% % ip_ne_1e_19 = ip_ne_1e_14/10;
% S17 = load('run2Data/CurrentValues/forPDF1000/ip_n_1e-20.mat');
% % ip_ne_1e_20 = ip_ne_1e_14/10;

% buff_peak = -1.55e-7;

s=zeros(1,13);
s(1) = mean(S1.ip_n);
s(2) = mean(S2.ip_n);
s(3) = mean(S3.ip_n);
s(4) = mean(S4.ip_n);
s(5) = mean(S5.ip_n);
s(6) = mean(S6.ip_n);
s(7) = mean(S7.ip_n);
s(8) = mean(S8.ip_n);
s(9) = mean(S9.ip_n);
s(10) = mean(S10.ip_n);
s(11) = mean(S11.ip_n);
s(12) = mean(S12.ip_n);
s(13) = mean(S13.ip_n);
% s(14) = mean(S14.ip_n);
% s(15) = mean(S15.ip_n);
% s(16) = mean(S16.ip_n);
% s(17) = mean(S17.ip_n);

n = zeros(1,13);
n(1) = var(S1.ip_n);
n(2) = var(S2.ip_n);
n(3) = var(S3.ip_n);
n(4) = var(S4.ip_n);
n(5) = var(S5.ip_n);
n(6) = var(S6.ip_n);
n(7) = var(S7.ip_n);
n(8) = var(S8.ip_n);
n(9) = var(S9.ip_n);
n(10) = var(S10.ip_n);
n(11) = var(S11.ip_n);
n(12) = var(S12.ip_n);
n(13) = var(S13.ip_n);
% n(14) = var(S14.ip_n);
% n(15) = var(S15.ip_n);
% n(16) = var(S16.ip_n);
% n(17) = var(S17.ip_n);

c = [1e-4,1e-5,1e-6,1e-7,1e-8,1e-9,1e-10,1e-11,1e-12,1e-13,1e-14,1e-15,1e-16];
snr=zeros(1,13);

for i=1:1:13
    snr(i) = (s(i)*s(i))/(n(i));
end

figure()
% stem(log10(c),10*log10(snr),'o','LineWidth',2);
% plot(c,snr);
%loglog(c,power(snr,10),'o','LineWidth',2)
%semilogx(c,10*log10(snr),'o','LineWidth',2)
stem(c,10*log10(snr),'o','LineWidth',2);
xlabel('Concentration (M)','FontWeight','bold')
ylabel('SNR (dB)','FontWeight','bold')
axis([min(c)/10 max(c)*10 min(10*log10(snr))-10 max(10*log10(snr))+10])
set(gca,'FontSize',10); set(gca,'FontName','Times New Roman'); set(gca,'xscal','log');
grid on;
title('SNR across Concentrations');
print ('figures/run2/SNR_All_new','-depsc');


ssc = s./c;

figure()
hAx=axes;
hAx.XScale='log';
hAx.YScale='log';
% xlim([min(f) max(f)])
% ylim([-2e-7 2e-7])
hold all
plot(c(1:end-1),s(1:end-1),'-o',LineWidth=3);
% mdl=fitlm(c,s);
% plot(mdl);
set(gca,'FontSize',14); set(gca,'FontName','Arial');
grid on;
title('Peak Current Vs Concentration','Simulated');
xlabel('Concentration (M)');
ylabel('Peak Current (A)');
print ('run2Data/figures/IvsC_sim','-depsc');

xx = [0.0002,0.001,0.002];
yy = [-6.75565E-07, -2.45942E-06, -4.95346E-06];
figure()
plot(xx,yy,'-o',LineWidth=3)
xlim([0.0001 0.0021])
set(gca,'FontSize',14); set(gca,'FontName','Arial');
grid on;
title('Peak Current Vs Concentration','Experimental');
xlabel('Concentration (M)');
ylabel('Peak Current (A)');
print ('run2Data/figures/IvsC_exp','-depsc');


figure()
hAx=axes;
hAx.XScale='log';
% hAx.YScale='log';
% xlim([min(f) max(f)])
ylim([-3e-3 0])
hold all
% plot(c(1:12),ssc(1:12),'x');
mdl=fitlm(c(1:13),ssc(1:13));
plot(mdl);
set(gca,'FontSize',14); set(gca,'FontName','Arial');
grid on;
title('Peak current by concentration vs Concentration');
xlabel('Concentration (M)');
ylabel('Peak current by concentration (A/M)');
print ('run2Data/figures/IbyC','-depsc');

