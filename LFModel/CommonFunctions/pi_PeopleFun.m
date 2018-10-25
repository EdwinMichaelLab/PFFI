% Function: pi_PeopleFun
%  
% Description: 
%       Based on the age distribution of a country (described by parameters
%       given in demog), calculates the (improper) probability of a person
%       being age a 
% Inputs:
%       a (age in years), demog    
%
% Outputs:
%       pia
% ________________________________________

function pia = pi_PeopleFun(a,demog)

pia = demog(3)*exp(-demog(4)*a);

end
