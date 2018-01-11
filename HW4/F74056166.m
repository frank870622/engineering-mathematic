clear
syms x;
syms y;
h = 0.1;
f = x*x + y*y;
yn(1) = 1;
xn = 0:h:0.5;
for i = 1:(length(xn)-1)
    yn(i+1) = yn(i) + h*(subs(f,[x,y],[xn(i),yn(i)]) + subs(f,[x,y],[xn(i+1),yn(i) + h*subs(f,[x,y],[xn(i),yn(i)])]))/2;
end
disp([xn',yn']);
%%
syms x;
syms y;
syms u;
un(1) = 1;
yn(1) = -2;
xn = 0:0.1:0.5;
h = 0.1;
f = 4*u - 4*y;
for i = 1:(length(xn)-1)
    un(i+1) = un(i) + h*subs(f,[u,y],[un(i),yn(i)]);
    yn(i+1) = yn(i) + h*un(i);
end
disp([xn',yn']);
%%
clear
syms x;
syms y;
xn = 0:0.1:0.5;
f = 2*x - 3*y + 1;
u(1) = 1;
h = 0.1;
for i = 1:4;
    k1 = subs(f,[x,y],[xn(i),u(i)]);
    k2 = subs(f,[x,y],[xn(i) + h/2,u(i) + h/2*k1]);
    k3 = subs(f,[x,y],[xn(i) + h/2,u(i) + h/2*k2]);
    k4 = subs(f,[x,y],[xn(i) + h,u(i) + h*k3]);
    u(i+1) = u(i) + h/6*(k1 + 2*k2 + 2*k3 + k4);
end

ydn = subs(f,[x,y],[xn(5),u(5)]);
ydns1 = subs(f,[x,y],[xn(4),u(4)]);
ydns2 = subs(f,[x,y],[xn(3),u(3)]);
ydns3 = subs(f,[x,y],[xn(2),u(2)]);
yn1 = u(5) + h/24*(55*ydn - 59*ydns1 + 37*ydns2 - 9*ydns3);
ydna1 = subs(f,[x,y],[xn(6),yn1]);
u(6) = u(5) + h/24*(9*ydna1 + 19*ydn - 5*ydns1 + ydns2);
disp([xn',u']);
