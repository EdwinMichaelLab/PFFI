% Function: baseline_data
%  
% Description: 
%   Stores baseline mf infection data, annual biting rate, and blackfly
%   species for each site to be modeled.
% 
% Inputs:
%   None: Data is entered within this file.
%
% Outputs:
%   Site-specific mf, ABR, and blackfly data are returned.
% _____________________________________________________________________________

function [BubungiMf,BunabutitiMf,BunambatsuMf,BuririMf,AndraMf,MaduluMf,...
    MasaloaMf,PalaurePacunaciMf,BubungiABR,BunabutitiABR,BunambatsuABR,...
    BuririABR,AndraABR,MaduluABR,MasaloaABR,PalaurePacunaciABR,...
    BubungiFly,BunabutitiFly,BunambatsuFly,BuririFly,AndraFly,MaduluFly,...
    MasaloaFly,PalaurePacunaciFly] = baseline_data

%% Baseline Mf Data
% Best data to provide would be age-stratified prevalence
% Variable names = {SiteName}Mf

% 1st column = mid-age of group; 2nd: Total number of samples; 3rd: Mf +ves;
% 4th: upper age of group

% If age-stratified data is not available, enter overall community
% prevalence in a single line following the column definitions above

BubungiMf = [34.5 100 75.0 69]; % prevalence data known but num sampled unknown, entered as 100 samples
BunabutitiMf = [34.5 100 53.8 69];
BunambatsuMf = [34.5 100 58.8 69];
BuririMf = [34.5 100 61.3 69];
AndraMf = [34.5 100 70.0 69];
MaduluMf = [34.5 100 72.0 69];
MasaloaMf = [34.5 100 76.0 69];
PalaurePacunaciMf = [34.5 100 100 69];

%% Baseline ABR data
% If not available for a particular site, enter value as NaN
% Variable names = {SiteName}ABR

BubungiABR = NaN;
BunabutitiABR = NaN;
BunambatsuABR = NaN;
BuririABR = NaN;
AndraABR = NaN;
MaduluABR = NaN;
MasaloaABR = NaN;
PalaurePacunaciABR = NaN;

%% Blackfly species flag based on dominant genera (0: S. neavei, S. damnosum, no armature)
% Variable names = {SiteName}Fly

BubungiFly = 0;
BunabutitiFly = 0;
BunambatsuFly = 0;
BuririFly = 0;
AndraFly = 0;
MaduluFly = 0;
MasaloaFly = 0;
PalaurePacunaciFly = 0;


end
