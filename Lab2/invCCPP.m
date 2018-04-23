%b0 = Ac
%b1 = r*(As*sin(pi*v0)-Ac*cos(pi*v0))
%a1 = -2*r*cos(pi*v0)
%a2 = r^2
function [Ac, As, r, v0] = invCCPP(b0, b1, a1, a2)
    Ac = b0;
    r = sqrt(a2);
    v0 = (1/pi)*acos(a1/(-2*r));
    As = ((b1/r) + Ac*cos(pi*v0))/sin(pi*v0);
end