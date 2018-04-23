% function recSig = RecordAudio(recTime, devId, fs, sampPerFrame, userStart)
%
% Use this function to record audio. You will need to know the device
% id for the recording device. If you call this function with no arguments
% it will return and print the device id list. If you do not provide a device id it
% will simply use the first device.
%
% <recTime> - the length of time to record for
% <devId> - the recording device id number
% <fs> - the sample rate (default 48000), note that the sample rate has to
%        be support by your recording device
% <sampPerFrame> - the record buffer size (default 2048)
% <userStart> - set userStart to false to automatically start recording
%               otherwise the program will prompt the user to press the return key
%
% <recSig> is the recorded signal

function recSig = RecordAudio(recTime, devId, fs, sampPerFrame, userStart)

if nargin == 0
    aDR = audioDeviceReader ;
    recSig = aDR.getAudioDevices ;
    for I = 1 : length(recSig)
        ['Dev: ',num2str(I), ' ', recSig{I}]
    end
    return ;
end

if ~exist('fs','var') || isempty(fs)
    fs = 48000 ;
end
if ~exist('sampPerFrame','var') || isempty(sampPerFrame)
    sampPerFrame = 2048 ;
end
if ~exist('devId','var') || isempty(devId)
    devId = 1 ;
end
if ~exist('userStart','var') || isempty(userStart)
    userStart = true ;
end


% Setup Audio Recorder
aDR = audioDeviceReader ;
devNames = aDR.getAudioDevices ;
aDR = audioDeviceReader('Device',devNames{devId}, ...
                         'NumChannels', 1, ...
                         'SamplesPerFrame', sampPerFrame, ...
                         'BitDepth', '24-bit integer', ...
                         'SampleRate', fs, ...
                         'OutputDataType', 'double') ;

% Prepare to record audio
recSamp = recTime * fs ;
numFrames = ceil(recSamp / sampPerFrame) ;
recSig = zeros(numFrames * sampPerFrame, 1) ;

% Record Audio
if userStart
    fprintf(1,'Press a key to start recording\n') ;
    pause ;
end
for I = 1 : numFrames
    beginIdx = 1 + (I-1) * sampPerFrame ;
    endIdx = beginIdx + sampPerFrame - 1 ;
    [recSig(beginIdx : endIdx,1),overRun]  = record(aDR) ;
    if overRun
        disp('Recording Error') ;
    end
end
release(aDR) ;
