% Function: sumMf
%  
% Description: 
%       Calculates the population average mf intensity by weighting
%       the age-specific mf intensity values according to the age distribution of
%       the population
%
% Inputs:
%       mVec,ageMthMax,da,demog
%
% Outputs:
%       mSum (population average mf intensity)
% ________________________________________

function mSum = sumMf(mVec,ageMthMax,da,demog)

mSum0 = sum(pi_PeopleFun(((1:da:ageMthMax)/12.0)',demog)); % denominator to normalize pia such that the age probabilities sum to 1
mSum = sum(pi_PeopleFun(((1:da:ageMthMax)/12.0)',demog).*mVec)/mSum0;

end
