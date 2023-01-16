%Optimized SCMA Codebook Design by QAM Constellation Segmentation With Maximized MED

c1 = [4.7619 1.4665+0.6075j;
       3     0.9238+0.3827j;
       0           0;
       0           0];
   
 c2 =[3     0.9238+0.3827j;
     0             0 ;
     4.7619 1.4665+0.6075j;
     0             0 ]  ;
 c3 = [1.5873  4.3990+1.8224j;
     0            0;
     0          0;
      3     0.9238+0.3827j];
  c4 =[0            0;
      1      2.7714+1.1481j;
      1.5873  4.3990+1.8224j;
      0      0];
  c5 = [0          0;
      4.7619 1.4665+0.6075j;
      0            0 ;
      1      2.7714+1.1481j];
  c6 = [0     0;
      0    0;
      1      2.7714+1.1481j;
      4.7619 1.4665+0.6075j];
  
  
  CODEBOOK = [c1 -c1 c2 -c2 c3 -c3 c4 -c4 c5 -c5 c6 -c6];
  save QAMSegmentation.mat CODEBOOK
  
  
  
  
  
  