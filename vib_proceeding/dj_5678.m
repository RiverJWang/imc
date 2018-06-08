clear;
clc;

path='G:\170620--������й���ʵ��\���Ĵ�����--�ж��⻷������������6���ӷ���\���\DTWPT�������繦����'
x=dir(path);
L=length(x);
for k=3:L
    path1=strcat(path,'\',x(k).name);
    data=load(path1);
    for i=1:length(data.B)
        data1=data.B{i,2}(:,5)+data.B{i,2}(:,6)+data.B{i,2}(:,7)+data.B{i,2}(:,8);
        
        savepath=strcat('G:\170620--������й���ʵ��\���Ĵ�����--�ж��⻷������������6���ӷ���\���\5678�����');
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
load('G:\170620--������й���ʵ��\���Ĵ�����--�ж��⻷������������6���ӷ���\����\F1');
path='G:\170620--������й���ʵ��\���Ĵ�����--�ж��⻷������������6���ӷ���\���\5678�����';
d1=load(strcat(path,'\','1�Ų�㴹��300km.mat'));
d2=load(strcat(path,'\','2�Ų������300km.mat'));
d3=load(strcat(path,'\','3�Ų�㴹��300km.mat'));
d4=load(strcat(path,'\','4�Ų������300km.mat'));
figure
set(gcf,'Position',[300 300 800 400]);
plot(F1,d1.data1,'r');
hold on
plot(F1,d2.data1,'b');
plot(F1,d3.data1,'k');
plot(F1,d4.data1,'g');
hold off
xlim([0 1000]);
legend('���1����','���2����','���3����','���4����');
title('300km/h');
ylabel('��ֵ/g');
xlabel('Ƶ��/Hz');
savepath_1=strcat('G:\170620--������й���ʵ��\���Ĵ�����--�ж��⻷������������6���ӷ���\���\5678�����ͼ','\','����300','.fig')
saveas(gcf,savepath_1);
%%
clear
clc
load('G:\170620--������й���ʵ��\���Ĵ�����--�ж��⻷������������6���ӷ���\����\F1');
path='G:\170620--������й���ʵ��\���Ĵ�����--�ж��⻷������������6���ӷ���\���\5678�����';
d1=load(strcat(path,'\','1�Ų�����300km.mat'));
d2=load(strcat(path,'\','2�Ų�����300km.mat'));
d3=load(strcat(path,'\','3�Ų�����300km.mat'));
d4=load(strcat(path,'\','4�Ų�����300km.mat'));
figure
set(gcf,'Position',[300 300 800 400]);
plot(F1,d1.data1,'r');
hold on
plot(F1,d2.data1,'b');
plot(F1,d3.data1,'k');
plot(F1,d4.data1,'g');
hold off
xlim([0 1000]);
legend('���1����','���2����','���3����','���4����');
title('300km/h');
ylabel('��ֵ/g');
xlabel('Ƶ��/Hz');
savepath_1=strcat('G:\170620--������й���ʵ��\���Ĵ�����--�ж��⻷������������6���ӷ���\���\5678�����ͼ','\','����300','.fig')
saveas(gcf,savepath_1);
    
    
    
    
    
    
