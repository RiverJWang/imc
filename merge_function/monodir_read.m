function [ fileNames ] = monodir_read( path )
%UNTITLED % ��ȡ�����ļ����µ��ļ�������Ϊ����
%   �����ļ����µ��ļ���ȡ �����ļ���·����������ļ����µ��ļ����顣

cd(path); %���õ�ǰ����·��
fileFolder = fullfile(path);%�ļ�����plane
dirOutput = dir(fullfile(fileFolder,'*.txt'));%������ڲ�ͬ���͵��ļ����á�*����ȡ���У������ȡ�ض������ļ���'.'�����ļ����ͣ������á�.jpg��
fileNames = {dirOutput.name}'; %fileNames��cell

end

