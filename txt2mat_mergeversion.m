%%
% 读取文件名，存为向量
path = 'D:\aData\戚墅堰故障齿轮箱\2018-5-28已整理数据\重度冲击截取20SMAT格式\2.戚墅堰垂纵重滚加中度外环冲击_20180529\';
fileFolder = fullfile(path);%文件夹名plane
dirOutput = dir(fullfile(fileFolder,'*.txt'));%如果存在不同类型的文件，用‘*’读取所有，如果读取特定类型文件，'.'加上文件类型，例如用‘.jpg’
fileNames = {dirOutput.name}'; %fileNames是cell

%%
%读取向量里的文件数据
% len_fileNames = length(fileNames);
a = 0;     %计数器
for i = 1:15
    i = 1;
    a = a + 1; %计数器
%     data = zeros(31064661,3);
    tempname = fileNames(i); %读取第一个文件名part1
    temp = fileNames(i); %读取第一个文件名
    temp = temp{1}; %将cell转换成char
    temp = temp(1:14); %取前17个字符
    tempname = strcat(path,tempname); %加上绝对路径
    tempname = tempname{1};  %将cell转换成char
    dataa = importdata(tempname);
    
    tempname = fileNames(i+1); %读取第一个文件名part2
    temp = fileNames(i+1); %读取第一个文件名
    temp = temp{1}; %将cell转换成char
    temp = temp(1:17); %取前17个字符
    tempname = strcat('D:\aData\2018-5-10_crh5_gearbox\vib_all\',tempname); %加上绝对路径
    tempname = tempname{1};  %将cell转换成char
    datab = importdata(tempname);
    
    if a==1
        data1 = [dataa;datab];
        save('data1.mat','data1');
%     data(:,a) = [dataa;datab]; %拼接第一个和第二个
    elseif a==2
        data2 = [dataa;datab];
        save('data2.mat','data2');
    elseif a==3
        data3 = [dataa;datab];
        save('data3.mat','data3');
    end
    clear dataa;
    clear datab;
end

