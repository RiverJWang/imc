h=abs(hilbert(data)); %ϣ�����ر任�����
h=h-mean(h);          %����ȥ��ֵ
ff=abs(fft(h));       %�����ĸ���Ҷ�任
fs=100000;            %����Ƶ��
ff=ff(1:end/2);       %ȡ������
ff=ff/length(ff);     %���ֵ
N=length(data);
f=0:fs/N:fs/2-fs/N;   %Ƶ�ʼ��
plot(f,ff);           %��ͼ
% xlim([0,1000]);
xlabel('Ƶ��(Hz)');
ylabel('��ֵ(g/Hz)');
title(' ')

%%
clear all;clc;
%%
var(data1)
var(data2)
var(data3)
var(data4)
var(data5)
%%
hyxt(data1);
hold on;
hyxt(data2);
hold on;
hyxt(data3);
hold on;
hyxt(data4);
hold on;
hyxt(data5);
hold on;
legend('1','2','3','4','5')