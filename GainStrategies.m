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
% XX) CaseXX - start with steady gain, reach certain amount, spend points
% to increase gain rate, reach certain amount again, spend points to
% increase gain rate again
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

% Clean up MATLAB workstation; check which are needed
close all;
clear all;
clc;

% Time it
tic

% Create output directory
code_dir = pwd;
[temp_dir, imageName, ~] = fileparts(code_dir);
out_dir = [temp_dir '\Outputs\']
if ~exist(out_dir)
    mkdir(out_dir);
end

% Set up output file
gainDetailsFile = 'GainStrategies.xlsx';
IDT = {'Time\Control Case', 'Control Rate', 'Case 1', 'Rate 1', 'Case 2','Rate 2', 'Case 3', 'Rate 3', 'Case 4', 'Rate 4'};
IDI = {};
IDD = 0;
rowToWrite = 0;

% Control case details
timeLength = 100;
controlGain = 0.1;
increaseRate = 0.05;

% Case details
sumCase1 = 0;
gainCase1 = controlGain;
haveInc = 0;
sumCase2 = 0;
gainCase2 = controlGain;
sumCase3 = 0;
gainCase3 = controlGain;
sumCase4 = 0;
gainCase4 = controlGain;

for t = 0:controlGain:timeLength
    rowToWrite = rowToWrite + 1;
    
    % Document counts
    % Control case
    IDD(rowToWrite, 1) = t;
    IDD(rowToWrite, 2) = controlGain/0.1;
    % Case 1
    IDD(rowToWrite, 3) = sumCase1;
    IDD(rowToWrite, 4) = gainCase1/0.1;
    % Case 2
    IDD(rowToWrite, 5) = sumCase2;
    IDD(rowToWrite, 6) = gainCase2/0.1;
	% Case 3
	IDD(rowToWrite, 7) = sumCase3;
	IDD(rowToWrite, 8) = gainCase3/0.1;
    % Case 4
    IDD(rowToWrite, 9) = sumCase4;
    IDD(rowToWrite, 10) = gainCase4/0.1; 
    
    % Change rates
    % Case 1
    if haveInc == 0
        if single(sumCase1) >= 5
            haveInc = 1;
            sumCase1 = double(single(sumCase1) - 5);
            gainCase1 = gainCase1 + (increaseRate*controlGain);
        end
    end
    % Case 2
    if mod(t, 1) == 0
        if single(sumCase2) >= 5
            sumCase2 = double(single(sumCase2) - 5);
            gainCase2 = gainCase2 + (increaseRate*controlGain);
        end
    end
	% Case 3
	if mod(t, 1) == 0
		if single(sumCase3) >= 5
			sumCase3 = double(single(sumCase3) - 5);
			gainCase3 = gainCase3*(1 + increaseRate);
		end
    end
    % Case 4
    if mod(t, 1) == 0
        while single(sumCase4) >= 5
            sumCase4 = double(single(sumCase4) - 5);
            gainCase4 = gainCase4*(1 + increaseRate);
        end
    end
    
    % Increment cases
    sumCase1 = sumCase1 + gainCase1;
    sumCase2 = sumCase2 + gainCase2;
	sumCase3 = sumCase3 + gainCase3;
    sumCase4 = sumCase4 + gainCase4;
end

figure;
hold on
plot(IDD(:, 1), IDD(:, 1), 'k', 'LineWidth', 2);
plot(IDD(:, 1), IDD(:, 3), 'r', 'LineWidth', 2);
plot(IDD(:, 1), IDD(:, 5), 'b', 'LineWidth', 2);
plot(IDD(:, 1), IDD(:, 7), 'g', 'LineWidth', 2);
plot(IDD(:, 1), IDD(:, 9), 'm', 'LineWidth', 2);
title('Gain Strategies: Count', 'Interpreter', 'none');
xlabel('Time', 'FontSize', 12);
ylabel('Count', 'FontSize', 12);
set(gca, 'FontSize', 12);
savefig(gcf, [out_dir 'GainStrategies.fig']);
saveas(gcf, [out_dir 'GainStrategies.png']);

figure;
hold on
plot(IDD(:, 1), IDD(:, 2), 'k', 'LineWidth', 2);
plot(IDD(:, 1), IDD(:, 4), 'r', 'LineWidth', 2);
plot(IDD(:, 1), IDD(:, 6), 'b', 'LineWidth', 2);
plot(IDD(:, 1), IDD(:, 8), 'g', 'LineWidth', 2);
plot(IDD(:, 1), IDD(:, 10), 'm', 'LineWidth', 2);
title('Gain Strategies: Rate', 'Interpreter', 'none');
xlabel('Time', 'FontSize', 12);
ylabel('Rate', 'FontSize', 12);
set(gca, 'FontSize', 12);
savefig(gcf, [out_dir 'GainRate.fig']);
saveas(gcf, [out_dir 'GainRate.png']);

saveData(out_dir, gainDetailsFile, IDT, IDI, IDD);

% Timed
toc
