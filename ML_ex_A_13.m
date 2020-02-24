%%

clear; clc;

load hadata.mat
data.Subject = [];

Ac = data.Activity;

cvpt = cvpartition(5250, 'holdout', 0.3)
itr = training(cvpt);
ite = test(cvpt);
Activetr = data(itr, :);
Activete = data(ite, :);
mdl = fitctree(Activetr, 'Activity');
view(mdl, 'mode', 'graph');
view(mdl, 'mode', 'text');
preds = predict(mdl, Activete);
bar3(confusionmat(Activete.Activity, preds))
xticklabels(labels)
yticklabels(labels)
legend(labels,'Location', 'best')
figure(2)
confusionchart(Activete.Activity, preds)

