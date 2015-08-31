% GainStrategies.m
%
% Question: Is it better to spend and increase productivity or to keep a
% steady gain when trying to reach a set amount?
% Answer: This code! (Potentially...)  
%
% Code: starting at the same point, with the same gain rate, one case will
% raise steadily as the control.  Different cases will be added to show
% different strategies, such as spending points to increase gain rate,
% doing so once or constantly, for different amounts of gain rate increase,
% etc...
%
% INPUTS:
% 
% OUTPUTS:
% 1) Plot with different cases showing gain over set amount of time, very
% long-term
% 2) Spreadsheet with data values
% 3) Spreadsheet with summary
%
% CASES:
% 0) ControlCase - Steady, linear, increasing 1-to-1; will also be uses as 
% a counter
% XX) CaseXX - start with steady gain, reach certain amount, spend points to
% increase gain rate, reach certain amount again, spend points to increase
% gain rate again
% VARIABLES: not all may be used
% 1) Spend Amount - minimum spending amount to increase gain rate; will try
% different minimum amounts
% 2) Gain Rate Increase - amount by which gain rate will increase; will try
% different incease amounts
% 3) Type of Increase - addition or multiplication; multiplication will be
% greater, addition will show by how much
% 4) Times to Increase Gain - number of times to spend and increase gain;
% will try limited or continuous
% 5) Limit of Single Increase - number of spending and increase in one
% action; will try minimum of 1 to maximum available



