clear all;clc;
maindir = 'D:\aData\�����߹��ϳ�����\2018-5-28����������\�ضȳ����ȡ20SMAT��ʽ\';
paths = subdir_read( maindir ); % ��ȡ��������ļ��У�����Ϊcell
%%
% ���ζ�ȡÿһ�����ļ������txt�ļ�
 for i = 1 : length( paths )
%     i = 1;

    path = paths( i );  %ȡ����i��Ԫ��

    path = path{ 1 };  %cell 2 char

    fileNames = monodir_read( path ); % ��ȡһ�����ļ�������������ļ�����Ϊ����

    savemat( fileNames ,path ); % ��ȡһ����������ľ���·��������txt�ļ��������ڸ�·���´�Ϊ.mat
    
    fprintf('������ɵ�%d��\n',i)
 end