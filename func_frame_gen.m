function frame=func_frame_gen(UW,Dmap_qpsk,LEN_frame,LEN_ud);
UData    = zeros(LEN_frame,LEN_ud); 
for i=1:LEN_frame
    UData(i,:)=[UW Dmap_qpsk(i,:) UW];
end
UData = reshape(UData.',1,LEN_frame*LEN_ud);
frame = reshape(UData,1,size(UData,1)*size(UData,2));