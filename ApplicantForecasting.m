function [ G, w, z ] = ApplicantForecasting( x, y, m, n, alpha, beta )
% Input
% x: a vector of the independent variable values (year. should start from
% 0)
% y: a vector of the dependent variable values (number of applicants)
% n: number of steps to forecast ahead after the last data
% m: number of data to regress
% alpha and beta are Holt's method's parameters

% Output
% G : slope
% w : year forecasted
% z : forecasted number of applicants

xNew = x - min(x);
%Do regression on the first m data
xVec = xNew(1:m);
yVec = y(1:m);
coeff = polyfit (xVec,yVec,1);
yfit = polyval(coeff,xVec);

%Initial intercept to do Holt's method which is the last y value of
%calculated y value
S = yfit(end);
%Initial slope to do Holt's method which is slope from regression
G = coeff(1);

%Calculate value for S (updated intercept) and G (updated slope)
V = S;
for i = 1:length(xNew)-m
   newS = alpha * y(m+i) + (1-alpha) * (S(i)+G(i));
   newG = beta * (newS - S(i)) + (1-beta) * G(i);
   S = [S,newS];
   G = [G, newG];
   V = [V, newS+newG];
end

%b is number of graphs to generate
b = length(V)+1; 


%Compute the n-step ahead forecast after the last data point
z = S(end);
for i=1:n
    newF = S(end) + i * G(end);
    z = [z, newF];
end

%Plot the regression
subplot (b,1,1)
plot (x(1:m), yVec,'ro', x(1:m), yfit);
title ('Regression');
xlabel('year');ylabel('applicants');

%data points used in Holt's method
subX = x(m:end);

%Plot each step of Holt's method
for i=1:b-2
    temp1= subX(i:1:i+1);
    temp2= V(i:i+1);
    subplot(b,1,i+1)
    plot(temp1,temp2,'g',temp1,temp2,'ro',x(m+i-1:m+i),y(m+i-1:m+i),'bo');
    title(sprintf('Holt''s method Step %i',i));
    xlabel('year');ylabel('applicants');
    pause(1);
end

%Plot the forecasts
temp1 = (x(end):1:x(end)+n);
subplot(b,1,b)
plot(temp1,z,'g',temp1,z,'ro');
title ('Number of Applicant Forecasting');
xlabel('year');ylabel('applicants');

w = (x(end)+1:x(end)+ n);
z = z(2:end);
end
