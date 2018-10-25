% Function: densDepFunCulex
%  
% Description: 
%       density dependent mf uptake and larval development function 
%       for Culex mosquitoes. See Gambhir and Michael 2008.
%
% Inputs: 
%       mVec (vector of mf intensity by age), k (vector of age-specific 
%       aggregation parameters as given by the function "negBinshapeFun"), 
%       gam (gam = r1/k1)
%       
% Outputs: 
%       f (vector of age-specific values of the uptake term) 
% ________________________________________

function f = densDepFunCulex(mVec,k,gam)

f = (1+((mVec./k)*(1-exp(-gam)))).^(-k);

end
