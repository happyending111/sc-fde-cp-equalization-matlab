function [Time_syn,P,R,M]=func_time_syn(Rdata_dw2,LEN_UW,Time_N,Time_N2);

P           = zeros(1,LEN_UW);
R           = zeros(1,LEN_UW);
M           = zeros(1,LEN_UW);
for d=1:1:Time_N
    P(d) = sum(Rdata_dw2(d:d+LEN_UW-1).*conj(Rdata_dw2(d+Time_N2:d+Time_N2+LEN_UW-1)))+sum(Rdata_dw2(d:d+LEN_UW-1).*conj(Rdata_dw2(d+Time_N2+LEN_UW:d+Time_N2+2*LEN_UW-1)))+sum(Rdata_dw2(d+Time_N2:d+Time_N2+LEN_UW-1).*conj(Rdata_dw2(d+Time_N2+LEN_UW:d+Time_N2+2*LEN_UW-1)));
    R(d) = sum(power(abs(Rdata_dw2(d:d+LEN_UW-1)),2))+sum(power(abs(Rdata_dw2(d+Time_N2:d+Time_N2+LEN_UW-1)),2))+sum(power(Rdata_dw2(d+Time_N2+LEN_UW:d+Time_N2+2*LEN_UW-1),2));
    M(d) = power(abs(P(d)),2)/power(abs(R(d)),2);
end
[~,locs] = findpeaks(M,'minpeakheight',1);
Time_syn = locs(1);