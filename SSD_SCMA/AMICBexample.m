
% example of generate AMICB1


rho =-0.525;
phi      =  (1-sqrt(5))/2 ;
theta    = 0.6590;    
delta    = -1.96;  
phase    = [-1.96 0.2714  0.5552];  
[CB CODEBOOK ]=  GenCb(rho,phi,phase,theta);
