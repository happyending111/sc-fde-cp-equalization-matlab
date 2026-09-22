function Dmap_qpsk=func_QPSK(data,LEN_data,LEN_frame)
D_qpsk   = comm.QPSKModulator('BitInput',false);
Dmap_qpsk= D_qpsk(data);
Dmap_qpsk= reshape(Dmap_qpsk,LEN_data,LEN_frame).';