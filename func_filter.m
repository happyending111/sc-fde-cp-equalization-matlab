function [Tdatas,filiter1]=func_filter(frame_up,LEN_UW,Samples);

%滚降
alpha    = 0.3;   
%截断
span     = Samples*2;   
%符号采样个数
sps      = 1;   
%根升余弦滤波器
filiter1 = rcosdesign(alpha,span,sps,'sqrt'); 
s        = upfirdn(frame_up, filiter1); 
Tdatas   = reshape(s,1,size(s,1)*size(s,2));
Tdatas   = [zeros(1,LEN_UW*Samples),Tdatas]; 