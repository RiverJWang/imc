clear
clc

%�񶯵�ѹֵת���ٶ�ֵ
path='G:\170620--������й���ʵ��\���Ĵ�����--�ж��⻷������������6���ӷ���\����\��ѹֵ'
x0=dir(path);
L0=length(x0);
for k0=3:L0
    path1=strcat(path,'\',x0(k0).name);
    x1=dir(path1);
    L1=length(x1);
    for k1=3:L1
        path2=strcat(path1,'\',x1(k1).name);
        data=importdata(path2);
        a=x0(k0).name(3);
        switch a
            case '1'
                data=(data-mean(data))./0.0102
            case '2'
                data=(data-mean(data))./0.01011
            case '3'
                data=(data-mean(data))./0.01011
            case '4'
                data=(data-mean(data))./0.00986
            case '5'
                data=(data-mean(data))./0.01008
            case '6'
                data=(data-mean(data))./0.01002
            case '7'
                data=(data-mean(data))./0.01010
            case '8'
                data=(data-mean(data))./0.01010
        end
        savepath=strcat('G:\170620--������й���ʵ��\���Ĵ�����--�ж��⻷������������6���ӷ���\����\���ٶ�ֵ','\',x0(k0).name)
        if exist(savepath,'file')==0
            mkdir(savepath);
        end
        savepath1=strcat(savepath,'\',x1(k1).name(11:15))
        save(savepath1,'data')
        
        clear data
    end
end
%%
clear
clc
%�����ѹֵת���ٶ�ֵ
path='G:\170620--������й���ʵ��\2017-10-27\����\��ѹֵ\���'
x0=dir(path);
L0=length(x0);
for k0=3:L0
    path1=strcat(path,'\',x0(k0).name);
    x1=dir(path1);
    L1=length(x1);
    for k1=3:L1
        path2=strcat(path1,'\',x1(k1).name);
        data=importdata(path2);
        data=(data-mean(data))./0.002;
        
        savepath=strcat('G:\170620--������й���ʵ��\2017-10-27\����\�񶯼��ٶ�\���','\',x0(k0).name)
        if exist(savepath,'file')==0
            mkdir(savepath);
        end
        savepath1=strcat(savepath,'\',x1(k1).name(8:12))
        save(savepath1,'data')
        
        clear data
    end
end
        
        
        