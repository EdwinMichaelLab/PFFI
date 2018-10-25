% Function: get_the95LU_bounds_agedata
%  
% Description: 
%       Using the values returned by the function 
%       "ConstructBinomialErrorBars", this function calculates the upper and
%       lower bounds of the 95% binomial confidence interval of a data point.
% 
% Inputs:
%       data: in the form of a matrix where each row represents a single
%       data point and the columns indicate 1: either the mid-age of the age
%       group for baseline data or the time of the survey for intervention
%       data, 2: the number of people sampled, 3: the number testing positive, 
%       and (for baseline data only) 4: the maximum age in the age group
%       
% Outputs:
%       Bounds: a matrix with the same number of rows as "data" where the
%       columns represent 1: the mid-age (for baseline data) or survey time 
%       (for intervention data), 2: the lower prevalence limit of the 
%       confidence interval, and 3: the upper prevalence limit of the 
%       confidence interval
% ________________________________________

function Bounds = get_the95LU_bounds_agedata(data)

aa = ConstructBinomialErrorBars(data);
Bounds = [aa(:,1), aa(:,2)-aa(:,3), aa(:,2)+aa(:,4)];

end
