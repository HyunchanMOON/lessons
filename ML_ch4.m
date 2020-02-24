%% Supervised Learning Problems

%Evaluating Classifications
clear; clc;
load heartdisease
HD = heartdataNum.HeartDisease;
cvpt = cvpartition(427, 'holdout', 0.3)
%cvpartition(출력변수 or 행 Size, 'holdout', 0~1(0.3))  % 0~1 test data의 비율
itr = training(cvpt);  %training data와 test dat index 구분
ite = ~itr
ite = test(cvpt);
numdatatr = numdata(itr, :);
numdatate = numdata(ite, :);
HDtr = HD(itr,:);
HDte = HD(ite,:);
% choose algorithm & fit model
%mdl = fitcknn(Tabledata, 출력)
%mdl = fitcknn(tabledata, 
mdl = fitcknn(numdatatr, HDtr);
% evaluate model
loss(mdl, numdatate, HDte) %낮을수록 성능이 좋음
preds = predict(mdl, numdatate);
%crosstab( 원본정보, 예측결과)
crosstab(HDte, preds)
confusionmat(HDte, preds)
confusionchart(HDte, preds)
loss(mdl, numdatatr, HDtr);
resubLoss(mdl)

% update model
mdl.NumNeighbors = 7;
mdl = fitcknn(numdatatr, HDtr, 'NumNeighbors', 7);
%reevaluate model
loss(mdl, numdatate, HDte)
resubLoss(mdl)
%make prediction
newpd = rand(1, 11)
predict(mdl, newpd)

%% Evaluating Classifications table 형
%cvpartition(출력변수 or 행 Size, 'holdout', 0~1(0.3))

clear; clc;
load heartdisease

HD = heartdataNum.HeartDisease;
cvpt = cvpartition(427, 'holdout', 0.3)
itr = training(cvpt);  %training data와 test dat index 구분
ite = ~itr
ite = test(cvpt);
hdNumtr = heartdataNum(itr, :);
hdNumte = heartdataNum(ite, :);
% choose algorithm & fit model
mdl = fitcknn(hdNumtr, 'HeartDisease');

loss(mdl, hdNumte)
preds = predict(mdl, hdNumte);
confusionchart(hdNumte.HeartDisease, preds)
confusionmat(hdNumte.HeartDisease, preds)
resubLoss(mdl)

% update model
mdl.NumNeighbors = 7;
mdl = fitcknn(hdNumtr, 'HeartDisease', 'NumNeighbors', 7);
%reevaluate model
loss(mdl, hdNumte)
resubLoss(mdl)
%make prediction
newpd = rand(1, 11)
predict(mdl, newpd)

% K- Nearest Neighbor Classification
mdl = fitcknn(hdNumtr, 'HeartDisease');
%mdl = fitcknn(ndNumtr, 'HeartDisese', 'Distance', 'cosine', ....)

% decision Tree
mdl = fitctree(hdNumtr, 'HeartDisease');
view(mdl, 'mode', 'graph');
view(mdl, 'mode', 'text')


%% decision tree ex
clear; clc;
load fisheriris.mat
unique(species)
mdl = fitctree(meas, species);
view(mdl, 'mode', 'graph');

pmdl = prune(mdl , 'level',1); %가지수 조정
view(pmdl, 'mode', 'graph')

mdl = fitctree(meas, species, 'MaxNumSplits', 2); %가지수 조정
view(mdl, 'mode', 'graph')


% 1. sorting 2. 2 group분리 3. 지니 계수 구함 4. 질문 생성

x3 = meas(:, 3);
[x3s , idx] = sort(x3);
as = species(idx);
ss = species(idx);



