function [data, fs1] = recordaudiodata(filename, samplesignal, fs)
fs1 = 44100;
recObj = audiorecorder(fs1,16,1,1); %,2,4);
% a = miraudio(samplesignal,fs);
time = length(samplesignal)/fs;
display('start');
% X = maketimestamp([],1);
record(recObj);
soundsc(samplesignal,fs);
pause(time);
stop(recObj);
display('stop');
data = getaudiodata(recObj);
if isempty(filename) == 0
    save(filename, 'data','fs1');
end
