function [y,L,B] = QCoeff(x,N)
% Coefficient Quantization using N=L+B bit Representation with Rounding operation
%  [y,L,B] = QCoeff(x,N)
%        
%      y: quantized array (same dim as x)
%      L: number of integer bits 
%      B: number of fractional bits
%      x: a scalar, vector, or matrix
%      N: total number of bits

xm = abs(x);
 L = max(max(0,fix(log2(xm(:)+eps)+1))); % Integer bits
if (L > N)
     errmsg = [' *** N must be at least ',num2str(L),' ***'];
     error(errmsg);
end 
B = N-L;                            % Fractional bits
y = xm./(2^L); y = round(y.*(2^N)); % Rounding to N bits
y = sign(x).*y*(2^(-B));            % L+B+1 bit representation
