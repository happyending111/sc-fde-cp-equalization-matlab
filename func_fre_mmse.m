function [tmps1,tmps2,hk_1]=func_fre_mmse(Rdata_dw3,UW,LEN_ud,LEN_fft,LEN_UW,Time_idx,LEN_data,LEN_frame);

tmps1   = zeros(LEN_frame,LEN_data);
tmps2   = zeros(LEN_frame,LEN_data);
for i=1:LEN_frame
    %SNRest
    rr1   = Rdata_dw3(1,Time_idx:Time_idx+LEN_UW-1);
    rr2   = Rdata_dw3(1,Time_idx+LEN_fft:Time_idx+LEN_ud-1);
    rr3   = Rdata_dw3(1,Time_idx+LEN_UW:Time_idx+LEN_ud-1);
    Noise = sum( power( abs(rr1-rr2),2 ) )/LEN_UW/2;
    Pdata = sum( power( abs( [rr1,rr2] ),2 ) )/LEN_UW/2 - Noise;
    SNRest= Pdata/Noise;


    % 提取UW序列做平均
    yuw     = (rr1+rr2)/2;
    Hk      = fft(yuw)./fft(UW);   
    hk      = ifft(Hk);    
    for k=1:1:length(hk)    
        if abs(hk(k))<0.04
           hk(k)=0;
        end
    end
    hk_1    = [hk,zeros(1,LEN_fft-length(hk))];
    Hk_1    = fft(hk_1);
    %域均衡
    Rk      = fft(rr3);
    %ZF
    Hk_ZF   = 1./Hk_1;
    Vk_ZF   = ifft(Hk_ZF.*Rk);
    %MMSE
    Hk_MMSE = conj(Hk_1)/( power(abs(Hk_1),2)+1/SNRest );
    Vk_MMSE = ifft(Hk_MMSE.*Rk);
    
    tmps1(i,:) = Vk_ZF(1:1:LEN_data);
    tmps2(i,:) = Vk_MMSE(1:1:LEN_data);

    Time_idx = Time_idx+LEN_ud;
end