% min and max values for uniform prior distributions of model parameters 
function [rangeParamVals,maxParamVals,minParamVals] = Range_of_Parameters

% 1 beta; 2 alpha; 3 k0; 4 kLin; 5 k1; 6 r1; 7 sigma1; 8 psi1; 9 psi2s2; 10 mu; 11 gamma;
% 12 b1; 13 c; 14 ageLev; 15 k2; 16 gam2; 17 immC; 18 slopeC; 19 PP; 20 del; 21 alpha2; 22 gamma2

minParamVals=[ 5;0.25;0.000036;0.00000024;3;0.04;1.5;0.1;0.00003;0.008;0.08;0.251;0.015;20;3;0.04;0.5;0.01;1;0.001;0.5;0.0125];
maxParamVals=[15;1.50;0.000775;0.28200000;5;0.25;8.5;0.8;0.00364;0.018;0.12;0.485;0.025;30;5;0.25;5.5;0.20;9;0.010;9.370;0.2];

rangeParamVals=maxParamVals-minParamVals;
end
