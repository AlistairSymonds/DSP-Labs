function Xfq = dtft(xn, n, omega)
% xn is finite duration signal over n
% n is the sample position vector
% omega is the frequency location vector
    Xfq = exp(-1i*omega'*n)*xn';
end

