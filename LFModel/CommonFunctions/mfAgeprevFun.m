% Function: mfAgeprevFun
%  
% Description: 
%       converts mf intensity by age to prevalence according to a 
%       negative binomial distribution (see Norman et al 2000)
%
% Inputs:
%     mVec ,k
%       
% Outputs:
%     prev  
% ________________________________________

function prev = mfAgeprevFun(mVec,k)

prev = 1 - (1+(mVec./k)).^(-k);

end
   