clear
x = -5:0.1:5;
f = [3 -4 -1];
F = polyint(f);
F(length(F)) = 2;
A = polyval(F,x);
r = roots(F);
figure
hold on
plot(x,A,'b');
plot(r,0,'or');
grid on
hold off
%%
clear
syms x;
f = exp(2*x) + 3*x*x;
df = diff(f);
F = int(f);
G = int(F);
F = F - subs(F,x,1) + 3;
G = G - subs(G,x,2) + 1;
p1 = double(subs(f,x,12:0.1:15));
p2 = double(subs(df,x,12:0.1:15));
p3 = double(subs(F,x,12:0.1:15));
p4 = double(subs(G,x,12:0.1:15));
figure
hold on
plot(12:0.1:15,p1,'r');
plot(12:0.1:15,p2,'g');
plot(12:0.1:15,p3,'b');
plot(12:0.1:15,p4,'k');
legend('f(x)','df(x)/dx','F(x)','G(x)');
hold off
%%
clear
t=1:0.1:2;
y(1) = 5;
for i = 2:length(t)
    y(i) = y(i-1) + (2*(t(i-1)) - 3*(y(i-1)) + 1)*0.1;
end
disp(['       x  ','       y']);
disp([t',y']);