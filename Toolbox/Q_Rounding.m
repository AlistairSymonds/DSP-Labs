function xq = Q_Rounding(x,B)
% Binary equivalent xq by rounding of x to B fraction bits
% --------------------------------------------------------
% xq = Q_Rounding(x,B)
%
xq = round(x*2^B)/2^B;