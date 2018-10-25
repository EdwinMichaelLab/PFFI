% Sample baseline data for sites Masaika,TZ, Kingwede,KEN, and Kirare,TZ 

function [ DokanTofaMf,GbuwhenMf,GwamlarMf,LankanMf,MaigangaMf,PiapungMf,SeriMf,...
    DokanTofaVol,GbuwhenVol,GwamlarVol,LankanVol,MaigangaVol,PiapungVol,SeriVol,...
    DokanTofaABR,GbuwhenABR,GwamlarABR,LankanABR,MaigangaABR,PiapungABR,SeriABR,...
    DokanTofabCulex,GbuwhenbCulex,GwamlarbCulex,LankanbCulex,MaigangabCulex,PiapungbCulex,SeribCulex]...
    = baseline_data
%% Baseline Mf Data
% Best data to provide would be age-stratified prevalence
% Variable names = {SiteName}Mf

% 1st column = mid-age of group; 2nd: Total number of samples; 3rd: Mf +ves;
% 4th: upper age of group

% If age-stratified data is not available, enter overall community
% prevalence in a single line following the column definitions above
DokanTofaMf = [34.5 419 round(0.05*419) 69];
GbuwhenMf = NaN;
GwamlarMf = [34.5 494 round(0.067*494) 69];
LankanMf = NaN;
MaigangaMf = NaN;
PiapungMf = [34.5 403 round(0.099*403) 69];
SeriMf = NaN;

%% Blood sample volume used to test presence of mf (in uL)
% Standard volumes are 1000 uL, 100 uL, or 20 uL (60 uL uses 100 uL
% correction)
% Model operates based on 1 mL samples, so smaller samples will be
% corrected to reflect this

DokanTofaVol = 60;  
GbuwhenVol = 60;
GwamlarVol = 60;
LankanVol = 60;
MaigangaVol = 60;
PiapungVol = 60;
SeriVol = 60;

%% Baseline ABR data
% If not available for a particular site, enter value as NaN

DokanTofaABR = NaN;  
GbuwhenABR = NaN; 
GwamlarABR = NaN; 
LankanABR = NaN; 
MaigangaABR = NaN; 
PiapungABR = NaN; 
SeriABR = NaN; 

%% Mosquito species flag based on dominant genera (0: Anopheles, 1: Culex)

DokanTofabCulex = 0;  
GbuwhenbCulex = 0;
GwamlarbCulex = 0;
LankanbCulex = 0;
MaigangabCulex = 0;
PiapungbCulex = 0; 
SeribCulex = 0;

end
