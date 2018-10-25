% Function: wormMatingProb
%  
% Description: 
%       density-dependent worm mating probability function(see Gambhir
%       2008)
%
% Inputs:
%       wVec,k
%
% Outputs:
%       mat (mating probability)
% ________________________________________

function mat = wormMatingProb(wVec,k)

mat = 1 - (1 + wVec./(2*k)).^(-(1+k));

end