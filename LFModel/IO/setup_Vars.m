% Function: setup_Vars
%  
% Description: 
%   Instatiates all necessary variables for BaselineFitting. This is the 
%   file which is edited by the user for the location's data. This file 
%   will be ran which simply instantiates the variables and saves them to 
%   a .mat file to be loaded.
% 
% Inputs:
%   None: Data is entered within this file.
%
% Outputs:
%   Variables are saved to files for: Baseline_IN.mat
%
% Date: Feb 2, 2018   CJK
% _____________________________________________________________________________

addpath('../BaselineFitting/Baseline_MATLAB/');

%{
 * BaselineFitting Variables
 * Orginally from Main_ToRunBaselineFitting.m
%}

% Site details: Relevant endemic regions, Country (pertains only Sub-Saharan Africa cases), Village

% country names should follow format of CountryDemogParams.csv
Countries = {'Nigeria';'Nigeria';'Nigeria';'Nigeria';'Nigeria';'Nigeria';'Nigeria'}; 
Sites = {'DokanTofa'; 'Gbuwhen'; 'Gwamlar'; 'Lankan'; 'Maiganga'; 'Piapung'; 'Seri'};

% Site data: Mf prevalence, blood sample volume, ABR, vector genera
% arranged in region-specific .m data files created by the user
[ DokanTofaMf,GbuwhenMf,GwamlarMf,LankanMf,MaigangaMf,PiapungMf,SeriMf,...
    DokanTofaVol,GbuwhenVol,GwamlarVol,LankanVol,MaigangaVol,PiapungVol,SeriVol,...
    DokanTofaABR,GbuwhenABR,GwamlarABR,LankanABR,MaigangaABR,PiapungABR,SeriABR,...
    DokanTofabCulex,GbuwhenbCulex,GwamlarbCulex,LankanbCulex,MaigangabCulex,PiapungbCulex,SeribCulex]...
    = baseline_data;

% ABR range for use in each site without baseline ABR data
ABRmin = [50000,50000,50000,50000,50000,50000,50000];
ABRmax = [100000,100000,100000,100000,100000,100000,100000]; 

% Mf range for use in each site without baseline Mf data 
minPrev = [0.05,0.05,0.05,0.05,0.05,0.05,0.05];
maxPrev = [0.60,0.60,0.60,0.60,0.60,0.60,0.60]; 

save('IN/Baseline_IN.mat', 'Countries', 'Sites',...
     'DokanTofaMf','GbuwhenMf','GwamlarMf','LankanMf','MaigangaMf','PiapungMf','SeriMf',...
     'DokanTofaVol','GbuwhenVol','GwamlarVol','LankanVol','MaigangaVol','PiapungVol','SeriVol',...
     'DokanTofaABR','GbuwhenABR','GwamlarABR','LankanABR','MaigangaABR','PiapungABR','SeriABR',...
     'DokanTofabCulex','GbuwhenbCulex','GwamlarbCulex','LankanbCulex','MaigangabCulex',...
     'PiapungbCulex','SeribCulex','ABRmin','ABRmax','minPrev','maxPrev');