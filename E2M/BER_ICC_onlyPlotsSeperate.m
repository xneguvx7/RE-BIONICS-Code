rateDur = [1, 2, 3, 5, 10, 20, 30, 50, 100, 200, 300, 450, 600, 1200, 1800, 2700]; % input bit duration in s
rate = 1./rateDur;

BER_avg = load("BERValues/BER_avg.mat");
BER_8_avg = BER_avg.BER_8;
BER_16_avg = BER_avg.BER_16;
BER_32_avg = BER_avg.BER_32;
BER_64_avg = BER_avg.BER_64;
BER_128_avg = BER_avg.BER_128;


BER_winby2 = load("BERValues/BER_winBy2.mat");
BER_8_winby2 = BER_winby2.BER_8;
BER_16_winby2 = BER_winby2.BER_16;
BER_32_winby2 = BER_winby2.BER_32;
BER_64_winby2 = BER_winby2.BER_64;
BER_128_winby2 = BER_winby2.BER_128;


strt = 1; % start value to be plotted
stp = size(rateDur,2); % end size of be plotted

% 8 bit--------------------------------------------------------------------
figure()
semilogx(rate(strt:stp),BER_8_avg(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_avg(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_avg(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_avg(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_avg(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_avg(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_avg(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_avg(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_avg(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_avg(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',20); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM",'Location','southeast')
title('BER vs BitRate','8-bit Input - Average threshold');
print ('BER_plots/ICC_BER8_Avg','-depsc');
print ('BER_plots/ICC_BER8_Avg','-dpdf');
print ('BER_plots/ICC_BER8_Avg','-dsvg');

figure()
semilogx(rate(strt:stp),BER_8_winby2(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_winby2(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_winby2(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_winby2(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_winby2(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_winby2(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_winby2(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_winby2(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_winby2(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_winby2(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',20); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM",'Location','southeast')
title('BER vs BitRate','8-bit Input - Half window threshold');
print ('BER_plots/ICC_BER8_By2','-depsc');
print ('BER_plots/ICC_BER8_By2','-dpdf');
print ('BER_plots/ICC_BER8_By2','-dsvg');

% 16 bit-------------------------------------------------------------------
figure()
semilogx(rate(strt:stp),BER_16_avg(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_avg(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_avg(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_avg(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_avg(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_avg(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_avg(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_avg(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_avg(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_avg(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',20); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM",'Location','southeast')
title('BER vs BitRate','16-bit Input - Average threshold');
print ('BER_plots/ICC_BER16_Avg','-depsc');
print ('BER_plots/ICC_BER16_Avg','-dpdf');
print ('BER_plots/ICC_BER16_Avg','-dsvg');

figure()
semilogx(rate(strt:stp),BER_16_winby2(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_winby2(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_winby2(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_winby2(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_winby2(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_winby2(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_winby2(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_winby2(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_winby2(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_winby2(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',20); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM",'Location','southeast')
title('BER vs BitRate','16-bit Input - Half window threshold');
print ('BER_plots/ICC_BER16_By2','-depsc');
print ('BER_plots/ICC_BER16_By2','-dpdf');
print ('BER_plots/ICC_BER16_By2','-dsvg');

% 32 bit-------------------------------------------------------------------
figure()
semilogx(rate(strt:stp),BER_32_avg(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_avg(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_avg(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_avg(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_avg(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_avg(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_avg(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_avg(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_avg(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_avg(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',20); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM",'Location','southeast')
title('BER vs BitRate','32-bit Input - Average threshold');
print ('BER_plots/ICC_BER32_Avg','-depsc');
print ('BER_plots/ICC_BER32_Avg','-dpdf');
print ('BER_plots/ICC_BER32_Avg','-dsvg');

figure()
semilogx(rate(strt:stp),BER_32_winby2(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_winby2(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_winby2(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_winby2(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_winby2(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_winby2(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_winby2(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_winby2(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_winby2(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_winby2(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',20); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM",'Location','southeast')
title('BER vs BitRate','32-bit Input - Half window threshold');
print ('BER_plots/ICC_BER32_By2','-depsc');
print ('BER_plots/ICC_BER32_By2','-dpdf');
print ('BER_plots/ICC_BER32_By2','-dsvg');

% 64 bit-------------------------------------------------------------------
figure()
semilogx(rate(strt:stp),BER_64_avg(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_avg(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_avg(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_avg(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_avg(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_avg(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_avg(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_avg(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_avg(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_avg(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',20); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM",'Location','southeast')
title('BER vs BitRate','64-bit Input - Average threshold');
print ('BER_plots/ICC_BER64_Avg','-depsc');
print ('BER_plots/ICC_BER64_Avg','-dpdf');
print ('BER_plots/ICC_BER64_Avg','-dsvg');

figure()
semilogx(rate(strt:stp),BER_64_winby2(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_winby2(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_winby2(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_winby2(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_winby2(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_winby2(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_winby2(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_winby2(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_winby2(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_winby2(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',20); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM",'Location','southeast')
title('BER vs BitRate','64-bit Input - Half window threshold');
print ('BER_plots/ICC_BER64_By2','-depsc');
print ('BER_plots/ICC_BER64_By2','-dpdf');
print ('BER_plots/ICC_BER64_By2','-dsvg');

% 128 bit------------------------------------------------------------------
figure()
semilogx(rate(strt:stp),BER_128_avg(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_avg(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_avg(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_avg(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_avg(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_avg(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_avg(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_avg(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_avg(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_avg(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',20); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM",'Location','southeast')
title('BER vs BitRate','128-bit Input - Average threshold');
print ('BER_plots/ICC_BER128_Avg','-depsc');
print ('BER_plots/ICC_BER128_Avg','-dpdf');
print ('BER_plots/ICC_BER128_Avg','-dsvg');

figure()
semilogx(rate(strt:stp),BER_128_winby2(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_winby2(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_winby2(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_winby2(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_winby2(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_winby2(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_winby2(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_winby2(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_winby2(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_winby2(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',20); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM",'Location','southeast')
title('BER vs BitRate','128-bit Input - Half window threshold');
print ('BER_plots/ICC_BER128_By2','-depsc');
print ('BER_plots/ICC_BER128_By2','-dpdf');
print ('BER_plots/ICC_BER128_By2','-dsvg');

toplt = [1:stp-5,stp-3];

figure()
loglog(rate(toplt),BER_128_winby2(1,toplt),'-o',LineWidth=3);hold on;
loglog(rate(toplt),BER_128_winby2(2,toplt),'-x',LineWidth=3);hold on;
loglog(rate(toplt),BER_128_winby2(3,toplt),'-^',LineWidth=3);hold on;
loglog(rate(toplt),BER_128_winby2(4,toplt),'-*',LineWidth=3);hold on;
loglog(rate(toplt),BER_128_winby2(5,toplt),'->',LineWidth=3);hold on;
loglog(rate(toplt),BER_128_winby2(6,toplt),'-+',LineWidth=3);hold on;
loglog(rate(toplt),BER_128_winby2(7,toplt),'-square',LineWidth=3);hold on;
loglog(rate(toplt),BER_128_winby2(8,toplt),'-diamond',LineWidth=3);hold on;
loglog(rate(toplt),BER_128_winby2(9,toplt),'-<',LineWidth=3);hold on;
loglog(rate(toplt),BER_128_winby2(10,toplt),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',20); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM",'Location','southeast')
title('BER vs BitRate','128-bit Input - Half window threshold');