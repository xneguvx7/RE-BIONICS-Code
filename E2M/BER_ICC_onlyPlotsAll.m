
rateDur = [1, 2, 3, 5, 10, 20, 30, 50, 100, 200, 300, 450, 600, 1200, 1800, 2700]; % input bit duration in s
rate = 1./rateDur;

BER_avg = load("BERValues/BER_avg.mat");
BER_8_avg = BER_avg.BER_8;
BER_16_avg = BER_avg.BER_16;
BER_32_avg = BER_avg.BER_32;
BER_64_avg = BER_avg.BER_64;
BER_128_avg = BER_avg.BER_128;

BER_win2 = load("BERValues/BER_win2.mat");
BER_8_win2 = BER_win2.BER_8;
BER_16_win2 = BER_win2.BER_16;
BER_32_win2 = BER_win2.BER_32;
BER_64_win2 = BER_win2.BER_64;
BER_128_win2 = BER_win2.BER_128;

BER_win3 = load("BERValues/BER_win3.mat");
BER_8_win3 = BER_win3.BER_8;
BER_16_win3 = BER_win3.BER_16;
BER_32_win3 = BER_win3.BER_32;
BER_64_win3 = BER_win3.BER_64;
BER_128_win3 = BER_win3.BER_128;

BER_win4 = load("BERValues/BER_win4.mat");
BER_8_win4 = BER_win4.BER_8;
BER_16_win4 = BER_win4.BER_16;
BER_32_win4 = BER_win4.BER_32;
BER_64_win4 = BER_win4.BER_64;
BER_128_win4 = BER_win4.BER_128;

BER_win5 = load("BERValues/BER_win5.mat");
BER_8_win5 = BER_win5.BER_8;
BER_16_win5 = BER_win5.BER_16;
BER_32_win5 = BER_win5.BER_32;
BER_64_win5 = BER_win5.BER_64;
BER_128_win5 = BER_win5.BER_128;

BER_win6 = load("BERValues/BER_win6.mat");
BER_8_win6 = BER_win6.BER_8;
BER_16_win6 = BER_win6.BER_16;
BER_32_win6 = BER_win6.BER_32;
BER_64_win6 = BER_win6.BER_64;
BER_128_win6 = BER_win6.BER_128;

BER_win7 = load("BERValues/BER_win7.mat");
BER_8_win7 = BER_win7.BER_8;
BER_16_win7 = BER_win7.BER_16;
BER_32_win7 = BER_win7.BER_32;
BER_64_win7 = BER_win7.BER_64;
BER_128_win7 = BER_win7.BER_128;

BER_winby2 = load("BERValues/BER_winBy2.mat");
BER_8_winby2 = BER_winby2.BER_8;
BER_16_winby2 = BER_winby2.BER_16;
BER_32_winby2 = BER_winby2.BER_32;
BER_64_winby2 = BER_winby2.BER_64;
BER_128_winby2 = BER_winby2.BER_128;

BER_winby4 = load("BERValues/BER_winBy4.mat");
BER_8_winby4 = BER_winby4.BER_8;
BER_16_winby4 = BER_winby4.BER_16;
BER_32_winby4= BER_winby4.BER_32;
BER_64_winby4 = BER_winby4.BER_64;
BER_128_winby4 = BER_winby4.BER_128;

BER_winby8 = load("BERValues/BER_winBy8.mat");
BER_8_winby8 = BER_winby8.BER_8;
BER_16_winby8 = BER_winby8.BER_16;
BER_32_winby8 = BER_winby8.BER_32;
BER_64_winby8 = BER_winby8.BER_64;
BER_128_winby8 = BER_winby8.BER_128;

strt = 1; % start value to be plotted
stp = size(rateDur,2); % end size of be plotted

%Plot
figure()
% 8 bit--------------------------------------------------------------------
subplot(5,10,1)
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
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','8bitInput-Average');

subplot(5,10,2)
semilogx(rate(strt:stp),BER_8_win2(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win2(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win2(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win2(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win2(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win2(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win2(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win2(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win2(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win2(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','8bitInput-Win2');

subplot(5,10,3)
semilogx(rate(strt:stp),BER_8_win3(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win3(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win3(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win3(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win3(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win3(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win3(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win3(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win3(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win3(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','8bitInput-Win3');

subplot(5,10,4)
semilogx(rate(strt:stp),BER_8_win4(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win4(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win4(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win4(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win4(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win4(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win4(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win4(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win4(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win4(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','8bitInput-Win4');

subplot(5,10,5)
semilogx(rate(strt:stp),BER_8_win5(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win5(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win5(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win5(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win5(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win5(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win5(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win5(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win5(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win5(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','8bitInput-Win5');

subplot(5,10,6)
semilogx(rate(strt:stp),BER_8_win6(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win6(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win6(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win6(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win6(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win6(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win6(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win6(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win6(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win6(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','8bitInput-Win6');

subplot(5,10,7)
semilogx(rate(strt:stp),BER_8_win7(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win7(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win7(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win7(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win7(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win7(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win7(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win7(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win7(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_win7(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','8bitInput-Win7');

subplot(5,10,8)
semilogx(rate(strt:stp),BER_8_winby8(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_winby8(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_winby8(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_winby8(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_winby8(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_winby8(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_winby8(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_winby8(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_winby8(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_winby8(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','8bitInput-WinBy8');

subplot(5,10,9)
semilogx(rate(strt:stp),BER_8_winby4(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_winby4(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_winby4(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_winby4(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_winby4(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_winby4(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_winby4(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_winby4(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_winby4(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_8_winby4(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','8bitInput-WinBy4');

subplot(5,10,10)
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
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','8bitInput-WinBy2');

% 16 bit-------------------------------------------------------------------
subplot(5,10,11)
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
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','16bitInput-Average');

subplot(5,10,12)
semilogx(rate(strt:stp),BER_16_win2(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win2(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win2(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win2(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win2(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win2(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win2(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win2(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win2(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win2(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','16bitInput-Win2');

subplot(5,10,13)
semilogx(rate(strt:stp),BER_16_win3(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win3(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win3(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win3(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win3(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win3(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win3(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win3(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win3(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win3(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','16bitInput-Win3');

subplot(5,10,14)
semilogx(rate(strt:stp),BER_16_win4(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win4(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win4(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win4(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win4(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win4(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win4(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win4(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win4(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win4(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','16bitInput-Win4');

subplot(5,10,15)
semilogx(rate(strt:stp),BER_16_win5(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win5(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win5(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win5(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win5(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win5(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win5(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win5(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win5(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win5(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','16bitInput-Win5');

subplot(5,10,16)
semilogx(rate(strt:stp),BER_16_win6(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win6(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win6(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win6(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win6(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win6(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win6(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win6(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win6(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win6(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','16bitInput-Win6');

subplot(5,10,17)
semilogx(rate(strt:stp),BER_16_win7(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win7(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win7(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win7(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win7(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win7(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win7(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win7(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win7(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_win7(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','16bitInput-Win7');

subplot(5,10,18)
semilogx(rate(strt:stp),BER_16_winby8(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_winby8(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_winby8(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_winby8(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_winby8(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_winby8(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_winby8(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_winby8(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_winby8(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_winby8(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','16bitInput-WinBy8');

subplot(5,10,19)
semilogx(rate(strt:stp),BER_16_winby4(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_winby4(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_winby4(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_winby4(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_winby4(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_winby4(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_winby4(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_winby4(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_winby4(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_16_winby4(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','16bitInput-WinBy4');

subplot(5,10,20)
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
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','16bitInput-WinBy2');

% 32 bit-------------------------------------------------------------------
subplot(5,10,21)
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
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','32bitInput-Average');

subplot(5,10,22)
semilogx(rate(strt:stp),BER_32_win2(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win2(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win2(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win2(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win2(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win2(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win2(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win2(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win2(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win2(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','32bitInput-Win2');

subplot(5,10,23)
semilogx(rate(strt:stp),BER_32_win3(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win3(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win3(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win3(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win3(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win3(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win3(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win3(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win3(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win3(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','32bitInput-Win3');

subplot(5,10,24)
semilogx(rate(strt:stp),BER_32_win4(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win4(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win4(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win4(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win4(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win4(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win4(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win4(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win4(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win4(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','32bitInput-Win4');

subplot(5,10,25)
semilogx(rate(strt:stp),BER_32_win5(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win5(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win5(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win5(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win5(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win5(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win5(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win5(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win5(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win5(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','32bitInput-Win5');

subplot(5,10,26)
semilogx(rate(strt:stp),BER_32_win6(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win6(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win6(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win6(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win6(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win6(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win6(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win6(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win6(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win6(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','32bitInput-Win6');

subplot(5,10,27)
semilogx(rate(strt:stp),BER_32_win7(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win7(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win7(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win7(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win7(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win7(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win7(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win7(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win7(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_win7(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','32bitInput-Win7');

subplot(5,10,28)
semilogx(rate(strt:stp),BER_32_winby8(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_winby8(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_winby8(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_winby8(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_winby8(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_winby8(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_winby8(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_winby8(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_winby8(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_winby8(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','32bitInput-WinBy8');

subplot(5,10,29)
semilogx(rate(strt:stp),BER_32_winby4(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_winby4(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_winby4(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_winby4(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_winby4(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_winby4(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_winby4(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_winby4(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_winby4(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_32_winby4(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','32bitInput-WinBy4');

subplot(5,10,30)
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
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','32bitInput-WinBy2');

% 64 bit-------------------------------------------------------------------
subplot(5,10,31)
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
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','64bitInput-Average');

subplot(5,10,32)
semilogx(rate(strt:stp),BER_64_win2(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win2(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win2(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win2(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win2(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win2(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win2(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win2(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win2(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win2(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','64bitInput-Win2');

subplot(5,10,33)
semilogx(rate(strt:stp),BER_64_win3(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win3(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win3(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win3(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win3(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win3(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win3(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win3(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win3(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win3(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','64bitInput-Win3');

subplot(5,10,34)
semilogx(rate(strt:stp),BER_64_win4(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win4(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win4(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win4(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win4(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win4(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win4(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win4(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win4(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win4(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','64bitInput-Win4');

subplot(5,10,35)
semilogx(rate(strt:stp),BER_64_win5(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win5(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win5(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win5(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win5(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win5(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win5(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win5(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win5(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win5(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','64bitInput-Win5');

subplot(5,10,36)
semilogx(rate(strt:stp),BER_64_win6(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win6(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win6(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win6(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win6(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win6(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win6(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win6(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win6(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win6(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','64bitInput-Win6');

subplot(5,10,37)
semilogx(rate(strt:stp),BER_64_win7(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win7(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win7(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win7(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win7(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win7(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win7(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win7(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win7(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_win7(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','64bitInput-Win7');

subplot(5,10,38)
semilogx(rate(strt:stp),BER_64_winby8(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_winby8(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_winby8(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_winby8(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_winby8(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_winby8(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_winby8(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_winby8(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_winby8(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_winby8(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','64bitInput-WinBy8');

subplot(5,10,39)
semilogx(rate(strt:stp),BER_64_winby4(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_winby4(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_winby4(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_winby4(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_winby4(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_winby4(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_winby4(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_winby4(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_winby4(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_64_winby4(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','64bitInput-WinBy4');

subplot(5,10,40)
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
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','64bitInput-WinBy2');

% 128 bit------------------------------------------------------------------
subplot(5,10,41)
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
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','128bitInput-Average');

subplot(5,10,42)
semilogx(rate(strt:stp),BER_128_win2(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win2(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win2(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win2(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win2(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win2(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win2(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win2(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win2(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win2(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','128bitInput-Win2');

subplot(5,10,43)
semilogx(rate(strt:stp),BER_128_win3(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win3(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win3(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win3(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win3(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win3(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win3(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win3(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win3(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win3(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','128bitInput-Win3');

subplot(5,10,44)
semilogx(rate(strt:stp),BER_128_win4(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win4(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win4(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win4(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win4(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win4(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win4(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win4(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win4(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win4(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','128bitInput-Win4');

subplot(5,10,45)
semilogx(rate(strt:stp),BER_128_win5(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win5(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win5(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win5(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win5(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win5(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win5(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win5(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win5(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win5(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','128bitInput-Win5');

subplot(5,10,46)
semilogx(rate(strt:stp),BER_128_win6(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win6(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win6(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win6(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win6(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win6(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win6(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win6(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win6(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win6(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','128bitInput-Win6');

subplot(5,10,47)
semilogx(rate(strt:stp),BER_128_win7(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win7(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win7(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win7(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win7(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win7(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win7(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win7(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win7(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_win7(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','128bitInput-Win7');

subplot(5,10,48)
semilogx(rate(strt:stp),BER_128_winby8(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_winby8(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_winby8(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_winby8(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_winby8(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_winby8(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_winby8(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_winby8(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_winby8(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_winby8(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','128bitInput-WinBy8');

subplot(5,10,49)
semilogx(rate(strt:stp),BER_128_winby4(1,strt:stp),'-o',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_winby4(2,strt:stp),'-x',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_winby4(3,strt:stp),'-^',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_winby4(4,strt:stp),'-*',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_winby4(5,strt:stp),'->',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_winby4(6,strt:stp),'-+',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_winby4(7,strt:stp),'-square',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_winby4(8,strt:stp),'-diamond',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_winby4(9,strt:stp),'-<',LineWidth=3);hold on;
semilogx(rate(strt:stp),BER_128_winby4(10,strt:stp),'-v',LineWidth=3);
grid on;
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','128bitInput-WinBy4');

subplot(5,10,50)
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
set(gca,'FontSize',18); set(gca,'FontName','Arial');
xlabel('Input BitRate (b/s)'), ylabel('BER');
legend("0.2fM","0.4fM","0.6fM","0.8fM","1fM","1.2fM","1.4fM","1.6fM","1.8fM","2fM")
title('BER vs BitRate','128bitInput-WinBy2');
