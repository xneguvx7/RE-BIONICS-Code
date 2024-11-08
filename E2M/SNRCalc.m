v1 = zeros(24,100);
v1(1,:) = load('ConcValues/run2/C_O_12e-2fM_32_600_75_runs100.mat').C_O(16,:);
v1(2,:) = load('ConcValues/run2/C_O_13e-2fM_32_600_75_runs100.mat').C_O(16,:);
v1(3,:) = load('ConcValues/run2/C_O_14e-2fM_32_600_75_runs100.mat').C_O(16,:);
v1(4,:) = load('ConcValues/run2/C_O_15e-2fM_32_600_75_runs100.mat').C_O(16,:);
v1(5,:) = load('ConcValues/run2/C_O_16e-2fM_32_600_75_runs100.mat').C_O(16,:);
v1(6,:) = load('ConcValues/run2/C_O_17e-2fM_32_600_75_runs100.mat').C_O(16,:);
v1(7,:) = load('ConcValues/run2/C_O_18e-2fM_32_600_75_runs100.mat').C_O(16,:);
v1(8,:) = load('ConcValues/run2/C_O_19e-2fM_32_600_75_runs100.mat').C_O(16,:);
v1(9,:) = load('ConcValues/run2/C_O_2e-1fM_32_600_75_runs100.mat').C_O(16,:);
v1(10,:) = load('ConcValues/run2/C_O_3e-1fM_32_600_75_runs100.mat').C_O(16,:);
v1(11,:) = load('ConcValues/run2/C_O_4e-1fM_32_600_75_runs100.mat').C_O(16,:);
v1(12,:) = load('ConcValues/run2/C_O_5e-1fM_32_600_75_runs100.mat').C_O(16,:);
v1(13,:) = load('ConcValues/run2/C_O_6e-1fM_32_600_75_runs100.mat').C_O(16,:);
v1(14,:) = load('ConcValues/run2/C_O_7e-1fM_32_600_75_runs100.mat').C_O(16,:);
v1(15,:) = load('ConcValues/run2/C_O_8e-1fM_32_600_75_runs100.mat').C_O(16,:);
v1(16,:) = load('ConcValues/run2/C_O_9e-1fM_32_600_75_runs100.mat').C_O(16,:);
v1(17,:) = load('ConcValues/run2/C_O_1fM_32_600_75_runs100.mat').C_O(16,:);
v1(18,:) = load('ConcValues/run2/C_O_10fM_32_600_75_runs100.mat').C_O(16,:);
v1(19,:) = load('ConcValues/run2/C_O_50fM_32_600_75_runs100.mat').C_O(16,:);
v1(20,:) = load('ConcValues/run2/C_O_100fM_32_600_75_runs100.mat').C_O(16,:);
v1(21,:) = load('ConcValues/run2/C_O_1000fM_32_600_75_runs100.mat').C_O(16,:);
v1(22,:) = load('ConcValues/run2/C_O_100pM_32_600_75_runs100.mat').C_O(16,:);
v1(23,:) = load('ConcValues/run2/C_O_100nM_32_600_75_runs100.mat').C_O(16,:);
v1(24,:) = load('ConcValues/run2/C_O_100uM_32_600_75_runs100.mat').C_O(16,:);

conc = [12e-17, 13e-17, 14e-17, 15e-17, 16e-17, 17e-17, 18e-17, 19e-17, 2e-16, 3e-16, 4e-16, 5e-16, 6e-16, 7e-16, 8e-16, 9e-16, 1e-15, 10e-15, 50e-15, 100e-15, 1000e-15, 100e-12, 100e-9, 100e-6];

SNRs = zeros(size(conc));

for i = 1: size(conc,2)
    mVal = mean(v1(i,:));
    vVal = var(v1(i,:));
    SNRs(1,i) = mVal*mVal/vVal; 
end


figure()
semilogx(conc, 10.*log10(SNRs), "-o");


v2 = zeros(10,100);
v2(1,:) = load('ConcValues/run2/C_O_12e-2fM_32_600_75_runs100.mat').C_O(16,:);
v2(2,:) = load('ConcValues/run2/C_O_15e-2fM_32_600_75_runs100.mat').C_O(16,:);
v2(3,:) = load('ConcValues/run2/C_O_2e-1fM_32_600_75_runs100.mat').C_O(16,:);
v2(4,:) = load('ConcValues/run2/C_O_1fM_32_600_75_runs100.mat').C_O(16,:);
v2(5,:) = load('ConcValues/run2/C_O_10fM_32_600_75_runs100.mat').C_O(16,:);
v2(6,:) = load('ConcValues/run2/C_O_100fM_32_600_75_runs100.mat').C_O(16,:);
v2(7,:) = load('ConcValues/run2/C_O_1000fM_32_600_75_runs100.mat').C_O(16,:);
v2(8,:) = load('ConcValues/run2/C_O_100pM_32_600_75_runs100.mat').C_O(16,:);
v2(9,:) = load('ConcValues/run2/C_O_100nM_32_600_75_runs100.mat').C_O(16,:);
v2(10,:) = load('ConcValues/run2/C_O_100uM_32_600_75_runs100.mat').C_O(16,:);

conc2 = [12e-17, 15e-17, 2e-16, 1e-15, 10e-15, 100e-15, 1000e-15, 100e-12, 100e-9, 100e-6];

SNRs2 = zeros(size(conc2));

for i = 1: size(conc2,2)
    mVal = mean(v2(i,:));
    vVal = var(v2(i,:));
    SNRs2(1,i) = mVal*mVal/vVal; 
end

figure()
semilogx(conc2, 10.*log10(SNRs2), "-o", LineWidth=2);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Concentration (M)'), ylabel('SNR (dB)');
% legend("Highest","Average")
title('SNR across concentrations');
% print ('SNR_E2M','-depsc');
% print ('SNR_E2M','-dpdf');
print ('SNR_E2M','-dsvg');
