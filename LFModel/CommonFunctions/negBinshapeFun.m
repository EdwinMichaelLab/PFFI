% Function: negBinshapeFun
%  
% Description: 
%       Calculates the aggregation parameter k which is used as the shape
%       parameter in the negative binomial distribution in "mfAgePrevFun"
% 
% Inputs:
%       mVec,k0,kLin
%
% Outputs:
%       k
% ________________________________________

function k = negBinshapeFun(mVec,k0,kLin)

k = k0 + (kLin*mVec);

end
   