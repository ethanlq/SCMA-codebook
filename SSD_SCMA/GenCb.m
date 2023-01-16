function  [CB CODEBOOK ]=  GenCb(rho,phi,para,theta)
close all

M = 4;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%optimized permutation 
perm = [4 3 2 1 ;
        1 2 3 4];        
%%
 if M ==4
    str = {'1','2','3','4'};
elseif M ==8
    str = {'1','2','3','4','5','6','7','8'};
 end


nn    = 1:M;
P =M;
c_disc  = sqrt(2*P/(M+1));
r_n      = c_disc * sqrt(nn+rho);
GAM_SCMA = r_n.*exp(1j*2*pi*(theta+phi).*nn);
 %%%%%%%%%%%%%%%%mapping
S_1 = 1:2:M;
S_2 = 2:2:M;
MC_ =  zeros(2,length(S_1))+1j;
MC_(1,:) = GAM_SCMA(S_1);
MC_(2,:) = GAM_SCMA(S_2);
MC = [MC_    -MC_];
E =  sum(sum(abs(MC).^2))/M;
MC   = MC./sqrt(E);
%  dimension permutation 
MC_1  = MC(1,:);
MC_2  = MC(2,:);
MC         =  [MC_1(perm(1,:)) ; MC_2(perm(2,:))  ];

%  
% subplot(131)  % first dim of MC
% str = {'00','01','10','11'};
% plot(MC(1,:),'o')
% xlim([-1 1])
% ylim([-1 1])
% text(real(MC(1,:)),imag(MC(1,:)),str)
% subplot(132)
% plot(MC(2,:),'o') % second dim of MC
% xlim([-1 1])
% ylim([-1 1])
% text(real(MC(2,:)),imag(MC(2,:)),str)
% xlim([-1 1])
% ylim([-1 1])
% subplot(133)
% plot(MC(1,:),'o') % second dim of MC
% hold on
% plot(MC(2,:),'o') % second dim of MC

 %%
F = [     % Factor graph matrix: should be regular
0 1 1 0 1 0
1 0 1 0 0 1
0 1 0 1 0 1
1 0 0 1 1 0];
 
 
V = size(F,2);
K = size(F,1);
dv = max(sum(F,1));
 
CB      = complex(zeros(K,M,V),zeros(K,M,V));
 PHI    = zeros(1,3)+1j;
PHI(1) = exp(1j*pi*para(1));
PHI(2) = exp(1j*pi*para(2));
PHI(3) = exp(1j*pi*para(3));
 
%%% ROTATION ANGLE
% phi_mat = [
%     0      PHI(1) PHI(2) 0      PHI(3)  0
%     PHI(1) 0      PHI(3) 0      0       PHI(2)
%     0      PHI(3) 0      PHI(2) 0       PHI(1)
%     PHI(2) 0      0      PHI(3) PHI(1)  0
%    ];
%  
phi_mat = [%better than above
    0      PHI(3) PHI(1) 0      PHI(2)  0
    PHI(2) 0      PHI(3) 0      0       PHI(1)
    0      PHI(2) 0      PHI(1) 0       PHI(3)
    PHI(1) 0      0      PHI(2) PHI(3)  0
   ]; 
 
for i=1:V
    I  = eye(dv);
    Vj = zeros(K,dv);
    ind = 1;
    for k = 1:K
        if(F(k,i)==1) 
            Vj(k,:) = I(ind,:);
            ind = ind + 1;
        end
    end
end

% dimension switching
    MC1 = MC;
    MC2 = [MC(2,:); MC(1,:)];
    J1 = [1 3 5];
    J2 = [2 4 6];
 
   for j=1:V
     n=find(F(:,j));                 % obtain the resource nodes occupied by each user
     if all(ismember(j,J1))
        CB(n,:,j) = diag(phi_mat(n,j)) * MC1;  % generating odd user SCMA codebook
    elseif all(ismember(j,J2))
        CB(n,:,j) = diag(phi_mat(n,j)) * MC2;  % generating even user SCMA codebook
     end
end

CODEBOOK      = reshape(CB,K,[]);
SEQ_ENERGY    = sum(sum(CODEBOOK.*conj(CODEBOOK)))/V/M;  % energy of a codeword
CODEBOOK      = sqrt(1/SEQ_ENERGY)*CODEBOOK;             %normalise a codeword to engrgy 1
 %average energy of canstealation is 1     
[CB]       = generate_CB(CODEBOOK,M,V);

scatterplot(reshape(CB,1,[]))
end
