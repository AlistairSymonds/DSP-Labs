function [xec, xoc] = circevod(x)
% signal decomposition into circular-complex even and circular-complex odd parts
% --------------------------------------------------------------
% [xec, xoc] = circecod(x)
%
N = length(x); n = 0:(N-1);
xec = 0.5*(x + conj(x(mod(-n,N)+1)));
xoc = 0.5*(x - conj(x(mod(-n,N)+1)));
