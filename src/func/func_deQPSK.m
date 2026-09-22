function [rxData1,rxData]=func_deQPSK(tmps1,tmps2);
tmps1           = reshape(tmps1.',1,size(tmps1,1)*size(tmps1,2));
tmps2           = reshape(tmps2.',1,size(tmps2,1)*size(tmps2,2));
qpskDemodulator = comm.QPSKDemodulator('BitOutput',false);
rxData          = qpskDemodulator(tmps1.');
rxData1         = qpskDemodulator(tmps2.');