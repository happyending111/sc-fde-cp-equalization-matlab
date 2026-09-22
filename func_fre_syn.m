function Rdata_dw3=func_fre_syn(Rdata_dw2,UW,Time_idx,LEN_ALL,LEN_UW,LEN_fft,LEN_ud,LEN_data);

fs          = LEN_ALL;
c1          = sum(Rdata_dw2(Time_idx:Time_idx+LEN_UW-1).*conj(UW));
c2          = sum(Rdata_dw2(Time_idx+LEN_fft:Time_idx+LEN_ud-1).*conj(UW));
delta_f     = angle(c2/c1)*fs/(2*pi*LEN_data);
n           = 0:1:length(Rdata_dw2)-1;
Rdata_dw3   = Rdata_dw2.*exp(-1j*2*pi*delta_f.*n/fs);