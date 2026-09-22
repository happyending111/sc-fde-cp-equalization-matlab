function Rdata=func_channel(Tdatas);

ricianchan = comm.RicianChannel(...
    'SampleRate',1e6,...                %采样率
    'PathDelays',[0.0 0.5 1.2]*1e-6,... %延迟
    'AveragePathGains',[0.1 0.5 0.2],...%增益
    'KFactor',7,...                     %银子
    'DirectPathDopplerShift',0.6);      %频移
Rdata=ricianchan(Tdatas.').';