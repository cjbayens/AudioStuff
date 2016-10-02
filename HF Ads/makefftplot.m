function [f, P1] = makefftplot(data, Fs, peakProminance, bottom, top)
%peakProminance = 10 is a good place to start

    L = length(data);

    Y = fft(data);
    f = Fs * (0:(L/2))/L;
    P2 = abs(Y/L);
    P1 = P2(1:L/2+1);
%     P1(2:end-1) = 10*log10(2*P1(2:end-1));
    P1(2:end-1) = (2*P1(2:end-1));

%     Y = fft(data);
% %     P1 = 20*log10(1000*abs(Y));
%     P1 = abs(Y);
%     f = [0:length(Y)-1]/10;
    
    plot(f,P1);
    if isempty(peakProminance) == 0
    [pks, locs] = findpeaks(P1,f, 'MinPeakProminence',peakProminance);
    findpeaks(P1,f, 'MinPeakProminence',peakProminance);
    locs = locs';
    end
    if isempty(bottom) == 0
        xlim([bottom top]);
    end
    xlabel('f (Hz)')
    ylabel('|P1(f)|')
end
    