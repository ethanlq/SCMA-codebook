function C = cartesian(varargin)
% Compute the Cartesian product of multiple arrays
    args = varargin;
    n = nargin;
    [F{1:n}] = ndgrid(args{:});
    for i=n:-1:1
        G(:,i) = F{i}(:);
    end
    C = unique(G , 'rows');
end

