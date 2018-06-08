clear;
clc;

path='G:\170620--戚所轴承故障实验\第四次试验--中度外环补做（故障在6点钟方向）\结果\DTWPT分量包络功率谱'
x=dir(path);
L=length(x);
for k=3:L
    path1=strcat(path,'\',x(k).name);
    data=load(path1);
    for i=1:length(data.B)
        data1=data.B{i,2}(:,5)+data.B{i,2}(:,6)+data.B{i,2}(:,7)+data.B{i,2}(:,8);
        
        savepath=strcat('G:\170620--戚所轴承故障实验\第四次试验--中度外环补做（故障在6点钟方向）\结果\5678层相加');
        if exist(savepath,'file')==0
            mkdir(savepath);
        end
        savepath_1=strcat(savepath,'\',x(k).name(5:10),data.B{i,1});
        save(savepath_1,'data1');
    end
end

%%
clear
clc
load('G:\170620--戚所轴承故障实验\第四次试验--中度外环补做（故障在6点钟方向）\程序\F1');
path='G:\170620--戚所轴承故障实验\第四次试验--中度外环补做（故障在6点钟方向）\结果\5678层相加';
d1=load(strcat(path,'\','1号测点垂向300km.mat'));
d2=load(strcat(path,'\','2号测点纵向300km.mat'));
d3=load(strcat(path,'\','3号测点垂向300km.mat'));
d4=load(strcat(path,'\','4号测点纵向300km.mat'));
figure
set(gcf,'Position',[300 300 800 400]);
plot(F1,d1.data1,'r');
hold on
plot(F1,d2.data1,'b');
plot(F1,d3.data1,'k');
plot(F1,d4.data1,'g');
hold off
xlim([0 1000]);
legend('测点1垂向','测点2纵向','测点3垂向','测点4纵向');
title('300km/h');
ylabel('幅值/g');
xlabel('频率/Hz');
savepath_1=strcat('G:\170620--戚所轴承故障实验\第四次试验--中度外环补做（故障在6点钟方向）\结果\5678层相加图','\','垂纵300','.fig')
saveas(gcf,savepath_1);
%%
clear
clc
load('G:\170620--戚所轴承故障实验\第四次试验--中度外环补做（故障在6点钟方向）\程序\F1');
path='G:\170620--戚所轴承故障实验\第四次试验--中度外环补做（故障在6点钟方向）\结果\5678层相加';
d1=load(strcat(path,'\','1号测点横向300km.mat'));
d2=load(strcat(path,'\','2号测点横向300km.mat'));
d3=load(strcat(path,'\','3号测点横向300km.mat'));
d4=load(strcat(path,'\','4号测点横向300km.mat'));
figure
set(gcf,'Position',[300 300 800 400]);
plot(F1,d1.data1,'r');
hold on
plot(F1,d2.data1,'b');
plot(F1,d3.data1,'k');
plot(F1,d4.data1,'g');
hold off
xlim([0 1000]);
legend('测点1横向','测点2横向','测点3横向','测点4横向');
title('300km/h');
ylabel('幅值/g');
xlabel('频率/Hz');
savepath_1=strcat('G:\170620--戚所轴承故障实验\第四次试验--中度外环补做（故障在6点钟方向）\结果\5678层相加图','\','横向300','.fig')
saveas(gcf,savepath_1);
    
    
    
    
    
    
