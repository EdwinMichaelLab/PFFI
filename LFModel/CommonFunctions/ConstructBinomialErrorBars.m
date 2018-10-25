% Function: ConstructBinomialErrorBars
%  
% Description: 
%       Function to calculate the 95% binomial proportion confidence 
%       interval of prevalence data 
%
% Inputs:
%       data: in the form of a matrix where each row represents a single
%       data point and the columns indicate 1: either the mid-age of the age
%       group for baseline data or the time of the survey for intervention
%       data, 2: the number of people sampled, 3: the number testing positive, and
%       (for baseline data only) 4: the maximum age in the age group
%
% Outputs:
%       aa: a matrix with the same number of rows as "data" where the
%       columns represent 1: the mid-age (for baseline data) or survey time 
%       (for intervention data), 2: the prevalence at that time or age, 3:
%       the length of the upper errorbar, 4: the length of the lower
%       errorbar. This matrix is formatted to be passed into the Matlab
%       plotting function "errorbar".
% ________________________________________

function aa = ConstructBinomialErrorBars(data)

p = (data(:,3)+2)./(data(:,2)+4); % proportion testing positive (adjusted wald method)
                                % because of small total samples, so adjusted wald is used here
delta = 1.96*sqrt(((p.*(1-p))./(data(:,2)+4))); % +/- term given alpha = 0.05

lower = max(p-delta,0); % lower bound of 95% CI
upper = min(p+delta,1); % upper bound of 95% CI

MfPrev = data(:,3)./data(:,2);  % used for the plotting
aa = [data(:,1) MfPrev MfPrev-lower upper-MfPrev]; % vector holding info for use with errorbar function
aa(:,[2 3 4]) = aa(:,[2 3 4])*100;

end
