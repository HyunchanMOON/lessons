%% neural Networks

net = patternnet(5);
view(net)
net = patternnet([5 7]);
view(net)

net = patternnet(15);
load fisheriris
out = dummyvar(categorical(species));
net = train(net, meas', out')
net.IW{1} %hidden layer로 가는
net.LW{2} %out Layer로 가는 
net.B
net.layers{1} % input layer가 아닌 첫번째 hidden Layer를 의미함
net.layers{1}.transferFcn
net.layers{2}.transferFcn

newd = rand(1, 4);
net(newd') 
vec2ind(net(newd')) % 어떤 값이 가장큰지 

net = selforgmap(3);
net = train(net , meas');
vec2ind(net(meas'))
