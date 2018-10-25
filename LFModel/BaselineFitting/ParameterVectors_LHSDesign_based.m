% ParameterVectors_LHSDesign_based randomly samples 
% a set of Parameters vectors sampled from uniform distribution, as prior for Bayesian

function [ ParameterVectors ] = ParameterVectors_LHSDesign_based( NParamVecs )

% define the range for the following parameters, used for uniform sampling 
% beta;alpha;k0;kLin;k1;r1;sigma1;psi1;psi2s2;mu;gamma;b1;c;ageLev;k2;gam2;immC;slopeC;PP;del;alpha2;gamma2
% recommend to be combined in this function 

[rangeParamVals,~,minParamVals] = Range_of_Parameters;

ParameterVectors = zeros(length(minParamVals),NParamVecs);  % NParamVecs: 200,000

for i=1:length(minParamVals)
    ParameterVectors(i,:) = minParamVals(i) + ...
        rangeParamVals(i)*lhsdesign(1,NParamVecs,'criterion','correlation');  
end

ParameterVectors(14,:) = floor(ParameterVectors(14,:)+0.5); % ageLev should be non-fraction
ParameterVectors(19,:) = floor(ParameterVectors(19,:)+0.5); % PP should be non-fraction, Prepatency Period

end

