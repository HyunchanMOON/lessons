clear; clc;
tic
A = zeros(1000,1000);
for i = 1:1000
    for j = 1:1000
        A(j, i) = i *j;
    end
end
toc