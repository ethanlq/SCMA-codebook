C1 = [-0.3318+0.6262i -0.8304+0.4252i 0.8304-0.4252i 0.3318-0.6262i;
0                0                 0               0 ;
0.7055           -0.3601         0.3601          -0.7055;
0                0                 0               0 ];


C2 = [0                0                 0               0 ;
     0.7055           -0.3601         0.3601          -0.7055;
      0                0                 0               0 ;     
-0.3318+0.6262i -0.8304+0.4252i 0.8304-0.4252i 0.3318-0.6262i];
 
 C3 = [ 0.3601         0.7055           -0.7055        -0.3601 ;
      -0.4202-0.8350i  0.5933+0.3548i  -0.5933-0.3548i 0.4202+0.8350i;
        0                0                 0               0 ;
      0                0                 0               0 ];
  
  C4 = [0                0                 0               0 ;
      0                0                 0               0;
      -0.3318+0.6262i -0.8304+0.4252i 0.8304-0.4252i 0.3318-0.6262i;
      -0.4202-0.8350i  0.5933+0.3548i  -0.5933-0.3548i 0.4202+0.8350i];
  C5  =[   -0.4202-0.8350i  0.5933+0.3548i  -0.5933-0.3548i 0.4202+0.8350i;
              0                0                 0               0 ;
              0                0                 0               0; 
             0.3601          0.7055           -0.7055           -0.3601];
   C6  = [0                0                 0               0 ;
       -0.3318+0.6262i -0.8304+0.4252i 0.8304-0.4252i 0.3318-0.6262i;
           -0.4202-0.8350i  0.5933+0.3548i  -0.5933-0.3548i 0.4202+0.8350i;             
              0                0                 0               0];
   
   
   CODEBOOK = [C1 C2 C3 C4 C5 C6];
scatterplot(reshape(CODEBOOK,1,[]))

 
[CB]=generate_CB(CODEBOOK,4,6);
plot_combane(CB)
save DE_awgn CB


C1 = [-0.3344-0.7316i  -0.5754+0.2224i  ; 
0                         0;
0.4153-0.4248i  0.4680+0.6328i;
0                        0 ];

C2 =[ 0   0 ;
0.4153-0.4248i  0.4680+0.6328i;
0   0;
-0.3344-0.7316i   -0.5754+0.2224i];

C3 = [-0.4680-0.6328i  0.4153-0.4248i;
    -0.1492-0.5839i  0.7759-0.171i;
    0    0;
    0   0];
C4  = [   0    0;
    0   0;
    -0.3344-0.7316i   -0.5754+0.2224i;
 -0.1492-0.5839i  0.7759-0.1713i];
C5   = [-0.1492-0.5839i  0.7759-0.171i;
     0    0;
    0   0;
    -0.4680-0.6328i  0.4153-0.4248i];
C6 = [0    0;
    -0.3344-0.7316i   -0.5754+0.222i;
    -0.1492-0.5839i  0.7759-0.171i;
    0    0];

     
   CODEBOOK = [C1 -C1(:,end:-1:1) C2 -C2(:,end:-1:1) C3 -C3(:,end:-1:1) C4 -C4(:,end:-1:1) C5 -C5(:,end:-1:1) C6 -C6(:,end:-1:1)];
scatterplot(reshape(CODEBOOK,1,[]))
  
[CB]=generate_CB(CODEBOOK,4,6);
plot_combane(CB)
save DE_rayleigh CB
