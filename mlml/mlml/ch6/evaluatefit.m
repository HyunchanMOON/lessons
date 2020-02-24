function evaluatefit(y,ypred,name)
figure
% Plot against observation number
subplot(2,2,1)
plot(y,'.')
hold on
plot(ypred,'.')
title(name)
xlabel('Observation number')
ylabel('Fuel economy')

% Plot predicted and actual against each other
subplot(2,2,2)
scatter(y,ypred,'.')
% Add 45-degree line
xl = xlim;
hold on
plot(xl,xl,'k:')
title(name)
xlabel('Actual fuel economy')
ylabel('Predicted fuel economy')

% Distribution of errors
subplot(2,2,3)
err = y-ypred;
MSE = mean(err.^2,'omitnan');
histogram(err)
title(['MSE = ',num2str(MSE,4)])
xlabel('Prediction error')

% Distribution of percentage errors
subplot(2,2,4)
err = 100*err./y;
MAPE = mean(abs(err),'omitnan');
histogram(err)
title(['Mean Abs. Perc. Error = ',num2str(MAPE,4)])
xlabel('Prediction percentage error')
