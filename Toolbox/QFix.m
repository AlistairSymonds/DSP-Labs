function [y] = QFix(x,B,Qmode,Omode)
% Fixed-point Arithmetic using (B+1)-bit Representation
% -----------------------------------------------------
%   [y] = QFix(x,B,Qmode,Omode)
%      y: Decimal equivalent of quantized x with values in [-1,1)
%      x: a real number array
%      B: Number of fractional bits
%  Qmode: Quantizer mode
%         'round': two's-complement rounding characteristics
%         'trunc': Two's complement truncation characteristics
%  Omode: Overflow mode
%         'satur': Saturation limiter
%         'twosc': Two's-complement overflow
% Quantization operation
if strcmp(lower(Qmode), 'round');
    y = round(x.*(2^B));
elseif strcmp(lower(Qmode), 'trunc');
    y = floor(x.*(2^B));
else
    error('Use Qmode = "round" or "trunc"');
end;
y = y*(2^(-B)); % (B+1)-bit representation
% Overflow operation
if strcmp(lower(Omode), 'satur');
    y = min(y,1-2^(-B)); y = max(-1,y); % Saturation
elseif strcmp(lower(Omode), 'twosc');
    y = 2*(mod(y/2-0.5,1)-0.5);         % Overflow
else error('Use Omode = "satur" or "twosc"');
end;