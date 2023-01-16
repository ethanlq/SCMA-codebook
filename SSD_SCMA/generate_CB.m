
function [CB]=generate_CB(CODEBOOK,M,J)

for t=1:J
    CB(:,:,t)=CODEBOOK(:,[1:M]+t*M-M);
end
