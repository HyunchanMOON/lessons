%% A-10 Exercise

clear; clc;
load satdata
cvpt = cvpartition(satClass, 'holdout', 0.3)
itr = training(cvpt);  %training data�� test dat index ����
ite = test(cvpt);
satDatatr = satData(itr, :);
satDatate = satData(ite, :);
satClasstr = satClass(itr, :);
satClasste = satClass(ite, :);
mdl = fitcknn(satDatatr, satClasstr, 'NumNeighbors', 5);

loss(mdl, satDatate, satClasste) %�������� ������ ����
preds = predict(mdl, satDatate)
%crosstab( ��������, �������)
confusionchart(satClasste, preds)
bar3(confusionmat(satClasste, preds))