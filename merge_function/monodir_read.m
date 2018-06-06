function [ fileNames ] = monodir_read( path )
%UNTITLED % 读取单个文件夹下的文件名，存为向量
%   单个文件夹下的文件读取 输入文件夹路径，输出该文件夹下的文件数组。

cd(path); %设置当前工作路径
fileFolder = fullfile(path);%文件夹名plane
dirOutput = dir(fullfile(fileFolder,'*.txt'));%如果存在不同类型的文件，用‘*’读取所有，如果读取特定类型文件，'.'加上文件类型，例如用‘.jpg’
fileNames = {dirOutput.name}'; %fileNames是cell

end

