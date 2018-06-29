function y = OnesComplement(x,b)
% Sign-Magnitude format integer to b-bit One's-Complement format conversion
% -------------------------------------------------------------------------
% y = Sm2OnesC(x,b)
% Decimal equivalent of 
%  Sign-Magnitude format integer to b-bit One's-Complement format conversion
%
%    x: integer between -2^(b-1) < x <  2^(b-1) (sign-magnitude)
%    y: integer between        0 <= y <= 2^b-1   (2's-complement)

if any((x <= -2^(b-1) | (x >= 2^(b-1)))) 
    error('Numbers must satisfy -2^(b-1) < x <  2^(b-1)')
end

s = sign(x);  % sign of x (-1 if x<0, 0 if x=0, 1 if x>0)
sb = (s < 0); % sign-bit  (0 if x>=0, 1 if x<0));

y = (1-sb).*x + sb.*(2^b+x-1)