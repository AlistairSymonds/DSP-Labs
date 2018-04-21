function [y,H] = conv_tp(h,x)
% Linear Convolution using Toeplitz Matrix
% -----------------------------------------
% [y,H] = conv_tp(h,x)
% y = output sequence in column format
% H = Toeplitz convolution matrix
% h = impulse response in column format
% x = input sequence in column format