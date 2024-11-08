% p_1 = load('CurrentValues/run2/ip_n_1e-11.mat').ip_n;
% p_2 = load('CurrentValues/run2/ip_n_1e-12.mat').ip_n;
% p_3 = load('CurrentValues/run2/ip_n_1e-13.mat').ip_n;
% p_4 = load('CurrentValues/run2/ip_n_1e-14.mat').ip_n;
% p_5 = load('CurrentValues/run2/ip_n_1e-15.mat').ip_n;
% p_6 = load('CurrentValues/run2/ip_n_5e-11.mat').ip_n;
% p_7 = load('CurrentValues/run2/ip_n_5e-12.mat').ip_n;
% p_8 = load('CurrentValues/run2/ip_n_5e-13.mat').ip_n;
% p_9 = load('CurrentValues/run2/ip_n_5e-14.mat').ip_n;
% p_10 = load('CurrentValues/run2/ip_n_5e-15.mat').ip_n;

p_1 = load('run2Data/CurrentValues/forMI/ip_n_1e-15.mat').ip_n;
p_2 = load('run2Data/CurrentValues/forMI/ip_n_1.1e-15.mat').ip_n;
p_3 = load('run2Data/CurrentValues/forMI/ip_n_1.2e-15.mat').ip_n;
p_4 = load('run2Data/CurrentValues/forMI/ip_n_1.3e-15.mat').ip_n;
p_5 = load('run2Data/CurrentValues/forMI/ip_n_1.4e-15.mat').ip_n;
p_6 = load('run2Data/CurrentValues/forMI/ip_n_1.5e-15.mat').ip_n;
p_7 = load('run2Data/CurrentValues/forMI/ip_n_1.6e-15.mat').ip_n;
p_8 = load('run2Data/CurrentValues/forMI/ip_n_1.7e-15.mat').ip_n;
p_9 = load('run2Data/CurrentValues/forMI/ip_n_1.8e-15.mat').ip_n;
p_10 = load('run2Data/CurrentValues/forMI/ip_n_1.9e-15.mat').ip_n;

p_1 = p_1';p_2 = p_2';p_3 = p_3';p_4 = p_4';p_5 = p_5';
p_6 = p_6';p_7 = p_7';p_8 = p_8';p_9 = p_9';p_10 = p_10';

% p_1 = abs(p_1);p_2 = abs(p_2);p_3 = abs(p_3);p_4 = abs(p_4);p_5 = abs(p_5);
% p_6 = abs(p_6);p_7 = abs(p_7);p_8 = abs(p_8);p_9 = abs(p_9);p_10 = abs(p_10);
% 
% p_1 = log10(p_1);p_2 = log10(p_2);p_3 = log10(p_3);p_4 = log10(p_4);p_5 = log10(p_5);
% p_6 = log10(p_6);p_7 = log10(p_7);p_8 = log10(p_8);p_9 = log10(p_9);p_10 = log10(p_10);
% 
% p_1 = abs(p_1);p_2 = abs(p_2);p_3 = abs(p_3);p_4 = abs(p_4);p_5 = abs(p_5);
% p_6 = abs(p_6);p_7 = abs(p_7);p_8 = abs(p_8);p_9 = abs(p_9);p_10 = abs(p_10);

% siz = zeros(9,1);
% siz(1,1) = size(p_1,1);siz(2,1) = size(p_2,1);
% siz(3,1) = size(p_3,1);siz(4,1) = size(p_4,1);
% siz(5,1) = size(p_5,1);siz(6,1) = size(p_6,1);
% siz(7,1) = size(p_7,1);siz(8,1) = size(p_8,1);
% siz(9,1) = size(p_9,1);
% n = min(siz);

% pp_arr = horzcat(p_1,p_2,p_3,p_4,p_5,p_6,p_7,p_8,p_9);
pp = vertcat(p_1,p_2,p_3,p_4,p_5,p_6,p_7,p_8,p_9,p_10);
% pp = abs(pp);
pp_u = unique(pp);
n = size(pp,1);
sig = sqrt((6*(n-2))/((n+1)*(n+3)));
skw = abs(getSkewness(pp));
binC = ceil(1 + log2(n) + log2(1+(skw/sig)));
binW = (max(pp)-min(pp))/binC;
binEdges = 0:1:binC;
binEdges = binEdges.*binW;
binEdges = binEdges + min(pp);
binH = getCount(pp,binEdges);
pdfY = binH./n;


% n1 = size(p_1,1);
% sig1 = sqrt((6*(n1-2))/((n1+1)*(n1+3)));
% skw1 = abs(getSkewness(p_1));
% binC1 = ceil(1 + log2(n1) + log2(1+(skw1/sig1)));
% binW1 = (max(p_1)-min(p_1))/binC1;
% pdfy_1 = getPdf(p_1,binC1,binW1,n1);
% 
% n2 = size(p_2,1);
% sig2 = sqrt((6*(n2-2))/((n2+1)*(n2+3)));
% skw2 = abs(getSkewness(p_2));
% binC2 = ceil(1 + log2(n2) + log2(1+(skw2/sig2)));
% binW2 = (max(p_2)-min(p_2))/binC2;
% pdfy_2 = getPdf(p_2,binC2,binW2,n2);
% 
% n3 = size(p_3,1);
% sig3 = sqrt((6*(n3-2))/((n3+1)*(n3+3)));
% skw3 = abs(getSkewness(p_3));
% binC3 = ceil(1 + log2(n3) + log2(1+(skw3/sig3)));
% binW3 = (max(p_3)-min(p_3))/binC3;
% pdfy_3 = getPdf(p_3,binC3,binW3,n3);
% 
% n4 = size(p_4,1);
% sig4 = sqrt((6*(n4-2))/((n4+1)*(n4+3)));
% skw4 = abs(getSkewness(p_4));
% binC4 = ceil(1 + log2(n4) + log2(1+(skw4/sig4)));
% binW4 = (max(p_4)-min(p_4))/binC4;
% pdfy_4 = getPdf(p_4,binC4,binW4,n4);
% 
% n5 = size(p_5,1);
% sig5 = sqrt((6*(n5-2))/((n5+1)*(n5+3)));
% skw5 = abs(getSkewness(p_5));
% binC5 = ceil(1 + log2(n5) + log2(1+(skw5/sig5)));
% binW5 = (max(p_5)-min(p_5))/binC5;
% pdfy_5 = getPdf(p_5,binC5,binW5,n5);
% 
% n6 = size(p_6,1);
% sig6 = sqrt((6*(n6-2))/((n6+1)*(n6+3)));
% skw6 = abs(getSkewness(p_6));
% binC6 = ceil(1 + log2(n6) + log2(1+(skw6/sig6)));
% binW6 = (max(p_6)-min(p_6))/binC6;
% pdfy_6 = getPdf(p_6,binC6,binW6,n6);
% 
% n7 = size(p_7,1);
% sig7 = sqrt((6*(n7-2))/((n7+1)*(n7+3)));
% skw7 = abs(getSkewness(p_7));
% binC7 = ceil(1 + log2(n7) + log2(1+(skw7/sig7)));
% binW7 = (max(p_7)-min(p_7))/binC7;
% pdfy_7 = getPdf(p_7,binC7,binW7,n7);
% 
% n8 = size(p_8,1);
% sig8 = sqrt((6*(n8-2))/((n8+1)*(n8+3)));
% skw8 = abs(getSkewness(p_8));
% binC8 = ceil(1 + log2(n8) + log2(1+(skw8/sig8)));
% binW8 = (max(p_8)-min(p_8))/binC8;
% pdfy_8 = getPdf(p_8,binC8,binW8,n8);
% 
% n9 = size(p_9,1);
% sig9 = sqrt((6*(n9-2))/((n9+1)*(n9+3)));
% skw9 = abs(getSkewness(p_9));
% binC9 = ceil(1 + log2(n9) + log2(1+(skw9/sig9)));
% binW9 = (max(p_9)-min(p_9))/binC9;
% pdfy_9 = getPdf(p_9,binC9,binW9,n9);

n1 = size(p_1,1);
binH1 = getCount(p_1,binEdges);
pdfy_1 = binH1./n1;

n2 = size(p_2,1);
binH2 = getCount(p_2,binEdges);
pdfy_2 = binH2./n2;

n3 = size(p_3,1);
binH3 = getCount(p_3,binEdges);
pdfy_3 = binH3./n3;

n4 = size(p_4,1);
binH4 = getCount(p_4,binEdges);
pdfy_4 = binH4./n4;

n5 = size(p_5,1);
binH5 = getCount(p_5,binEdges);
pdfy_5 = binH5./n5;

n6 = size(p_6,1);
binH6 = getCount(p_6,binEdges);
pdfy_6 = binH6./n6;

n7 = size(p_7,1);
binH7 = getCount(p_7,binEdges);
pdfy_7 = binH7./n7;

n8 = size(p_8,1);
binH8 = getCount(p_8,binEdges);
pdfy_8 = binH8./n8;

n9 = size(p_9,1);
binH9 = getCount(p_9,binEdges);
pdfy_9 = binH9./n9;

n10 = size(p_10,1);
binH10 = getCount(p_10,binEdges);
pdfy_10 = binH10./n10;


% [gc_1,grps_1] = groupcounts(p_1);[gc_2,grps_2] = groupcounts(p_2);
% [gc_3,grps_3] = groupcounts(p_3);[gc_4,grps_4] = groupcounts(p_4);
% [gc_5,grps_5] = groupcounts(p_5);[gc_6,grps_6] = groupcounts(p_6);
% [gc_7,grps_7] = groupcounts(p_7);[gc_8,grps_8] = groupcounts(p_8);
% [gc_9,grps_9] = groupcounts(p_9);
% 
% P_ygivenx_1 = gc_1./size(p_1,1);P_ygivenx_2 = gc_1./size(p_2,1);
% P_ygivenx_3 = gc_1./size(p_3,1);P_ygivenx_4 = gc_1./size(p_4,1);
% P_ygivenx_5 = gc_1./size(p_5,1);P_ygivenx_6 = gc_1./size(p_6,1);
% P_ygivenx_7 = gc_1./size(p_7,1);P_ygivenx_8 = gc_1./size(p_8,1);
% P_ygivenx_9 = gc_1./size(p_9,1);

x_u = [1e-6, 1e-7, 1e-8, 1e-9, 1e-10, 1e-11, 1e-12, 1e-13, 1e-14, 1e-15];

% cond_mat = zeros(size(x_u,2),size(pp_u,1));

% ismember(2,A)
% [gc,grps] = groupcounts(pp);
% [gc_c,grps_c] = groupcounts(gc);

H_ygivenx_1 = getEntropy(pdfy_1);H_ygivenx_2 = getEntropy(pdfy_2);
H_ygivenx_3 = getEntropy(pdfy_3);H_ygivenx_4 = getEntropy(pdfy_4);
H_ygivenx_5 = getEntropy(pdfy_5);H_ygivenx_6 = getEntropy(pdfy_6);
H_ygivenx_7 = getEntropy(pdfy_7);H_ygivenx_8 = getEntropy(pdfy_8);
H_ygivenx_9 = getEntropy(pdfy_9);H_ygivenx_10 = getEntropy(pdfy_10);

H_YgivenX = (H_ygivenx_1 + H_ygivenx_2 + H_ygivenx_3 + H_ygivenx_4 + H_ygivenx_5 + H_ygivenx_6 + H_ygivenx_7 + H_ygivenx_8 + H_ygivenx_9 + H_ygivenx_10)/10;
% H_YgivenX = H_YgivenX + (log2(binW1)+log2(binW2)+log2(binW3)+log2(binW4)+log2(binW5)+log2(binW6)+log2(binW7)+log2(binW8)+log2(binW9))/9;

% [gc,grps] = groupcounts(pp);
% P_Y = gc./size(pp,1);
H_Y = getEntropy(pdfY);
% H_Y = H_Y + log2(binW);

% figure()
% stem(pdfY);
% 

% Smooth at this step is applying a moving average filter
pdfys_1 = smooth(pdfy_1);pdfys_2 = smooth(pdfy_2);
pdfys_3 = smooth(pdfy_3);pdfys_4 = smooth(pdfy_4);
pdfys_5 = smooth(pdfy_5);pdfys_6 = smooth(pdfy_6);
pdfys_7 = smooth(pdfy_7);pdfys_8 = smooth(pdfy_8);
pdfys_9 = smooth(pdfy_9);pdfys_10 = smooth(pdfy_10);

% f_1 = fit(binEdges',pdfys_1,'smoothingspline');f_2 = fit(binEdges',pdfys_2,'smoothingspline');
% f_3 = fit(binEdges',pdfys_3,'smoothingspline');f_4 = fit(binEdges',pdfys_4,'smoothingspline');
% f_5 = fit(binEdges',pdfys_5,'smoothingspline');f_6 = fit(binEdges',pdfys_6,'smoothingspline');
% f_7 = fit(binEdges',pdfys_7,'smoothingspline');f_8 = fit(binEdges',pdfys_8,'smoothingspline');
% f_9 = fit(binEdges',pdfys_9,'smoothingspline');f_10 = fit(binEdges',pdfys_10,'smoothingspline');

f_1 = csaps(binEdges,pdfys_1);f_2 = csaps(binEdges,pdfys_2);
f_3 = csaps(binEdges,pdfys_3);f_4 = csaps(binEdges,pdfys_4);
f_5 = csaps(binEdges,pdfys_5);f_6 = csaps(binEdges,pdfys_6);
f_7 = csaps(binEdges,pdfys_7);f_8 = csaps(binEdges,pdfys_8);
f_9 = csaps(binEdges,pdfys_9);f_10 = csaps(binEdges,pdfys_10);

% bb = -power(10,-binEdges);

% figure()
% plot(binEdges,pdfy_1);
% hold on;plot(binEdges,pdfy_2);
% hold on;plot(binEdges,pdfy_3);
% hold on;plot(binEdges,pdfy_4);
% hold on;plot(binEdges,pdfy_5);
% hold on;plot(binEdges,pdfy_6);
% hold on;plot(binEdges,pdfy_7);
% hold on;plot(binEdges,pdfy_8);
% hold on;plot(binEdges,pdfy_9);
% hold on;plot(binEdges,pdfy_10);
% set(gca,'FontSize',10); set(gca,'FontName','Arial');
% grid on;
% xlabel('I_{pa}'), ylabel('Probability Density');
% title('PDF for each concentration');
% legend('1.0fM','1.1fM','1.2fM','1.3fM','1.4fM','1.5fM','1.6fM','1.7fM','1.8fM','1.9fM');


% figure()
% plot(binEdges,pdfys_1);
% hold on;plot(binEdges,pdfys_2);
% hold on;plot(binEdges,pdfys_3);
% hold on;plot(binEdges,pdfys_4);
% hold on;plot(binEdges,pdfys_5);
% hold on;plot(binEdges,pdfys_6);
% hold on;plot(binEdges,pdfys_7);
% hold on;plot(binEdges,pdfys_8);
% hold on;plot(binEdges,pdfys_9);
% hold on;plot(binEdges,pdfys_10);
% set(gca,'FontSize',10); set(gca,'FontName','Arial');
% grid on;
% xlabel('I_{pa} (A)'), ylabel('Probability Density');
% title('PDF for each concentration');
% legend('1.0fM','1.1fM','1.2fM','1.3fM','1.4fM','1.5fM','1.6fM','1.7fM','1.8fM','1.9fM');

figure()
fnplt(f_1);
hold on;fnplt(f_2);
hold on;fnplt(f_3);
hold on;fnplt(f_4);
hold on;fnplt(f_5);
hold on;fnplt(f_6);
hold on;fnplt(f_7);
hold on;fnplt(f_8);
hold on;fnplt(f_9);
hold on;fnplt(f_10);
ylim([-0.002 0.2]);
set(gca,'FontSize',10); set(gca,'FontName','Arial');
grid on;
xlabel('I_{pa} (A)'), ylabel('Probability Density');
title('PDF for each concentration');
legend('1.0fM','1.1fM','1.2fM','1.3fM','1.4fM','1.5fM','1.6fM','1.7fM','1.8fM','1.9fM');
print ('run2Data/figures/MI_PD','-depsc');

% figure()
% histogram(p_1,'BinEdges',binEdges,'Normalization','pdf');
% hold on;histogram(p_2,'BinEdges',binEdges,'Normalization','pdf');
% hold on;histogram(p_3,'BinEdges',binEdges,'Normalization','pdf');
% hold on;histogram(p_4,'BinEdges',binEdges,'Normalization','pdf');
% hold on;histogram(p_5,'BinEdges',binEdges,'Normalization','pdf');
% hold on;histogram(p_6,'BinEdges',binEdges,'Normalization','pdf');
% hold on;histogram(p_7,'BinEdges',binEdges,'Normalization','pdf');
% hold on;histogram(p_8,'BinEdges',binEdges,'Normalization','pdf');
% hold on;histogram(p_9,'BinEdges',binEdges,'Normalization','pdf');
% hold on;histogram(p_10,'BinEdges',binEdges,'Normalization','pdf');
% set(gca,'FontSize',10); set(gca,'FontName','Arial');
% grid on;
% xlabel('-(log_{10}[-(I_{pa})])'), ylabel('Probability Density');
% title('PDF for each concentration');
% legend('1.0fM','1.1fM','1.2fM','1.3fM','1.4fM','1.5fM','1.6fM','1.7fM','1.8fM','1.9fM');



MI = H_Y - H_YgivenX;

save("run2Data/MI.mat",'MI');


function h = preEntropy(y)
    h = 0;
    if(y~=0)
        h = -y*(log2(y));
    end
end

function H = getEntropy(x)
    H = 0;
    for k = 1: size(x,1)
        H = H + preEntropy(x(k,1));
    end
end

function sk = getSkewness(g)
    m = mean(g);
    st = std(g);
    temp = (g-m)./st;
    temp = power(temp,3);
    sk = mean(temp);
end

function ht = getCount(arr,binE)
    binE_s = size(binE,2);
    ht = zeros(binE_s,1);
    for m = 1:size(arr)
        for n = 1:binE_s-1
            if(arr(m)>=binE(n) && arr(m)<binE(n+1))
                ht(n) = ht(n) + 1;
            end
        end
        if(arr(m)>=binE(binE_s))
            ht(binE_s) = ht(binE_s) + 1;
        end
    end
end

function pd = getPdf(p,C,W,n)
    Edges = 0:1:C-1;
    Edges = Edges.*W;
    Edges = Edges + min(p);
    binH = getCount(p,Edges);
    pd = binH./n;
end

% figure()
% bar(pdfY);
