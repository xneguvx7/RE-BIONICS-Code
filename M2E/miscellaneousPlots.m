S=zeros(1,11);
S(1) = mean(load('run2Data/CurrentValues/forMI/ip_n_1e-15.mat').ip_n);
S(2) = mean(load('run2Data/CurrentValues/forMI/ip_n_1.1e-15.mat').ip_n);
S(3) = mean(load('run2Data/CurrentValues/forMI/ip_n_1.2e-15.mat').ip_n);
S(4) = mean(load('run2Data/CurrentValues/forMI/ip_n_1.3e-15.mat').ip_n);
S(5) = mean(load('run2Data/CurrentValues/forMI/ip_n_1.4e-15.mat').ip_n);
S(6) = mean(load('run2Data/CurrentValues/forMI/ip_n_1.5e-15.mat').ip_n);
S(7) = mean(load('run2Data/CurrentValues/forMI/ip_n_1.6e-15.mat').ip_n);
S(8) = mean(load('run2Data/CurrentValues/forMI/ip_n_1.7e-15.mat').ip_n);
S(9) = mean(load('run2Data/CurrentValues/forMI/ip_n_1.8e-15.mat').ip_n);
S(10) = mean(load('run2Data/CurrentValues/forMI/ip_n_1.9e-15.mat').ip_n);
S(11) = mean(load('run2Data/CurrentValues/forMI/ip_n_2e-15.mat').ip_n);

cc= 1:0.1:2;
cc = cc.*1e-15;

scc = S./cc;

figure()
%plot(cc,S,'-x');
f=fit(cc,S,'poly1');
plot(f,cc,S);

figure()
mdl=fitlm(cc,scc);
plot(mdl);


curr_sim = load('Curr_Fc200.mat').ans;
curr_sim2 = load('Curr_Ru200.mat').ans;
curr_exp = readmatrix("Data2.xlsx","Sheet","Buffer-Fc","Range","AZ6006:AZ8005");
curr_exp2 = readmatrix("Data2.xlsx","Sheet","Buffer-Fc","Range","BY6006:BY8005");
curr_expRu = readmatrix("Data.xlsx","Sheet","Buffer-Ru","Range","AA6006:AA8005");
curr_buff = readmatrix("Data.xlsx","Sheet","Buffer","Range","AA6006:AA8005");
t=0:0.1:199.9;

figure()
plot(t, curr_sim(6001:8000),'x');
hold on;
plot(t,(curr_exp-curr_buff)');
set(gca,'FontSize',14); set(gca,'FontName','Arial');
grid on;
legend('simulated','experimental');
xlabel('Time (s)'), ylabel('Current (A)');
title('Fc - 200\muM - 0.005 Hz');
print ('Fc_Comp','-depsc');

figure()
plot(t, curr_sim2(6001:8000),'x');
hold on;
plot(t,(curr_expRu-curr_buff)');
set(gca,'FontSize',14); set(gca,'FontName','Arial');
grid on;
legend('simulated','experimental');
xlabel('Time (s)'), ylabel('Current (A)');
title('Ru - 200\muM - 0.005 Hz');
print ('Ru_Comp','-depsc');

figure()
plot(t, (curr_exp-curr_buff).*5','x');
hold on;
% plot(t, curr_sim2(6001:8000));
% hold on;
plot(t,(curr_exp2-curr_buff)','o');
set(gca,'FontSize',14); set(gca,'FontName','Arial');
grid on;
legend('(200\muM)*5 - Fc','1000\muM - Fc');
xlabel('Time (s)'), ylabel('Current (A)');
title('Homogeneity Property');
print ('homogeneityFinal','-depsc');




curr_buff = readmatrix("Data.xlsx","Sheet","Buffer","Range","AA6006:AA8005");
curr_Fc = readmatrix("Data.xlsx","Sheet","Buffer-Fc","Range","AA6006:AA8005");
curr_Ru = readmatrix("Data.xlsx","Sheet","Buffer-Ru","Range","AA6006:AA8005");
curr_FcRu = readmatrix("Data.xlsx","Sheet","Buffer-Fc-Ru","Range","AA6006:AA8005");

% curr_buff = readmatrix("Data.xlsx","Sheet","Buffer","Range","AK6006:AK8005");
% curr_Fc = readmatrix("Data.xlsx","Sheet","Buffer-Fc","Range","AK6006:AK8005");
% curr_Ru = readmatrix("Data.xlsx","Sheet","Buffer-Ru","Range","AK6006:AK8005");
% curr_FcRu = readmatrix("Data.xlsx","Sheet","Buffer-Fc-Ru","Range","AK6006:AK8005");

% curr1 = ((curr_Fc./2) + (curr_Ru./2));
% curr2 = curr_FcRu - (curr_buff./2);
curr1 = ((curr_Fc-curr_buff)./2) + ((curr_Ru-curr_buff)./2);
curr2 = (curr_FcRu - curr_buff)./2;
t=0:0.1:199.9;
figure()
plot(t, curr1','x');
hold on;
% plot(t, curr_sim2(6001:8000));
% hold on;
plot(t,curr2','o');
set(gca,'FontSize',14); set(gca,'FontName','Arial');
grid on;
legend('(Fc)+(Ru)','(Fc+Ru)','FontSize',14);
xlabel('Time (s)'), ylabel('Current (A)');
title('Additivity Property');
print ('additivityFinal','-depsc');


