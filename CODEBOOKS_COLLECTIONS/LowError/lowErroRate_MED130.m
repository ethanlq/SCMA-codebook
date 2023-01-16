%Downlink SCMA Codebook Design with Low Error Rate by Maximizing Minimum Euclidean Distance of
%Superimposed Codewords
clear all
M =4;
J  =6;
K = 4;
S1 = [-0.4969+0.0000i   -0.5790-0.0043i   0.5790+0.0043i   0.4969-0.0000i;
       0.2516+0.8044i   -0.7819-0.3102i   0.7819+0.3102i  -0.2516-0.8044i;
       0                        0                0                   0;
       0                        0                0                   0];
   
S2 = [  0,                  0,               0,           0;
        0 ,                 0,               0,           0;
     0.3036-0.2955i,    0.7086-0.5300i,  -0.7086+0.5300i, -0.3036+0.2955i;
     0.6048+0.7008i,   -0.3028-0.2982i,   0.3028+0.2982i, -0.6048-0.7008i];
 
S3 = [ 0.1787-0.7137i     0.8996-0.3570i      -0.8996+0.3570i    -0.1787+0.7137i;
              0                    0                     0                 0 ;
      -0.5264-0.0696i      0.4898-0.0103i       -0.4898+0.0103i    0.5264+0.0696i;
              0                     0                    0                   0];
S4 = [  0                    0                 0                   0 ;
    -0.5491+0.0077i     0.5034+0.0712i   -0.5034-0.0712i  +0.5491-0.0077i;
       0                    0                 0                     0 ;
    0.3049-0.8077i     0.7996-0.2351i   -0.7996+0.2351i   -0.3049+0.8077i ];

 S5 = [0.2927+0.8221i     -0.7798-0.2581i    0.7798+0.2581i   -0.2927-0.8221i;   
             0                    0               0                    0 
             0                    0               0                    0
        -0.5292-0.0245i   -0.5316-0.0226i    +0.5316+0.0226i  0.5292+0.0245i ];
    
S6 = [     0                    0                 0                    0        ;        
      0.4950-0.4726i    0.5690-0.5140i   -0.5690+0.5140i   -0.4950+0.4726i ;
      0.4539+0.5691i    -0.4126-0.4934i    0.4126+0.4934i  -0.4539-0.5691i;
           0                    0                 0                    0      ];
CODEBOOK = [S1 S2 S3 S4 S5 S6];
bit      =  {'00', '01', '11', '10'};      
       
figure()
plot(real(S1(1,:)),imag(S1(1,:)),'*','MarkerSize',10,'MarkerFaceColor',[0 0 1] )
text(real(S1(1,:)),imag(S1(1,:)),{'00', '01', '11', '10'},'FontSize',14,'Color','r'); 
hold on
plot(real(S1(2,:)),imag(S1(2,:)),'o','MarkerSize',10,'MarkerFaceColor',[0 0 1] )

text(real(S1(2,:)),imag(S1(2,:)),{'00', '01', '11', '10'},'FontSize',14,'Color','r'); 


figure()
plot(real(S2(3,:)),imag(S2(3,:)),'*','MarkerSize',10,'MarkerFaceColor',[0 0 1] )
text(real(S2(3,:)),imag(S2(3,:)),{'00', '01', '11', '10'},'FontSize',14,'Color','r'); 
hold on
plot(real(S2(4,:)),imag(S2(4,:)),'o','MarkerSize',10,'MarkerFaceColor',[0 0 1] )
text(real(S2(4,:)),imag(S2(4,:)),{'00', '01', '11', '10'},'FontSize',14,'Color','r'); 

figure()
plot(real(S3(1,:)),imag(S3(1,:)),'*','MarkerSize',10,'MarkerFaceColor',[0 0 1] )
text(real(S3(1,:)),imag(S3(1,:)),{'00', '01', '11', '10'},'FontSize',14,'Color','r'); 
hold on
plot(real(S3(3,:)),imag(S3(3,:)),'o','MarkerSize',10,'MarkerFaceColor',[0 0 1] )
text(real(S3(3,:)),imag(S3(3,:)),{'00', '01', '11', '10'},'FontSize',14,'Color','r'); 


figure()
plot(real(S4(2,:)),imag(S4(2,:)),'*','MarkerSize',10,'MarkerFaceColor',[0 0 1] )
text(real(S4(2,:)),imag(S4(2,:)),{'00', '01', '11', '10'},'FontSize',14,'Color','r'); 
hold on
plot(real(S4(4,:)),imag(S4(4,:)),'o','MarkerSize',10,'MarkerFaceColor',[0 0 1] )
text(real(S4(4,:)),imag(S4(4,:)),{'00', '01', '11', '10'},'FontSize',14,'Color','r'); 

figure()
plot(real(S5(1,:)),imag(S5(1,:)),'*','MarkerSize',10,'MarkerFaceColor',[0 0 1] )
text(real(S5(1,:)),imag(S5(1,:)),{'00', '01', '11', '10'},'FontSize',14,'Color','r'); 
hold on
plot(real(S5(4,:)),imag(S5(4,:)),'o','MarkerSize',10,'MarkerFaceColor',[0 0 1] )
text(real(S5(4,:)),imag(S5(4,:)),{'00', '01', '11', '10'},'FontSize',14,'Color','r'); 

figure()
plot(real(S6(2,:)),imag(S6(2,:)),'*','MarkerSize',10,'MarkerFaceColor',[0 0 1] )
text(real(S6(2,:)),imag(S6(2,:)),{'00', '01', '11', '10'},'FontSize',14,'Color','r'); 
hold on
plot(real(S3(3,:)),imag(S3(3,:)),'o','MarkerSize',10,'MarkerFaceColor',[0 0 1] )
text(real(S3(3,:)),imag(S3(3,:)),{'00', '01', '11', '10'},'FontSize',14,'Color','r'); 
 
[CB]=generate_CB(CODEBOOK,M,J);
plot_combane(CB)
save lowErrRate CB