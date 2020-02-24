%% A-10 Exercise

clear; clc;
load satdata
cvpt = cvpartition(satClass, 'holdout', 0.3)
itr = training(cvpt);  %training data와 test dat index 구분
ite = test(cvpt);
satDatatr = satData(itr, :);
satDatate = satData(ite, :);
satClasstr = satClass(itr, :);
satClasste = satClass(ite, :);
mdl = fitcknn(satDatatr, satClasstr, 'NumNeighbors', 5);

loss(mdl, satDatate, satClasste) %낮을수록 성능이 좋음
preds = predict(mdl, satDatate)
%crosstab( 원본정보, 예측결과)
confusionchart(satClasste, preds)
bar3(confusionmat(satClasste, preds))