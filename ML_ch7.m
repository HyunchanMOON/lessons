%% neural Networks

net = patternnet(5);
view(net)
net = patternnet([5 7]);
view(net)

net = patternnet(15);
load fisheriris
out = dummyvar(categorical(species));
net = train(net, meas', out')
net.IW{1} %hidden layer�� ����
net.LW{2} %out Layer�� ���� 
net.B
net.layers{1} % input layer�� �ƴ� ù��° hidden Layer�� �ǹ���
net.layers{1}.transferFcn
net.layers{2}.transferFcn

newd = rand(1, 4);
net(newd') 
vec2ind(net(newd')) % � ���� ����ū�� 

net = selforgmap(3);
net = train(net , meas');
vec2ind(net(meas'))
