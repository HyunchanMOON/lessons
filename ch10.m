% ch10 
clear; clc;

%input functions

% n = input('Input a Number') % input �Լ��� ���ڸ� �޴´�.
% n = input('Input a Text', 's') % text �޴� ��
% n = inputdlg('Input Data') % GUI input
% n = menu('Select a color', 'Red', 'Green', 'Blue')

%output functions
A = magic(3);
B = 'MATLAB';

% disp(A) %������ �׳� ������ش�.
% disp(B) % disp c�� print ���� �Լ�

% msgbox(B)
% warning(B)
% warndlg(B)
% errordlg(B)

%������
k = input('Enter a number between 2 and 9 >>');
n2 = (1:9)';
result = (k .* n2);
disp( string(num2str(k) + "X" + num2str(n2) + " = " + num2str(result)))

%% if-else, switch-case
clear; clc;

k = input('Input a Number')

% if n > 10
%     disp('n is bigger than 10')
% elseif n ==10
%     disp('n is 10')
% else
%     disp('n sis smaller than 10')
%     
% end

if mod(k,2) == 0
    disp('¦��')
else
    disp('Ȧ��')
end

%%
clear; clc;
A = magic(3);
k = menu('Select Plot Type', 'Plot', 'Area', 'Stem', 'Stairs')
switch k
    case {1, 2, 5, 7} %���� �������� �ϳ��� Case�� �־��ٶ� �߰�ȣ
        plot(A)
    case 2
        area(A)
    case 3
        stem(A)
    otherwise
        stairs(A)
end
% if c == 1
%     plot(A)
% else if c==2
%         area(A)
%     else if c ==3
%             stem(A)
%         else
%             stairs(A)
%         end
%     end
% end


%% �ݺ���!
clear; clc;

%for-loop, while-loop

% n = input('number?');
k = 0;
% for i = 1:9
%     disp([num2str(n), 'X', num2str(i), ' = ', num2str(n*i)])
% end

% for i = [3, 5, 6, 1, 3, 3, 5, 6, 8]
%     disp(i)
% end


% while k < 9 
%      k = k+1;
%     disp([num2str(n), 'X', num2str(k), ' = ', num2str(n*k)])
%     
% end

% while n < 10 
%     disp(n)
%  
%     if n == 5
%  %       break; %���� ���� �ݺ����� ��������
%         continue; %�Ʒ��� �������� �ʰ� ó������ ���ư� (for loop i ���� �ٲ�)
%     end
%     n = n+1;
% end


x = randi([1, 100]);

% k = 5;
% while true
%    n = input('guess?');
%        if n > x
%         disp('down')
%     elseif n < x
%         disp('up')
%     else
%         disp('correct')
%         break;
%        end
%     k = k-1;
%     if k ==0;
%         disp('you failed')
%         break;
%     end
% end

%%
clear; clc;
data = dlmread('gasprices.csv',',', 5,0);

% length(data)
% size(data)% size(n , 1) 1 : �ళ��, 2 :������

for i = 1:size(data,1)
    if data(i, 2) >2
        disp(data(i,1))
    end
end

%% 1���� 100���� �ձ��ϱ�
clear;clc;
s = 0;
for i = 1:100
    s = s + i;
end
disp(s)

% 1���� 100���� Ȧ����, ¦���� ���� ���ϱ�

evenSum = 0;
oddSum = 0;

for i = 1:100
    if mod(i,2) == 0
        evenSum = evenSum + i
    else 
        oddSum = oddSum + i
    end
end
disp(evenSum)
disp(oddSum)

%%
clear; clc;
for i = 2:9
    disp(['--',num2str(i),'�� ����','--'])
     for j = 1:9
         disp([num2str(i), 'X', num2str(j), ' = ', num2str(i*j)])
         end
end


