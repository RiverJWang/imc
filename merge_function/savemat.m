function [ output_args ] = savemat( fileNames , path )
%UNTITLED5 此处显示有关此函数的摘要
%   此处显示详细说明
%读取向量里的txt文件地址，并保存成mat格式
% len_fileNames = length(fileNames);
a = 0;     %计数器
for i = 1 : length( fileNames )
%    i = 1;
    a = a + 1; %计数器
%     data = zeros(31064661,3);
    tempname = fileNames(i); %读取第一个文件名part1
    %--------------------
    temp = fileNames(i); %读取第一个文件名
    temp = temp{1}; %将cell转换成char
%     a = length( temp );
%     a = a - 4;
%     (1:a)
    temp = temp(1:14); %取前17个字符 %%%根据名字来%%！！！！
    %----------------------
    tempname = strcat(path,tempname); %加上绝对路径
    tempname = tempname{1};  %将cell转换成char
    data = importdata(tempname);
    data(1) = [];
    temp = strcat(temp,'.mat');
    save(temp,'data');
    clear data;
end

