clear; clc;

x = 10
y = single(x)

% data Type의 이름을 함수처럼 사용가능!!

z = single(100)
z = int32(100)

x = 123.45
y = int32(x)

%Matlab Under/Overflow 막혀있다.

%%
clear; clc;

datetime %현재시간
d = datetime

d2 = datetime(2020, 8, 30)

d2
d2 - d
dur = d2 - d

years(dur)
hours(dur)
days(dur)


