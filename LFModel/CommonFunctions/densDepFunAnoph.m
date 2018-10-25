% Function: densDepFunAnoph
%  
% Description: 
%       density dependent mf uptake and larval development function for 
%       Anopheles mosquitoes. See Gambhir and Michael 2008.
%
% Inputs: 
%       mVec (vector of mf intensity by age), k (vector of age-specific 
%       aggregation parameters as given by the function "negBinshapeFun"), 
%       k2, and gam2
%       
% Outputs: 
%        f (vector of age-specific values of the uptake term)   
% ________________________________________

function f = densDepFunAnoph(mVec,k,k2,gam2)

val2 = gam2/k2;
fTerm1 = 2./((1+ (mVec./k)*(1-exp(-val2))).^k);
fTerm2 = 1./((1+ (mVec./k)*(1-exp(-2*val2))).^k);
f = (fTerm1-fTerm2);

end