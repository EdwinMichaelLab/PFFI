% Function: RunSelectParameterVectors_wCFA
%
% Description: Runs through parameter vectors for baseline fitting and likelihood
%              calculation, adjusts for MF-data quality.
% Inputs:
%   Sites,NParamVecs,MfData,ABR,SIR_samples,demoA,demoB,ageMax,bCulex,
%       minPrev,maxPrev
%   Notes: Not all inputs will be used depending on quality of the MfData.
%
% Outputs:
%   Writes to file, 'ParamVectors%s.mat', Sites.
%   Writes: 'bCulex', 'demog','ABR','ParameterVectors','L3Values','ageMthMax',
%           'mfPrevArray','cfaPrevArray'. (For applicable sites)
%
% Date: Dec 5, 2017   CJK
% ________________________________________

function RunSelectParameterVectors_wCFA(Sites,NParamVecs,MfData,ABR,...
    SIR_samples,demoA,demoB,ageMax,bCulex,minPrev,maxPrev)

ageMthMax = ageMax*12; % convert max age in years to months
demog = [1, 1, demoA, demoB, 1]; % set up demographic parameters

da = 1; % integration step-size of 1 month
toleranceX = 0.000001; % Used in endemic equilibrium of state variables

% Set random number stream
RandStream.setGlobalStream...
    (RandStream('mt19937ar','seed',rand*sum(10000*clock)));  % mt19937ar:random generator

% Initialize Output Arrays
ParameterVectors = [];
L3Values1 = [];
mfPrevArray1 = [];
cfaPrevArray1 = [];
ABR1 = [];

% Loop to generate an initial sample of parameter vectors, run the model
% to equilibrium, and resample best fits until the desired number of best fits defined by SIR_samples is
% achieved. In absense of Mfdata, resample best fit until the desired number of plausible mf fits are selected
NumParam = 0;
numSamples = SIR_samples;

% Obtaining the boolean variables needed to process MfData.
% Each of the following variables represent the quality of the MfData
[AgeMf_asInput, OverallMf_asInput, OverallMfRange_asInput] = get_dataQualityVars(MfData);

if OverallMfRange_asInput % No Baseline Mf, different loop condition in this case.
    numSamples = NParamVecs; 
end

while ( NumParam < numSamples ) % Either #SIR or NParamVecs, depending on quality of MfData
    
    % generate an initial sample of parameter vectors
    ParamVectors = ParameterVectors_LHSDesign_based(NParamVecs); 
    
    % calculate VoverH (this is a vector for one species, matrix for more than one species)
    [~,n] = size(ABR); % n is the number of species
    VoverH = (ABR/12)./repmat(ParamVectors(1,:)',[1 n]); % VoverH = MBR/beta
    
    % Running to equilibrium 
    [L3Values,mfPrevArray,cfaPrevArray] = ...
        Calculate_EndemicEquil_L3_Mf_CFA(NParamVecs,...
        ageMthMax,bCulex,demog,ParamVectors,VoverH,da,toleranceX);
    
    if AgeMf_asInput % Mf age profile
        
        % Resample the parameter vectors using 1) SIR algorithm and 2) pass/fail criteria
        [kId1, ~] = get_modelFits_Mf_AgeData(MfData,...
            mfPrevArray,demog,da,ageMthMax,SIR_samples);
        kId = unique(kId1);
        
    elseif OverallMf_asInput % Overall Mf
        
        % Resample the parameter vectors using 1) SIR algorithm and 2) pass/fail criteria
        [kId1, ~] = get_modelFits_Mf_OverallData(MfData,...
            mfPrevArray,demog,da,ageMthMax,SIR_samples);
        kId = kId1;
        
    elseif OverallMfRange_asInput % No Baseline Mf
        
        for i = 1:length(mfPrevArray(1,:))  %% loop through 200,000 parameters
            OverallMf(i) = getOverallPrev_fromAgeCurves(100*mfPrevArray(:,i),...
                demog,da,ageMthMax);
        end
        kId = find(OverallMf > minPrev & OverallMf < maxPrev);
        
    end
    
    % Store parameters, equilibrium L3, and an equilibrium mf values
    % corresponding to the resampled parameter vectors
    ParameterVectors(:,NumParam+1:NumParam+length(kId)) = ...
        ParamVectors(:,kId);
    
    L3Values1(NumParam+1:NumParam+length(kId),:) = ...
        L3Values(kId,:);
    
    mfPrevArray1(:,NumParam+1:NumParam+length(kId)) = ...
        mfPrevArray(:,kId);
    
    cfaPrevArray1(:,NumParam+1:NumParam+length(kId)) = ...
        cfaPrevArray(:,kId);
    
    ABR1(NumParam+1:NumParam+length(kId),:) = ...
        12*VoverH(kId,:).*ParamVectors(1,kId)';
    
    % Update number of parameter vectors selected
    NumParam = NumParam + length(kId);
    fprintf(1,'Num selected kIds = %d, Total Num Params = %d\n',...
        length(kId),NumParam);
end

L3Values = L3Values1;
mfPrevArray = mfPrevArray1;
cfaPrevArray = cfaPrevArray1;
ABR = ABR1;

% save sampled best fitting outputs and basic descriptive parameters of
% the site
save(sprintf('../IO/OUT/ParamVectors%s.mat',Sites),'bCulex',...
    'demog','ABR','ParameterVectors','L3Values','ageMthMax',...
    'mfPrevArray','cfaPrevArray');

end
