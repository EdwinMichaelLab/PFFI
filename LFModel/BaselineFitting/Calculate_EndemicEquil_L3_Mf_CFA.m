function [L3Values,mfPrevArray,cfaPrevArray] = ...
    Calculate_EndemicEquil_L3_Mf_CFA(NParamVecs,...
    ageMthMax,bCulex,demoX,ParameterVectors,VoverH,da,toleranceX)

% initialize arrays to store equilibrium values
L3Values = zeros(NParamVecs,length(bCulex));
mfPrevArray = zeros(ageMthMax,NParamVecs,'single');
cfaPrevArray = zeros(ageMthMax,NParamVecs,'single');

% note that typically da = 1
gVec  = zeros((ageMthMax/da),1);   % used in the equation for wVec
pVec  = zeros((ageMthMax/da),1); % prepatent worm burden
wVec  = zeros((ageMthMax/da),1); % patent worm burden
mVec  = zeros((ageMthMax/da),1); % mf intensity
iVec  = zeros((ageMthMax/da),1); % measure of immunity
cfaVec  = zeros((ageMthMax/da),1); % cfa intensity

% bSuppress used in get_theParametersLF
% 1 for including the effects of immunity, 0 for excluding
bSuppress = 1;

% loop through each parameter vector i
parfor i = 1:NParamVecs
    
    % access the parameters of index i
    [beta,alpha,k0,kLin,k1,r1,sigma1,psi1,psi2s2,mu,gamma,b1,c,ageLev,...
        k2,gam2,immC,slopeC,PP,alpha2,gamma2,del] = ...
        get_theParametersLF(ParameterVectors,bSuppress,i);
    
    % given the sampled parameter vector, calculate the equilibrium values
    % of L3, mf, and cfa
    [l3Eq,~,~,~,mVec0,~,cfaVec0] = get_equilibrium_values_CFA(VoverH(i,:),beta,alpha,k0,kLin,...
        k1,r1,sigma1,psi1,psi2s2,mu,gamma,b1,c,ageLev,k2,gam2,immC,...
        slopeC,PP,del,alpha2,gamma2,ageMthMax,da,bCulex,demoX,...
        toleranceX,gVec,pVec,wVec,mVec,iVec,cfaVec)
    
    % store equilibrium values given parameter vector i
    L3Values(i,:) = l3Eq; % size: NParamVecs x number of species
    mfPrevArray(:,i) = mfAgeprevFun(mVec0,negBinshapeFun(mVec0,k0,kLin)); % size: ageMthMax x NParamVecs
    cfaPrevArray(:,i) = mfAgeprevFun(cfaVec0,negBinshapeFun(cfaVec0,k0,kLin));  % size: ageMthMax x NParamVecs
    
end

end