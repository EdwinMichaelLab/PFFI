% Function: setup_Vars
%  
% Description: 
%   Instatiates all necessary variables for BaselineFitting. This is the 
%   file which is edited by the user for the location's data. This file 
%   will be ran which simplyinstantiates the variables and saves them to a 
%   .mat file to be loaded.
% 
% Inputs:
%   None: Data is entered within this file.
%
% Outputs:
%   Variables are saved to files for: Baseline_IN.mat
% _____________________________________________________________________________

addpath('../BaselineFitting/');
%{
 * BaselineFitting Variables
%}

% Site details: Relevant endemic regions, Country (pertains only Sub-Saharan Africa cases), Village

% country names should follow format of CountryDemogParams.csv
Countries = {'Uganda','Uganda','Uganda','Uganda','Uganda','Uganda',...
    'Uganda','Uganda'}; 
Sites = {'Bubungi','Bunabutiti','Bunambatsu','Buriri','Andra','Madulu',...
    'Masaloa','PalaurePacunaci'};

% Site data: Mf prevalence, ABR, vector genera
% arranged in region-specific .m data files created by the user
[BubungiMf,BunabutitiMf,BunambatsuMf,BuririMf,AndraMf,MaduluMf,...
    MasaloaMf,PalaurePacunaciMf,BubungiABR,BunabutitiABR,BunambatsuABR,...
    BuririABR,AndraABR,MaduluABR,MasaloaABR,PalaurePacunaciABR,...
    BubungibCulex,BunabutitibCulex,BunambatsubCulex,BuriribCulex,AndrabCulex,MadulubCulex,...
    MasaloabCulex,PalaurePacunacibCulex] = baseline_data;

% ABR range for use in sites without baseline ABR data
ABRmin = 5000; 
ABRmax = 50000;

% Mf range for use in sites without baseline Mf data
minPrev = NaN;
maxPrev = NaN; 

save IN/Baseline_IN.mat Countries Sites ...
    BubungiMf BunabutitiMf BunambatsuMf BuririMf AndraMf MaduluMf ...
    MasaloaMf PalaurePacunaciMf BubungiABR BunabutitiABR BunambatsuABR ...
    BuririABR AndraABR MaduluABR MasaloaABR PalaurePacunaciABR ...
    BubungibCulex BunabutitibCulex BunambatsubCulex BuriribCulex ...
    AndrabCulex MadulubCulex MasaloabCulex PalaurePacunacibCulex ...
    ABRmin ABRmax minPrev maxPrev
