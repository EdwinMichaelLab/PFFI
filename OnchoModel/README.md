Introduction

This code describes a mathematical model of the transmission and elimination dynamics of the vector-borne parasitic disease onchocerciasis. Its intended use is to fit model parameters to an endemic site of interest based on available epidemiological and entomological data.

The model is a Bayesian data-assimilation model. The model parameters are fit to a particular endemic setting of interest described by baseline (pre-intervention) data provided by the user. The fitted models are then subsequently used in calculating elimination targets and simulating interventions.

Baseline Fitting
- Contains code to parameterize the model using a Bayesian Melding/Sampling-Importance-Resampling approach to fit the model to baseline mf prevalence and annual biting rate (ABR) data.  
- The data should be supplied in a .m file following the format of the provided samples \"baseline_data.m\".
- The required input data for each site are as follows: 
--Best case scenario: Ideally, a dataset should consist of age-stratified microfilariae (mf) prevalence, black fly species responsible for transmission (with or without (S. damnosum, S. neavei) cibarial armature), and species-specific annual biting rates (ABR). All data should reflect baseline (pre-intervention) conditions.
--Alternative: In the absence of age-stratified mf prevalence data, overall community level prevalence may be supplied with an estimate of the maximum age in the population. In the absence of ABR data, the value should be represented as NaN.

After setting up the data files, make corresponding edits to the file IO/setup_Vars.m and run this function. This will create Baseline_IN.mat. 
The program entry point lies in the file \"Main-ToRunBaselineFitting.m\". The user can edit certain paramter values and define the input data in the section \"User-defined inputs\". Upon completion of data and specification setup, \"Main_ToRunBaselineFitting.m\" can be run in the Matlab environment. An output .mat file will be saved called \"ParamVectors_{SiteName}.mat\" which will store the best-fitting parameters and outputs for subsequent use in calculating elimination targets and simulating interventions.

