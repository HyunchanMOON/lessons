function [fitresult, gof] = createFit(France, SouthKorea)
%CREATEFIT(FRANCE,SOUTHKOREA)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : France
%      Y Output: SouthKorea
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  참고 항목 FIT, CFIT, SFIT.

%  MATLAB에서 21-Aug-2019 11:44:56에 자동 생성됨


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( France, SouthKorea );

% Set up fittype and options.
ft = fittype( 'smoothingspline' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
legend( h, 'SouthKorea vs. France', 'untitled fit 1', 'Location', 'NorthEast' );
% Label axes
xlabel France
ylabel SouthKorea
grid on


