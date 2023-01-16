function CB = RotInt()
% Article title: Multi-dimension SCMA Codebook Design Based on Constellation 
%                Rotation and Interleaving
% Date: 2020-08-06 10:17:14
% LastEditTime: 2020-08-20 14:09:23
% 主要功能：生成旋转交织论文提出的码本。
% Note: 
% 1. 码字平均功率为1  
% 2. 引用码本格式为 CB = RotInt()

    K=4;
    M=4;
    J=6;
    CB=zeros(K,M,J);

    % 母星座
    MC1 = [3*(1+1i) (1+1i) -(1+1i) -3*(1+1i)];
    MC2 = [-(1+1i) 3*(1+1i) -3*(1+1i) (1+1i)].*exp(1i*(pi/8));
    MC = [MC1;MC2]./sqrt(20); 

    a0 = exp(1j*0*pi);
    a1 = exp(1j*pi/6);
    a2 = exp(1j*pi/3);
%     a0 = exp(1j*0*pi);
%     a1 = exp(1j*pi/3);
%     a2 = exp(1j*pi*2/3);
    % 指示矩阵
    F=[0 1 1 0 1 0;...
       1 0 1 0 0 1;...
       0 1 0 1 0 1;...
       1 0 0 1 1 0];
    % 生成矩阵
%     G=[ 0 a1 a0  0 a2  0;
%        a0  0 a1  0  0 a2;
%         0 a2  0 a1  0 a0;
%        a1  0  0 a2 a0  0];
    G=[ 0 a0 a1  0 a2  0;
       a2  0 a0  0  0 a1;
        0 a2  0 a1  0 a0;
       a0  0  0 a2 a1  0];
    for j=1:J
        n=find(F(:,j));
        CB(n,:,j) = diag(G(n,j)) * MC;
    end
    
end

