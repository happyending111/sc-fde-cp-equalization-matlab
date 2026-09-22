function UW=func_UW(LEN_UW);
UW = zeros(1,LEN_UW); %uw序列
for n=1:1:LEN_UW
    a=pi.*power(n,2)./LEN_UW;
    UW(1,n)=complex(cos(a),sin(a));
end