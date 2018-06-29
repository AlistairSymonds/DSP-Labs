function Gv = VarGain(b,a)
% Computation of variance-gain for the output noise process
% of digital filter described by b(z)/a(z)
%  Gv = VarGain(b,a)
%

a0 = a(1); a = a/a0; b = b/a0;
M = length(b); N = length(a);

if N == 1                           % FIR Filter
    Gv = sum(b.*b);
    return
else                                % IIR Filter
    [R,p,P] = residue(b,a);
    if length(P) > 1
        error('*** Variance Gain Not computable ***');
    elseif length(P) == 1
        Gv = P*P;
    else
        Gv = 0;
    end
    Rnum = R*R'; pden = 1-p*p';
    H = Rnum./pden; Gv = Gv + real(sum(H(:)));
end