%%Data
load('flightData.mat')
%%
plot(t, altitude, '.-k')
title('\bf{Altitude of a flight from L.A to Boston}')
%%jhk
xlabel('Time(minutes after takeoff)')
ylabel('Altitude(feet above sea level)')
