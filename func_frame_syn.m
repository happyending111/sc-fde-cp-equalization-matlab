function [Frame_peaks]=func_frame_syn(Rdata_dw2,UW,LEN_UW,Frame_N);
Frame_peaks = zeros(1,Frame_N);
for jj=1:Frame_N
    Frame_peaks(jj) = sum(conj(UW(1:LEN_UW)).*Rdata_dw2(jj:jj+LEN_UW-1));
end
%帧头搜索
[~,locs] = findpeaks(real(Frame_peaks),'minpeakheight',20);
 