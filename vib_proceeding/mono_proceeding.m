%%
clear;
clc;
%%
load D:\DDesktop\z��Ө\dtcwpt\dtcwpt_filters_long.mat;
fs=10000;
max_level=3;
 
B=cell(1,1);
tzfz_fz=ones(1,1);

% data=importdata('100km.mat');  %%��������
data=data';
% data=data-mean(data);

      
%%  �����ź�ʱ��ͼ
figure
tt=0:1/fs:(length(data)-1)/fs;
plot(tt,data);
set(gcf,'Position',[300 300 800 400]);
title('ʱ��ͼ');
%%  ˫����С���ֽ�

y1 = DTWPT(data,first_1,h,f,max_level);
y2 = DTWPT(data,first_2,g,f,max_level);
result_data=dual_tree(y1,y2,first_1,first_2,h,g,f);
% result_7_1_1=dual_tree(data,first_1,first_2,h,g,f,max_level)
for k=1:2^max_level
    r_1(:,k)=result_data(:,k);
    result_h_(:,k)=abs(hilbert(result_data(:,k)));
    result_h_(:,k)=result_h_(:,k)-mean(result_h_(:,k));
    [Pxx1,F1]=pwelch(result_h_(:,k),hamming(10000),5000,[],fs);
    ff_pwelch(:,k)=Pxx1;             
end
B{1,1}=strcat('�ֽ�����������');
B{1,2}= ff_pwelch;                                        %%�ֽ���������׵Ľ��    Ҫ���棡����
r{1,1}=strcat('�ֽ�����');
r{1,2}=r_1;                                               %%�ֽ���      Ҫ���棡����
        
%%      ����˫����С���ֽ�ͼ
figure
set(gcf,'Position',[10 10 1200 800]);
po=[0.06 0.755 0.43 0.18];
for k=1:4
    ff_h=ff_pwelch(:,k);
    subplot('Position',po)
    plot(F1,ff_h);
    t_1='˫����С������������ͼ';
    ylabel(strcat('D',num2str(k)));
    xlim([0 1000])
    po(2)=po(2)-0.23;
    switch k
        case 1
            title(t_1);
        case 4
            xlabel('Ƶ��/Hz');
    end
end
po=[0.55 0.755 0.43 0.18];
for k=1:4
    ff_h=ff_pwelch(:,k+4);
    subplot('Position',po)
    plot(F1,ff_h);                                   %%����ͼ���в�       %%%%%%Ҫ��
    xlim([0 1000])
    ylabel(strcat('D',num2str(k+4)))
    po(2)=po(2)-0.23;
    switch k
        case 4
            xlabel('Ƶ��/Hz');
    end
end
       
%% �����źŹ�����ͼ
noverlap=5000;
nfft=[];
hh=abs(hilbert(data));
hh=hh-mean(hh);
[Pxx,F]=pwelch(hh,hamming(10000),noverlap,nfft,fs);
figure
plot(F,Pxx);
set(gcf,'Position',[300 300 800 400]);
t_2='�����źŹ�����ͼ';
title(t_2);

%%  ԭ�źŵĹ�����ͼ
[Pxx2,F2]=pwelch(data,hamming(10000),noverlap,nfft,fs);
figure(3)
plot(F2,Pxx2);
set(gcf,'Position',[300 300 800 400]);
t_3='������ͼ';
title(t_3);

%%  ˫����С����4�����
B5678=B{1,2}(:,5)+B{1,2}(:,6)+B{1,2}(:,7)+B{1,2}(:,8);           %���Ĳ���ӽ��  Ҫ���棡����
figure
plot(F1,B5678);
xlim([0 1000]);
title('˫����С����4�����ͼ');
ylabel('��ֵ/g');
xlabel('Ƶ��/Hz');
set(gcf,'position',[300 300 800 500 ])
    


 



         