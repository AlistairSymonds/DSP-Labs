function [H1,H2,Q, estat] = StatModelR(xn,B,N)
% Statistical Model (Rounding) for A/D Quantization error and its Distribution
% -------------  -------------------------------------------------------------
% [H1,H2,Q] = StatModelR(xn,B,N);
%   OUT: H1 = Normalized histogram of e1
%        H2 = Normalized histogram of e2
%         Q = Normalized histogram bins
%     estat = row vector: [[e1avg,e1std,e2avg,e2std]
%    IN:  B = bits to quantize
%         N = number of samples of x(n)
%        xn = samples of the sequence
% Plot variables
bM = 7; DbM = 2^bM;                      % bin parameter
M = round((DbM)/2);                     % Half number of bins
bins = (-M+0.5:1:M-0.5);                   % Bin values from -M to M
Q = bins/(DbM);                         % Normalized bins
% Quantization error analysis
xq = (round(xn*(2^B)))/(2^B);          % Quantized to B bits
e1 = xq-xn; clear xn xq;               % Quantization error
e2 = 0.5*(e1(1:N-1)+e1(2:N));          % Average of two adj errors
e1avg = mean(e1); e1std = std(e1);        % Mean & std dev of the error e1
e2avg = mean(e2); e2std = std(e2);        % Mean & std dev of the error e2
estat = [e1avg,e1std,e2avg,e2std];
% Probability distribution of e1
e1 = floor(e1*(2^(B+bM)));                 % Normalized e1 (int between -M & M)
e1 = sort([e1,-M-1:1:M]);                  %
H1 = diff(find(diff(e1)))-1; clear e1;     % Error histogram
if length(H1) == DbM+1
    H1(DbM) = H1(DbM)+H1(DbM+1);
    H1 = H1(1:DbM);
end
H1 = H1/N;                                 % Normalized histogram
% Probability distribution of e2
e2 = floor(e2*(2^(B+bM)));                 % Normalized e2 (int between -M & M)
e2 = sort([e2,-M-1:1:M]);                  %
H2 = diff(find(diff(e2)))-1; clear e2;     % Error histogram
if length(H2) == DbM+1
    H2(DbM) = H2(DbM)+H2(DbM+1);
    H2 = H2(1:DbM);
end
H2 = H2/N;                                 % Normalized histogram