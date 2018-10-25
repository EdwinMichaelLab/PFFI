% min and max values for uniform prior distributions of model parameters 
function [rangeParamVals,maxParamVals,minParamVals] = Range_of_Parameters

%'beta';'HBIndex';'GTCP';'alpha';'k0';'kLin';'k1';'r1';'sigma1';'psi1';'psi2s2';'mu';'gamma';'b1';'c';'ageLev';'k2';'gam2';'tau';'immC';'slopeC';'k0_An';'k0_Cx';'immCMin';
%'larvaeDeath';'PP';'del';excessMortality

% note that beta gets overwritten in get_theParameters as beta = HBIndex/GTCP

minParamVals=[05;0.30;0.067;0.25;0.00036;0.00000024;1.16;0.01;1.5;0.12;0.02;0.0083;0.08;0.259;0.0001;1;1.16;0.02;0;0.5;0.10;0.00036;0.00036;0.0025;0.33;9;0.00001;0.75];
maxParamVals=[15;0.99;0.130;1.50;0.00440;0.0282;2.0;0.0495;8.5;0.7;0.0854;0.0104;0.12;0.481;0.001;20;2.00;0.0495;0;5.5;0.75;0.00440;0.00440;1.0000;1.16;26;0.00010;4.25];

rangeParamVals=maxParamVals-minParamVals;

end
