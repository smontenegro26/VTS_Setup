% Make Motor Experiment Files


% Prompt for ExperimentSpecs
[experimentSpecs, whichSite, selectionMade] = bairExperimentSpecs('prompt', true);
if ~selectionMade, return; end

% Which experiment to make?
[experimentType, selectionMade] = bairWhichExperiment();
if ~selectionMade, return; end

% Set some defaults for all the experiments
TR              = 0.850;      % ms
stimDiameterDeg = 16.6;       % degrees

% Generate stimulus template and set some defaults
stimParams = stimInitialize(experimentSpecs, whichSite, stimDiameterDeg);

% Find the selected experiment
switch experimentType
    case 'GESTURES'
        stimDurationSeconds    = 5;
        numberOfRuns = 1;
        
        for runNum = 1:numberOfRuns
            % MAKE TASK EXPERIMENT
            stimMakeGesturesExperiment(stimParams, runNum, TR, stimDurationSeconds);
        end
    case 'FINGERMAPPING'
    
    case 'BOLDHAND'
        stimDurationSeconds = 0.5;
        numberOfRuns = 1;
        for runNum = 1:numberOfRuns
            % MAKE TASK EXPERIMENT
            stimMakeBoldHandExperiment(stimParams,  runNum, TR, stimDurationSeconds)
        end 
        
    case 'BOLDSAT'
        
end
