% This file caculate the MED of different codebooks
clear all
close all
J      = 6;
K      = 4;
M      = 4;
bitPerSym  = 2;
 load('Proposed_E2ESCMA.mat')
J      = 6;
K      = 4;
M      = 4;
bitPerSym  = 2;
CODEBOOK   = reshape(CB,K,[]);
scatterplot(reshape(CODEBOOK,1,[]))
SEQ_ENERGY = sum(sum(CODEBOOK.*conj(CODEBOOK)))/J/M;  % energy of a codeword
CODEBOOK     = sqrt(1/SEQ_ENERGY)*CODEBOOK;     %normalise a codeword to engrgy 1,average energy of canstealation is 1     
[CB]                  = generate_CB(CODEBOOK,M,J);
% calculating the minimum Euclidean distance of superimposed constellation
[K,M,J] = size(CB);  % K: number of resource node; M: codebook size; J: number of users
A = cell(J,1);
for j=1:J
A{j} = 1:M;
end
B   = cartesian(A{:}); % obtain all possible combinations of users (total M^J), such as(1,1,1,1,1,1)
cbBeginIdx    = 0:M:M*J-1;
cbIdx         = B + cbBeginIdx;
len_          = size(B) ;
combCb        = complex(zeros(K,len_(1)));
for combCnt = 1:1:len_(1)
    comb_                = CODEBOOK(:,cbIdx(combCnt,:));
    combCb(:,combCnt)    = sum(comb_,2);
end
 X   = combCb;
 Y  = [real(X);imag(X)];    % complex -> real

[M,N]   = size(Y );
dmin    = 100.01;
dspect  = [];
 
   for n1 = 1:1:N
       dmin_  = 100.0;
     for n2 = 1:1:N
                     d  = 0.0;
                     if n1 ~= n2
                         for m = 1:M
                          d = d + (Y(m,n2)-Y(m,n1))^2;   % Eculidean distance
                         end
                     if d < dmin
                          dmin = d;    % minmum Eculidean distance
                          l_1 = n1;
                          l_2 = n2;
                     end
                     end
  