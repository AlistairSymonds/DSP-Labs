%% Q1
X1_num = [1,-1,-4,4]
X1_den = [1,-11/4,13/8,-1/4];
[R1, P1, K1] = residuez(X1_num,X1_den);


%% Q2
X2_num = [1,1,-4,4];
X2_den = [1,-11/4,13/8,-1/4];
[R2, P2, K2] = residuez(X2_num, X2_den);

%% Q3
X3_num = [1,-3,4,1];
X3_den = [1,-4,1,-0.16];
[R3, P3, K3] = residuez(X3_num, X3_den);