function [ output_args ] = savemat( fileNames , path )
%UNTITLED5 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%��ȡ�������txt�ļ���ַ���������mat��ʽ
% len_fileNames = length(fileNames);
a = 0;     %������
for i = 1 : length( fileNames )
%    i = 1;
    a = a + 1; %������
%     data = zeros(31064661,3);
    tempname = fileNames(i); %��ȡ��һ���ļ���part1
    %--------------------
    temp = fileNames(i); %��ȡ��һ���ļ���
    temp = temp{1}; %��cellת����char
%     a = length( temp );
%     a = a - 4;
%     (1:a)
    temp = temp(1:14); %ȡǰ17���ַ� %%%����������%%��������
    %----------------------
    tempname = strcat(path,tempname); %���Ͼ���·��
    tempname = tempname{1};  %��cellת����char
    data = importdata(tempname);
    data(1) = [];
    temp = strcat(temp,'.mat');
    save(temp,'data');
    clear data;
end

