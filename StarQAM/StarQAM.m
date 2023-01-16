function CB=StarQAM(M, cbsize)
% Article: Design and Analysis of SCMA Codebook Based on Star-QAM Signaling Constellations
% Date: 2020-08-06 10:17:14
% LastEditTime: 2020-08-20 14:03:56
% 主要功能：生成GA论文提出的码本。
% Note: 
% 1. 对于4*6的来说，引用码本格式为 CB = StarQAM(4,1)
% 2. 码字平均功率为1  

% create StarQAM codebook for different modulation order,eg M=4, different codebook size, eg=4*6
% M = modulation order; cbsize = codebook size eg cbsize=1 denote 4*6 cbsize=2 denote 6*9
% cbsize=2 denote 5*10
switch cbsize
    % use cbsize to select spread matrix
case 1
%         F = [1 1 1 0 0 0; ...
%              1 0 0 1 1 0; ...
%              0 1 0 1 0 1; ...
%              0 0 1 0 1 1];
     F = [0 1 1 0 1 0; ...
          1 0 1 0 0 1; ...
          0 1 0 1 0 1; ...
          1 0 0 1 1 0];
case 2
    F = [0 0 1 0 0 0 1 0 1; ...
    0 1 0 1 0 0 1 0 0; ...
    0 0 1 1 0 1 0 0 0; ...
    1 0 0 0 1 0 0 0 1; ...
    1 0 0 0 0 1 0 1 0; ...
    0 1 0 0 1 0 0 1 0];
case 3
    F = [1 1 1 1 0 0 0 0 0 0; ...
    1 0 0 0 1 1 1 0 0 0; ...
    0 1 0 0 1 0 0 1 1 0; ...
    0 0 1 0 0 1 0 1 0 1; ...
    0 0 0 1 0 0 1 0 1 1];
end

% design mother constellation
Alpha = 3;
Beta = 1/0.63;
amplitudeArray = 1:M/2;
for m=1:M/2
    amplitudeArray(m) = (m-1)*(Alpha-1)+1;
end
R = sqrt(M / ((1+Beta^2)*2*sum(amplitudeArray.^2)));
t1 = R.*amplitudeArray(1:M/4);
t2 = R.*amplitudeArray(M/4+1:M/2);
t1f = fliplr(t1);
t2f = fliplr(t2);
MC = [t2f t1f -t1 -t2; ...
-t1 t2 -t2f t1f];
MC = diag([1 Beta]) * MC;

% design user codebook
K = size(F, 1);
J = size(F, 2);
CB = zeros(K,M,J);
switch cbsize
    % use cbsize to generate user codebook
case 1
    % operator parameters
    a1 = exp(1j*0.3*pi);
    a2 = exp(1j*0.5*pi);
    a3 = exp(1j*0.8*pi);
    % operator matrix
%     op(:,:,1) = [a1 0;0 a2];
%     op(:,:,2) = [1 0;0 1];
%     op(:,:,3) = [0 1;1 0]*[a1 0;0 a3];
%     op(:,:,4) = [1 0;0 a2];
%     op(:,:,5) = [0 1; 1 0];
%     op(:,:,6) = [1 0; 0 a3];
    op(:,:,1) = [0 1;1 0];
    op(:,:,2) = [1 0;0 1];
    op(:,:,3) = [a1 0;0 a2];
    op(:,:,4) = [1 0; 0 a3];
    op(:,:,5) = [0 1;1 0]*[a1 0;0 a3];
    op(:,:,6) = [1 0;0 a2];
    % user codebook
    for j=1:J
        CB(F(:,j)~=0,:,j) = op(:,:,j) * MC;
    end
end

end