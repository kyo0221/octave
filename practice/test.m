clear();
pkg load control

m = 0.2;
l = 0.3;
M = 0.3;
g = 9.8;
J = 1/12*m*l^2;

a = (M+m)*(m*l^2+J)-m^2*l^2;
A = [0, 0, 1, 0; 0, 0, 0, 1; 0, -m^2*l^2*g/a, 0 ,0; 0, (m+M)*m*l*g/a, 0, 0];
B = [0; 0; (m*l^2+J)/a; -m*l/a];
C = [1, 0, 0, 1];

Mo = [C; C*A; C*A*A; C*A*A*A];
det(Mo)
Mc = [B, A*B, A*A*B, A*A*A*B];
det(Mc)

Aa = A'
Ba = C'
Ca = B'
D = 0

sys = ss(Aa, Ba, Ca, D);
P = [-3, -4, -9 , -1];
L = place(sys, P)';

Q = [1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1 ,0; 0, 0, 0, 1];
R = 1;

F = lqr(A,B,Q,R);

x = [0.1; 0.1;0.1;0.1];
xh = [0;0;0;0];

xb0 = [x; xh];
Ab = [A, -B*F; L*C, A-B*F-L*C];

dt = 0.1;
t = 0:dt:10;
i = 0;

for n = t
	i = i + 1;
	xb = Ab * xb0;
	x1(i) = xb(1);
	x2(i) = xb(2);
	x3(i) = xb(3);
	x4(i) = xb(4);
	xh1(i) = xb(5);
	xh2(i) = xb(6);
	xh3(i) = xb(7);
	xh4(i) = xb(8);
endfor

plot(t, x1, t, x2, t, x3, t, x4, t, xh1, 'o', t, xh2, 'o', t, xh3, 'o', t, xh4, 'o');