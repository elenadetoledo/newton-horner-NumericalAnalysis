%%%PROJECT 1 - PART 3 - ELENA DE TOLEDO HERNÁNDEZ
%SECTION 3.2 - PROBLEM 5
%Use Newton's Method and Horner's algorithm: 
%The equation 2x^4 + 24x^3 +61x^2 - 16x + 1 = 0 has two roots near 0.1.
%Determine them

clear
clc

f = @(x) 2*x^4 + 24*x^3 +61*x^2 - 16*x + 1;
%df1 denotes the first derivative wrt to x of f
df1 = @(x) 8*x^3 + 72*x^2 + 122*x - 16; 

%First, I'll find the roots using only Newton's method

%Newton's method for the first root
%Let xn denote the initial condition:
xn = 0.1;
count = 0;
while (count < 50) && (df1(xn) ~= 0)
    
    
    count = count + 1;
    xn1 = xn - (f(xn)/df1(xn));
    
    xn = xn1;
    

    
    if abs(f(xn) - 0) < 10^-6
        
        count = 1000;
    end
    
        
end

fprintf('\nSEC 3.2 PROBLEM 5: First root using Newtons Method %f',xn)

%Newton's method for the second root
%Let xn denote the initial condition
xn = -3;
count = 0;

while (count < 50) && (df1(xn) ~= 0)
    
    
    count = count + 1;
    xn1 = xn - (f(xn)/df1(xn));
    
    xn = xn1;
    
    if abs(f(xn) - 0) < 10^-6
        
        count = 1000;
    end
    
        
end

fprintf('\nSEC 3.2 PROBLEM 5:Second root using Newtons Method %f',xn)
fprintf('\nxn \tNumber of its \tValue of xn+1 \tImage of f(xn+1)');
%Now, I implement Horner's algorithm to evaluate f(xn) and df1(xn) and use 
%this in Newton's method
xn = 0.1;
count = 0;

while (count < 50) && (df1(xn) ~= 0)
    
    %Horner's method for f
    coeff = [2, 24, 61, -16, 1];
    p = coeff(1);
    for i = 2:5
      p = coeff(i) + p*xn;
    end
    hf = p;
    
    %Horner's method for df1
    coeff = [8, 72, 122, -16];
    p = coeff(1);
    for i = 2:4
      p = coeff(i) + p*xn;
    end
    hdf = p;
    
    count = count + 1;
    xn1 = xn - (hf/hdf);
    fprintf('\n%f \t%d \t%f \t%f',xn,count,xn1,f(xn1));
    xn = xn1;
    
    if abs(f(xn) - 0) < 10^-6
        
        count = 1000;
    end
    
        
end

fprintf('\nSEC 3.2 PROBLEM 5:First root using Newtons Method along with Horners method %f',xn)
fprintf('\nxn \tNumber of its \tValue of xn+1 \tImage of f(xn+1)');

%Horner's method for the second root
xn = -3;
count = 0;

while (count < 50) && (df1(xn) ~= 0)
    
    %Horner's method for f
    coeff = [2, 24, 61, -16, 1];
    p = coeff(1);
    for i = 2:5
      p = p * xn + coeff(i);
    end
    hf = p;
    
    %Horner's method for df1
    coeff = [8, 72, 122, -16];
    p = coeff(1);
    for i = 2:4
      p = p * xn + coeff(i);
    end
    hdf = p;
    
    count = count + 1;
    xn1 = xn - (hf/hdf);
    fprintf('\n%f \t%d \t%f \t%f',xn,count,xn1,f(xn1));
    xn = xn1;
    
    if abs(f(xn) - 0) < 10^-6
        
        count = 1000;
    end
    
    
        
end

fprintf('\nSEC 3.2 PROBLEM 5:Second root using Newtons Method along with Horners method %f',xn)


