function [ output_args ] = displayPoly(p, r)
%DISPLAYPOLY displays polynom with start and endpoints

x1 = linspace(min(r),max(r));
f1 = polyval(p,x1);
plot(f1,x1,'--','LineWidth',4);
hold on;
plot(f1(1),min(r),'Ob','MarkerSize',10);
hold on;
plot(f1(end),max(r),'Or','MarkerSize',10);
hold on;
end

