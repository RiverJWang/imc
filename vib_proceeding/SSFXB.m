%%
clear;
clc;
%%
load G:\CRH5动车组传动系统\matlab资料程序\小波\dtcwpt_filters_long.mat;
fs=10000;
max_level=3;
jindu=0;   
B=cell(1,1);
tzfz_fz=ones(1,1);
path='G:\170620--戚所轴承故障实验\第四次试验--中度外环补做（故障在6点钟方向）\数据\加速度值'
x0=dir(path);
L0=length(x0);
for k0=3:L0
    path1=strcat(path,'\',x0(k0).name);
    x1=dir(path1);
    L1=length(x1);
    for k1=3:L1
        path2=strcat(path1,'\',x1(k1).name);
        data=importdata(path2);
        data=data';
        data=data-mean(data);
        jindu=jindu+1;
        disp(jindu);
        
        savepath=strcat('G:\170620--戚所轴承故障实验\第四次试验--中度外环补做（故障在6点钟方向）\结果','\',x0(k0).name(1:end),'\',x1(k1).name(1:end-4));
        if exist(savepath,'file')==0
            mkdir(savepath);
        end
        %%
        figure
        tt=0:1/fs:(length(data)-1)/fs;
        plot(tt,data);
        set(gcf,'Position',[300 300 800 400]);
        t_0=strcat(x0(k0).name(5:end),'-',x1(k1).name(1:end-4),'时域图');
        title(t_0);
        
        savepath0=strcat(savepath,'\','时域图','.fig');
        saveas(gcf,savepath0);
        %%
        %小波
%         y1 = DTWPT(data,first_1,h,f,max_level);
%         y2 = DTWPT(data,first_2,g,f,max_level);
%         result_7_1_1=dual_tree(y1,y2,first_1,first_2,h,g,f);
        result_7_1_1=dual_tree(data,first_1,first_2,h,g,f,max_level)
        for k=1:2^max_level
            r_1(:,k)=result_7_1_1(:,k);
            result_h_7_1_1(:,k)=abs(hilbert(result_7_1_1(:,k)));
            result_h_7_1_1(:,k)=result_h_7_1_1(:,k)-mean(result_h_7_1_1(:,k));
            [Pxx1,F1]=pwelch(result_h_7_1_1(:,k),hamming(10000),5000,[],fs);
            ff_h_7_1_1(:,k)=Pxx1;             %%%%%%%%%%要存
        end
        B{k1-2,1}=strcat(x1(k1).name(1:end-4));
        B{k1-2,2}=ff_h_7_1_1;
        r{k1-2,1}=strcat(x1(k1).name(1:end-4));
        r{k1-2,2}=r_1;
        
       %%
        figure
        set(gcf,'Position',[10 10 1200 800]);
        po=[0.06 0.755 0.43 0.18];
        for k=1:4
            ff_h=ff_h_7_1_1(:,k);
            subplot('Position',po)
            plot(F1,ff_h);                                   %%包络图所有层       %%%%%%要存
            t_1=strcat(x0(k0).name(5:end),'-',x1(k1).name(1:end-4));
            ylabel(strcat('D',num2str(k)));
            xlim([0 1000])
            po(2)=po(2)-0.23;
            switch k
                case 1
                    title(t_1);
                case 4
                    xlabel('频率/Hz');
            end
        end
        po=[0.55 0.755 0.43 0.18];
        for k=1:4
            ff_h=ff_h_7_1_1(:,k+4);
            subplot('Position',po)
            plot(F1,ff_h);                                   %%包络图所有层       %%%%%%要存
            xlim([0 1000])
            ylabel(strcat('D',num2str(k+4)))
            po(2)=po(2)-0.23;
            switch k
                case 4
                    xlabel('频率/Hz');
            end
        end
        savepath1=strcat(savepath,'\','ssfxb','.fig');
        saveas(gcf,savepath1);
       %%  分量信号频谱图
        ff=(0:length(result_7_1_1(:,k))-1)/length(result_7_1_1(:,k))*fs;
 
        for k=1:2^max_level
            result_7_1_1(:,k)=result_7_1_1(:,k)-mean(result_7_1_1(:,k));
            ff_result(:,k)=abs(fft(result_7_1_1(:,k)))*2/length(result_7_1_1(:,k));
        end
        figure
        set(gcf,'Position',[10 10 1200 800]);
        po=[0.06 0.755 0.43 0.18];
        for k=1:4
            ff_h=ff_result(:,k);
            subplot('Position',po)
            plot(ff(1:end/2),ff_h(1:end/2));                                   %%包络图所有层       %%%%%%要存
            ylabel(strcat('D',num2str(k)));
            po(2)=po(2)-0.23;
        end
        po=[0.55 0.755 0.43 0.18];
        for k=1:4
            ff_h=ff_result(:,k+4);
            subplot('Position',po)
            plot(ff(1:end/2),ff_h(1:end/2));                                     %%包络图所有层       %%%%%%要存
            ylabel(strcat('D',num2str(k+4)))
            po(2)=po(2)-0.23;
        end
        savepath00=strcat(savepath,'\','分量信号频谱图','.fig');
        saveas(gcf,savepath00);
        %%
        noverlap=5000;
        nfft=[];
        hh=abs(hilbert(data));
        hh=hh-mean(hh);
        [Pxx,F]=pwelch(hh,hamming(10000),noverlap,nfft,fs);
        figure
        plot(F,Pxx);
        set(gcf,'Position',[300 300 800 400]);
        t_2=strcat(x0(k0).name(5:end),'-',x1(k1).name(1:end-4),'包络信号功率谱图');
        title(t_2);
        
        savepath2=strcat(savepath,'\','包络功率谱','.fig');
        saveas(gcf,savepath2);
        %%
        [Pxx2,F2]=pwelch(data,hamming(10000),noverlap,nfft,fs);
        figure(3)
        plot(F2,Pxx2);
        set(gcf,'Position',[300 300 800 400]);
        t_3=strcat(x0(k0).name(5:end),'-',x1(k1).name(1:end-4),'功率谱图');
        title(t_3);
        
        savepath3=strcat(savepath,'\','功率谱','.fig');
        saveas(gcf,savepath3);
        %%
        B5678=B{k1-2,2}(:,5)+B{k1-2,2}(:,6)+B{k1-2,2}(:,7)+B{k1-2,2}(:,8);
        figure
        plot(F1,B5678);
        xlim([0 1000]);
        title(strcat(x0(k0).name(5:end),'-',x1(k1).name(1:end-4)));
        ylabel('幅值/g');
        xlabel('频率/Hz');
        set(gcf,'position',[300 300 800 500 ])
        
        savepath4=strcat(savepath,'\','ssfxb(后四层叠加)','.fig');
        saveas(gcf,savepath4);
        
        clear data
        close all
    end
    savepath5=strcat('G:\170620--戚所轴承故障实验\第四次试验--中度外环补做（故障在6点钟方向）\结果\DTWPT分量包络功率谱','\',x0(k0).name(1:end),'B');
    if exist(savepath5,'file')==0
        mkdir(savepath5);
    end
    save(savepath5,'B');
    
    savepath6=strcat('G:\170620--戚所轴承故障实验\第四次试验--中度外环补做（故障在6点钟方向）\结果\DTWPT分量','\',x0(k0).name(1:end),'r_1');
    if exist(savepath6,'file')==0
        mkdir(savepath6);
    end
    save(savepath6,'r_1');
end

 



         