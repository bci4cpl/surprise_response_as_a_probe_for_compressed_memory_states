% This code accompanies the data published with the paper:
% "Surprise response as a probe for compressed memory states" 
% by Hadar Levi-Aharoni, Oren Shriki and Naftali Tishby.
% After running this code on a dataset you will have the following arrays:
% full_data_new - all EEG data and trigger channel (last channel)
% time - time progress during the experiment. Sampling rate is 256Hz. Each
%        time point corresponds to an EEG sample. Time t=0 corresponds to
%        the beginning of recording.
% Trig - same as trigger channel (last channel in full_data_new). Trigger
%        codes: 514 - beginning of measurement, 100/200 - end of block
%               1/2 - high frequency, 3/4 - low frequency
% If using the corresponding stimSeq file, note that in a few datasets 
% there are ~1-2 trials missing (missed triggers) and should be taken care of
% (should be manually removed in the analysis)
%
% Example:
% load('S1\Data_S1.mat')
% prepare_data_and_triggers_P300Dataset;


full_data_new = full_data.Data';

Trig = full_data_new(end,:);

% Removing duplicate triggers in consequent samples (regularly shouldn't happen):
duplicateTrigInds = find_duplicate_triggers(Trig);
Trig(duplicateTrigInds) = 0;

% Fixing triggers:
Trig = convert_triggers_P300Dataset(Trig);


full_data_new = [full_data_new(1:end-1,:); Trig]; % data ready for analysis.


if isfield(full_data,'Time')
    time  = full_data.Time'; % the time of the samples along the experiment
else
    % All measurement were performed with sampling rate = 256Hz
    time = 0:1/256:(1/256)*(length(full_data.Data)-1);
end

clear('duplicateTrigInds','full_data')