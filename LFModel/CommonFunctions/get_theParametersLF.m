% Function: get_theParametersLF
%  
% Description: 
%       accesses the parameter values for a single parameter vector
%       (a column of parameter values which were sampled simultaneously)
%
% Inputs: 
%        ParameterVectors (rows = # of parameters, cols = NParamVecs),
%        bSuppress (indicating whether to include the effects of immunity),
%        and i (index for which parameter vector to access)    
%
% Outputs:
%        beta,alpha,k0,kLin,k1,r1,sigma1,psi1,psi2s2,mu,gamma,b1,c,ageLev,
%        k2,gam2,immC,slopeC,PP,alpha2,gamma2,del    
% ________________________________________

function [beta,alpha,k0,kLin,k1,r1,sigma1,psi1,psi2s2,mu,gamma,b1,c,ageLev,...
    k2,gam2,immC,slopeC,PP,alpha2,gamma2,del] = get_theParametersLF(ParameterVectors,bSuppress,i)

beta    = ParameterVectors(1,i);
alpha   = ParameterVectors(2,i);
k0      = ParameterVectors(3,i);
kLin    = ParameterVectors(4,i);
k1      = ParameterVectors(5,i);
r1      = ParameterVectors(6,i);
sigma1  = ParameterVectors(7,i);
psi1    = ParameterVectors(8,i);
psi2s2  = ParameterVectors(9,i);
mu      = ParameterVectors(10,i);
gamma   = ParameterVectors(11,i);
b1      = ParameterVectors(12,i);
c       = ParameterVectors(13,i);
ageLev  = ParameterVectors(14,i);
k2      = ParameterVectors(15,i);
gam2    = ParameterVectors(16,i);
PP      = ParameterVectors(19,i);
del     = ParameterVectors(20,i);
alpha2  = ParameterVectors(21,i);
gamma2  = ParameterVectors(22,i);

if bSuppress == 1
    immC =  ParameterVectors(17,i);
    slopeC = ParameterVectors(18,i);
else
    immC= 0;
    slopeC = 0;
end

end