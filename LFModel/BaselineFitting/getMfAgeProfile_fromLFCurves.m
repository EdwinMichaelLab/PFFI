% Function: getMfAgeProfile_fromLFCurves.m
%
% Description: Translates overall mf prevalence data into age profiles 
% according to three standard LF age profile shapes. See Smith, Singh, and
% Michael 2017.
%
% Inputs:
%   TotalMfSamples,curve,OverallMfPrev,ageMax,demog,MidAge.
%
% Outputs:
%   mfAgeProfile.

function [mfAgeProfile] = getMfAgeProfile_fromLFCurves(TotalMfSamples,...
    curve,OverallMfPrev,ageMax,demog,MidAge)

% calculate age-Group proportions based on country demographics
AgeGroupProp = DemographicsBased_ageGroupProportions(demog,ageMax,MidAge);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The first step is to evaluate the selected age curve type theoretically for the
% country and TotalMfSamples given by the data - this will not match the
% known overall prevalence yet, it will just mimic the curve shape given
% the sampled population and demographics
%
% Curve equations originally obtained from nlme fits to several data sets of the
% same curve type (done in R using nlme package)
MfPrevTheor = zeros(ageMax,1);

if curve == 1 % plateau
    for age = 0:ageMax*12
        MfPrevTheor(age+1,:) = (0.018*(age/12))/(1+((age/12)/11.99));
    end
elseif curve == 2 % convex
    for age = 0:ageMax*12
        MfPrevTheor(age+1,:) = 0.029*(age/12)*exp(-0.033*(age/12));
    end
else % high plateau or linear
    for age = 0:ageMax*12
        MfPrevTheor(age+1,:) = (0.046*(age/12))/(1+((age/12)/18.630));
    end
end

% divide number people sampled into age groups
NoSampledTheor = round(TotalMfSamples.*AgeGroupProp);  % get each agegroup test sample number

% calculate theoretical number of people positive
NoPosTheor = zeros(length(MidAge),1);

Ages = 0:ageMax*12;

% fill in details of age group 1
j = 1;
minAge = MidAge(j) - (MidAge(j+1)-MidAge(j))/2;
maxAge = MidAge(j) + (MidAge(j+1)-MidAge(j))/2;
id = find(minAge*12 <= Ages & Ages < maxAge*12);
NoPosTheor(j,:) = median(MfPrevTheor(id))*NoSampledTheor(j,:);  % 1st group postive sample number
%% to check the MfPrevTheor variance to see if mean or median should be used


% fill in details of age groups 2+
diffMidAge = (MidAge(3)-MidAge(2))/2;
for j = 2:length(MidAge)
    minAge = MidAge(j) - diffMidAge;
    maxAge = MidAge(j) + diffMidAge;
    id = find(minAge*12 <= Ages & Ages < maxAge*12);
    NoPosTheor(j,:) = median(MfPrevTheor(id))*NoSampledTheor(j,:);
end

% calculate theoretical overall mf prevalence
OverallMfTheor = sum(NoPosTheor)/sum(NoSampledTheor);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The second step is to construct the village-specific age profile
% corresponding to the known overall mf prevalence in proportion to
% the theoretical age profile constructed above

mfAgeProfile=zeros(length(MidAge),4);
mfAgeProfile(:,1)=MidAge; % mid age of age group
mfAgeProfile(:,2)=NoSampledTheor; % number sampled by age group
mfAgeProfile(:,3)=min(round((OverallMfPrev/OverallMfTheor).*NoPosTheor),round(TotalMfSamples*AgeGroupProp)); % number mf positive by age group
mfAgeProfile(:,4)=[9; 19; 29; 39; 49; 59; 69]; % max age of age group

end
