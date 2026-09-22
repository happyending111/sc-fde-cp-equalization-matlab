function [rxData1,rxData]=dQAM(tmps1,tmps2);
tmps1           = reshape(tmps1.',1,size(tmps1,1)*size(tmps1,2));
tmps2           = reshape(tmps2.',1,size(tmps2,1)*size(tmps2,2));
qamDemodulator = comm.QAMemodulator('BitOutput',false);
rxData          = qamDemodulator(tmps1.');
rxData1         = qamDemodulator(tmps2.');