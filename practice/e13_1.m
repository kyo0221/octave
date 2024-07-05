clear();
A = [0 1; -5 -6];
B = [0; 1];
x0 = [1; 1];
t = 0:0.01:4;
i = 0;
for n = t
i = i + 1;
x = expm(A * n) * x0;
x1(i) = x(1);
x2(i) = x(2);
endfor
plot(t, x1, t, x2);
