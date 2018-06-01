x = [2,-4,5,3,-1,-2,6];
n_vec = (-3:3);
h = [1,-1,1,-1,1];
k_vec = (-1:3) ;
y = zeros(1,length(n_vec)+length(k_vec));



for n = 1:length(y)
    for k = 1:length(y)
        hval = 0;
        if( n-k < size(k_vec,2) && n-k >= 1)
            hval = h(n-k);
        end
        
        xval = 0;
        if(k< length(x))
            xval = x(k);
        end
        
        y(n) = y(n) + xval.*hval;

    end
end
stem(y)

cnv = dsp.Convolver;

%h2 = [1,0.5,0.25,0.125,0.0625]; %0.5^n
%c = cnv(h1',h2');
%stem(c);

