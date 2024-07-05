clear();
pkg load control
A = [0 1; -5 -6]
B = [0; 1]
C = [1 0]
Q = [1 0; 0 1]
R = 1
F = lqr(A, B, Q, R)
A2 = A-B*F
t = 0:0.01:4;
i = 0;
x0 = [1; 0];
for n = t
i = i + 1;
x = expm(A2 * n) * x0;
x1(i) = x(1);
x2(i) = x(2);
endfor
plot(t, x1, t, x2)
