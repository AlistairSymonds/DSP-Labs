x = [2,-4,5,3,-1,-2,6];
n_vec = (-3:3);
%h = [1,-1,1,-1,1];
h = [1,0,0,0,0];
k_vec = (-1:3) ;
y = zeros(1,length(n_vec)+length(k_vec)+1);
y_nvals = (0:length(y)-1);
for n = 1:length(y)
    for k = 1:length(y)
        
        xval = 0;
        if(k <= length(x))
            xval = x(k);
        end
        
        %assume hval is zero unless it exists in 
        hval = 0;
        h_index = n-k;
        if( h_index < length(k_vec) && h_index >= 1)
            hval = h(h_index);
        end
        
       
        
        y(n) = y(n) + xval.*hval;

    end
end
stem(y_nvals,y)