clear; clc;

x = 10
y = single(x)

% data Type�� �̸��� �Լ�ó�� ��밡��!!

z = single(100)
z = int32(100)

x = 123.45
y = int32(x)

%Matlab Under/Overflow �����ִ�.

%%
clear; clc;

datetime %����ð�
d = datetime

d2 = datetime(2020, 8, 30)

d2
d2 - d
dur = d2 - d

years(dur)
hours(dur)
days(dur)


