%EXB_25
clear; clc;

load('tallest_bldgs.mat')

%feet = 0.3048meters

Meters = buildings.Height*0.3048
buildings.Height_M = Meters
% buildings.Height = []
buildings = buildings(  : , [1:3, end, 4:end-1]);

noht500 = nnz(buildings.Height_M > 500)
buildings(buildings.Height_M > 500, {'Name', 'City'})


buildings.Name((buildings.Height_M > 300) & (buildings.Year < 1950))

C = buildings.Name((buildings.Stories > 100) | (buildings.Year == 2017))