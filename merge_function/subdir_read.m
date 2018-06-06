function [ paths ] = subdir_read( maindir )
%UNTITLED3 此处显示有关此函数的摘要
%   maindir 是文件夹路径，paths是该文件夹下的子文件夹cell
%读取子文件夹名，存为向量

% maindir = 'D:\aData\戚墅堰故障齿轮箱\2018-5-28已整理数据\重度冲击截取20SMAT格式\';
subdir = dir( maindir ); % 子文件cell结构体
subdirname = {subdir.name}'; %取出结构体中的name，注意转置为列向量；
subdirname(1:2) = []; % 去除 '.'和 '..'
paths = {}; %创建元胞数组，以便储存char类型
for i = 1 :length( subdirname )
    tempsub = subdirname(i);
    tempsub = tempsub{1};
    tempsubname = strcat(maindir,tempsub,'\');
    paths{i,1} = tempsubname;
end
% for i = 1 : length( subdir )
%     if( isequal( subdir( i ).name, '.' )||...
%         isequal( subdir( i ).name, '..')||...
%         ~subdir( i ).isdir)               % 如果不是目录则跳过
%         continue;
%     end
% end
% ctrl+r 注释；ctrl+t 取消注释

end

