function [ output_args ] = hyxt( data )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
h=abs(hilbert(data)); %希尔伯特变换求包络
h=h-mean(h);          %包络去均值
ff=abs(fft(h));       %求包络的傅里叶变换
fs=100000;            %采样频率
ff=ff(1:end/2);       %取单边谱
ff=ff/length(ff);     %求幅值
N=length(data);
f=0:fs/N:fs/2-fs/N;   %频率间隔
plot(f,ff);           %绘图
% xlim([0,1000]);
xlabel('频率(Hz)');
ylabel('幅值(g/Hz)');
title(' ')


end

