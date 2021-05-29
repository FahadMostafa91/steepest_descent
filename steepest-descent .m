function [x, conv] = mysteepest(A, b, x, tol, maxiteration)
 % MYSTEEPEST - solve A*x = b using steepest descent algorithm
 % returns the solution and the convergence information
 % Fahad Mostafa @ TTU
 iterationation = 1;
 r = b - A*x; %## residual 
 delta = r'*r;
 conv = delta;
 delta0 = delta;
 while (delta > tol*delta0) && (iteration < maxiteration) % condition 
 q = A*r;
 alpha = delta/(q'*r);
 x = x + alpha*r;  % learning rate 
 if mod(iteration,50) == 0
 r = b - A*x; % once in a while recalculate r
 else
 r = r - alpha*q; 
 end
 delta = r'*r;
 conv = [conv, delta];
 iteration = iteration + 1;
 end
end
 

%{ Use the following matrix and call function 
 
  A = [9 0;0 1];
  b = [-0.5;1];
  x = zeros(2,1);
  tol= 10^-10;
  maxiteration=100;
  [x, conv] = mysteepest(A, b, x, tol, maxiteration);
  norm(b-A*x)
x
%}


