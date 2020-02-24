%% Height by Group
% Visually compare heights of different groups 

%% Load data
load healthdata

%% Extract height & categories for self view of weight
height = data.Height;
midx = (data.Sex=='M');
ow = categories(data.Overweight);
n = length(ow);

%% Plot distributions
% Make vector of height values for plotting
h = 130:0.1:220;
figure
hold on

%  For each level of self view (over/under/just right), plot height
%  distribution.  First men...
for k=1:n
    idx = midx & (data.Overweight==ow(k));
    fd = fitdist(height(idx),'normal');
    plot(h,pdf(fd,h))
end

%  ...then women
for k=1:n
    idx = ~midx & (data.Overweight==ow(k));
    fd = fitdist(height(idx),'normal');
    plot(h,pdf(fd,h),'--')
end

%  Annotate plot
xlabel('Height [cm]')
legend([[repmat('M ',n,1),char(ow)];[repmat('F ',n,1),char(ow)]])
hold off

%% Compare using boxplot
figure
boxplot(data.Height,{data.Sex data.Overweight})
ylabel('Height [cm]')

