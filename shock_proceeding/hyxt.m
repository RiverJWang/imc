function [ output_args ] = hyxt( data )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
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


end

