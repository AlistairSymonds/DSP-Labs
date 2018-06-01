%% fft xcor
n = [0:50]
x = sin(2*pi*(n));
h = exp(n(1:10));
plot(x)
plot(h)
plot(conv(h,x))
figure
hPad = zeros(size(x));
hPad(1:size(h,2)) = h(1:size(h,2));

plot(cconv(h,x))
figure
xf = fft(x);
hf = fft(hPad);
freqDomConv = xf.*hf
xcor2 = ifft(freqDomConv )
plot(xcor2)
%%