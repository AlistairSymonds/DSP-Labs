function PlotCircSeq(xSeq)
%
% function PlotCircSeq(xSeq)
%
% input xSeq is a discrete sequence with N points
% 
% This function plots the points at locations on a circle from
% location exp(0*(2*pi/N)) to location exp((N-1)*(2*pi/N))

% First plot unit circle
unitCirc = exp(1j*(2*pi/1000)*(0:999)) ;
plot(real(unitCirc),imag(unitCirc),'k')
hold on
axis square
plot([1;-1],[0;0],'k') % x-axis
plot([0;0],[1;-1],'k') % y-axis

% Now plot sequence
N = length(xSeq) ;
pts = exp(1j * (2*pi/N) * (0:N-1)) ;
for I = 1 : N
    text(real(pts(I)),imag(pts(I)),num2str(xSeq(I)), ...
        'fontSize',16,'Color','r')
end
