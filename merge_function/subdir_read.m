function [ paths ] = subdir_read( maindir )
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   maindir ���ļ���·����paths�Ǹ��ļ����µ����ļ���cell
%��ȡ���ļ���������Ϊ����

% maindir = 'D:\aData\�����߹��ϳ�����\2018-5-28����������\�ضȳ����ȡ20SMAT��ʽ\';
subdir = dir( maindir ); % ���ļ�cell�ṹ��
subdirname = {subdir.name}'; %ȡ���ṹ���е�name��ע��ת��Ϊ��������
subdirname(1:2) = []; % ȥ�� '.'�� '..'
paths = {}; %����Ԫ�����飬�Ա㴢��char����
for i = 1 :length( subdirname )
    tempsub = subdirname(i);
    tempsub = tempsub{1};
    tempsubname = strcat(maindir,tempsub,'\');
    paths{i,1} = tempsubname;
end
% for i = 1 : length( subdir )
%     if( isequal( subdir( i ).name, '.' )||...
%         isequal( subdir( i ).name, '..')||...
%         ~subdir( i ).isdir)               % �������Ŀ¼������
%         continue;
%     end
% end
% ctrl+r ע�ͣ�ctrl+t ȡ��ע��

end

