function [data,fs] = getaudiodata(filename, time,fs)
recObj = audiorecorder(fs,16,1,1); %,2,4);
display('start');
% X = maketimestamp([],1);
record(recObj);
pause(time);
stop(recObj);
display('stop');
data = getaudiodata(recObj);

if isempty(filename) == 0
save(filename, 'data','fs');%,'X');
end