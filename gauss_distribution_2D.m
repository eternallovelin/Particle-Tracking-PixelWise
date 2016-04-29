function f = gauss_distribution_2D(x, mu, sigma)
 p1 = - (sum((x - mu).^2)/(2*sigma^2))  ;  % assume sigmax = sigmay ; 
 p2 = 2*pi*sigma^2 ;
 f = exp(p1) ./ p2;
end 