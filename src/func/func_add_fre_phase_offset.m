function r=func_add_fre_phase_offset(Rdata_dw,LEN_ALL,Fre_offset,Phase_offset);
n                   = 0:1:length(Rdata_dw)-1;
%添加频偏相偏
r                   = Rdata_dw.*exp(1j*2*pi*Fre_offset*n/LEN_ALL+1j*Phase_offset); 