clear all; clc;

% add CommonFunctions folder containing basic model functions to path
addpath('../../CommonFunctions/');

% Parameters related to sampling and resampling
NParamVecs = 200000; % default: 200000
SIR_samples = 500; % default: 500

% try to load user-editable variables from IO/setup_Vars.m
% if no file exists, spit error message and die
try
    load('../../IO/IN/Baseline_IN.mat');
catch ME
    if (strcmp(ME.identifier, 'MATLAB:load:couldNotReadFile'))
        fprintf(1, '\nError: Could not read Baseline Input file from IO/.\nDid you run setup_Vars.m?\n');
        exit(2);  % Die with value of 2
    else
        rethrow(ME)
        exit(3); % Die with value of 3, unknown error
    end
end

% Import country-level age-demographic parameters
Import_CountryDemogParams;

% start parallel pool
setupParallelPool();

%% Run fitting procedure for each site
% Based on the data we have originally, mf (age profile or overall mf) 

for iSites = 1:length(Sites)
    % define data
    MfData  = eval(sprintf('%sMf',Sites{iSites}));
    Vol     = eval(sprintf('%sVol',Sites{iSites}));
    bCulex  = eval(sprintf('%sbCulex',Sites{iSites})); % scalar for single species or vector for multiple species
    ABR     = eval(sprintf('%sABR',Sites{iSites})); % scalar for single species or vector for multiple species

    % define demographic parameters demoA and demoB according to
    % country
    [demoA1, demoB1] = get_demoA_and_demoB(Countries{iSites},...
        Country_demo,demoA,demoB);
    
    % adjust mf data for blood sample volume
    if ~isnan(MfData(1,1)) && (Vol == 20)
        MfData(:,3)=floor(min(MfData(:,2),MfData(:,3)*1.95));  % column: # positive/  floor rounds to smaller integer
    elseif ~isnan(MfData(1,1)) && (Vol == 100 || Vol == 60)    % column: # positive/  floor rounds to smaller integer
        MfData(:,3)=floor(min(MfData(:,2),MfData(:,3)*1.15));  % standard blood sample size: 1000 uL
    end
    
    % find maximum age in population
    if isnan(MfData)
        ageMax = 69; % default max age in a population
    else
        ageMax = max(MfData(:,4));
    end
    
    % if ABR data not availabe, sample ABR as a parameter
    if any(isnan(ABR)) % ABR could be scalar or vector
        ABR0 = zeros(NParamVecs,length(ABR));
        for j = 1:length(ABR)
            if isnan(ABR(j))
                ABR0(:,j) = ABRmin(iSites) + ...
                    (ABRmax(iSites)-ABRmin(iSites))*lhsdesign(1,NParamVecs,'criterion','correlation');
            else
                ABR0(:,j) = ones(NParamVecs,1)*ABR(j);
            end
        end
        ABR = ABR0;
    end
    
    % All possibilities will be run out of this if statement: AgeMf_asInput,
    %       OverallMf_asInput, OverallMfRange_asInput.
    RunSelectParameterVectors_wCFA(Sites{iSites},NParamVecs,MfData,ABR,SIR_samples,...
        demoA1,demoB1,ageMax,bCulex,minPrev(iSites),maxPrev(iSites))
end
