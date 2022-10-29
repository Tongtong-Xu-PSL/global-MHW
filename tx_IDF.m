function Nmatrix = tx_IDF(x,intrange,durrange)
%-----------------
% Input: x is the time series in the size of [1, n]
%        intrange is the intensity range, e.g. intrange = 0.1:0.1:1.5;
%        durrange is the duration range, e.g. durrange = 1:16;
% Output: Nmatrix is frequency matrix associated with each pair of thresholds
%         This result can be visualized by pcolor(Nmatrix).
%
% Xu et al 2022
%-----------------

Nmatrix = zeros(length(intrange),length(durrange));
for i = 1:length(intrange)
    for j = 1:length(durrange)
        id = tx_findEvents_basedOn_valueDuration(x,intrange(i),durrange(j));
        if ~isempty(id)
            Nmatrix(i,j) = length(id.duration);
        end
    end
end
