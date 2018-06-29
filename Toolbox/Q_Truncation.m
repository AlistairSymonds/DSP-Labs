function xq = Q_Truncation(x,B)
% Binary equivalent xq by truncation of x to B fraction bits
% ----------------------------------------------------------
% xq = Q_Truncation(x,B)
% 
xq = fix(x*2^B)/2^B;