% Function: calcL3Fun
%  
% Description: 
%       Function to calculate the value of L3 given the mf intensity
%       (mVec) and mosquito genus. See Gambhir and Michael 2008.
%
% Inputs:
%       mVec,k0,kLin,r1,k1,beta,b1,sigma1,psi1,ageMthMax,da,k2,gam2,bCulex,demoX
%
% Outputs:
%       l3
% ________________________________________

function l3 = calcL3Fun(mVec,k0,kLin,r1,k1,beta,b1,sigma1,psi1,ageMthMax,da,k2,gam2,bCulex,demog)

% calculate probability that person is of age a
a1 = (1:da:ageMthMax)';
sumPeople = sum(pi_PeopleFun(a1/12.0,demog));
pI = pi_PeopleFun(a1/12.0,demog)/sumPeople;

% genus-specific mf uptake/larval establishment term ((1-f(M)) in L* equation)
if bCulex == 1 % Culex
    fI = 1 - densDepFunCulex(mVec,negBinshapeFun(mVec,k0,kLin),(r1/k1));  
else % Anopheles
    fI = 1 - densDepFunAnoph(mVec,negBinshapeFun(mVec,k0,kLin),k2,gam2);
end

% average uptake/development term over the population
int1 = sum(pI.*fI); % this equals the integration of pi(a)*(1-f(M))

% derive l3 as a function of uptake term and genus
if bCulex == 1 % Culex
    l3 = beta*k1*b1*int1/(sigma1+beta*psi1);
else % Anopheles
    l3 = beta*k2*b1*int1/(sigma1+beta*psi1);
end

end

