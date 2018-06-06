clear all;clc;
maindir = 'D:\aData\戚墅堰故障齿轮箱\2018-5-28已整理数据\重度冲击截取20SMAT格式\';
paths = subdir_read( maindir ); % 读取里面的子文件夹，并存为cell
%%
% 依次读取每一个子文件里面的txt文件
 for i = 1 : length( paths )
%     i = 1;

    path = paths( i );  %取出第i个元胞

    path = path{ 1 };  %cell 2 char

    fileNames = monodir_read( path ); % 读取一个子文件夹里面的所有文件，存为向量

    savemat( fileNames ,path ); % 读取一个向量里面的绝对路径（包含txt文件），并在该路径下存为.mat
    
    fprintf('处理完成第%d个\n',i)
 end