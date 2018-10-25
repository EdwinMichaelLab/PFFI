% Function: get_equilibrium_values_CFA
%
% Description: 
%       finds the equilbrium values of all state variables i.e. l3,
%       pre-patent and patent worm loads, mf intensity, cfa intensity, and
%       acquired immunity
%
% Inputs: 
%       VoverH,beta,alpha,k0,kLin,k1,r1,sigma1,psi1,psi2s2,mu,gamma,b1,c,
%       ageLev,k2,gam2,immC,slopeC,PP,del,alpha2,gamma2,ageMthMax,da,bCulex,
%       demog,tol1,gVec,pVec,wVec,mVec,iVec,cfaVec
%
% Outputs: 
%       l3: equilibrium calue of l3 (scalar); pVec,wVec,mVec,iVec,cfaVec:
%       vectors of age-stratified pre-patent and patent worm loads, mf
%       intensity, acquired immunity, and cfa intensity; flag: flag 
%       indicating number of vector species for which equilibrium was achieved
% ________________________________________

function [l3,flag,pVec,wVec,mVec,iVec,cfaVec] = ...
    get_equilibrium_values_CFA(VoverH,beta,alpha,k0,kLin,...
    k1,r1,sigma1,psi1,psi2s2,mu,gamma,b1,c,ageLev,k2,gam2,immC,...
    slopeC,PP,del,alpha2,gamma2,ageMthMax,da,bCulex,demog,...
    tol1,gVec,pVec,wVec,mVec,iVec,cfaVec)

[~,n] = size(VoverH);
l3 = ones(1,n); % l3 is scalar or vector depending on number of species

% Generate the vector of wVec, mVec, iVec, etc.
[pVec,wVec,mVec,iVec,cfaVec] = ...
    equilibriumValuesOfStateVars_CFA(beta,k0,kLin,...
    psi1,mu,alpha,gamma,c,ageLev,VoverH,psi2s2,immC,slopeC,del,...
    alpha2,gamma2,ageMthMax,da,l3,PP,pVec,wVec,mVec,iVec,gVec,cfaVec);

for iSpp = 1:length(VoverH)
    l3(iSpp) = calcL3Fun(mVec,k0,kLin,r1,k1,beta,b1,sigma1,psi1,...
        ageMthMax,da,k2,gam2,bCulex,demog);  
end

flag = 0;
while (flag < length(VoverH))
    
    % calculate equil values given l3 guess value
    [pVec,wVec,mVec,iVec,cfaVec] = ...
        equilibriumValuesOfStateVars_CFA(beta,k0,kLin,...
        psi1,mu,alpha,gamma,c,ageLev,VoverH,psi2s2,immC,slopeC,del,...
        alpha2,gamma2,ageMthMax,da,l3,PP,pVec,wVec,mVec,iVec,gVec,cfaVec);
    
    temp = l3; % store previous l3 guess value
    
    for iSpp = 1:length(VoverH) % calculate new l3 value given new equil mVec
        l3(iSpp) = calcL3Fun(mVec,k0,kLin,r1,k1,beta,b1,sigma1,psi1,...
            ageMthMax,da,k2,gam2,bCulex,demog);
    end
    
    flag = 0;
    
    for iSpp = 1:length(l3) % if l3 did not change, stop iterating
        if abs(l3(iSpp)-temp(iSpp)) <= tol1
            flag = flag+1;
        end
    end
    
end

end
