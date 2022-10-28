function id = tx_findEvents_basedOn_valueDuration(ssti,valThres,duraThres)
%-----------------
% Input: ssti - a time series (vector)
%        valThres - specified intensity of interest
%        duraThres -  specific duration of interest
% Output: id is a structure, which contains
%         id.startloc - the start dates of each mhw
%         id.endloc - the end dates of each mhw
%         id.duration - the duration of each mhw
% 
% Note that the length of the output (i.e., length(id.duration)) thus represents the number of events
%
% Xu et al 2022
%-----------------

% flag time series based on threshold only: 0 and 1
loc = ssti>=valThres;
if ~any(loc)
    disp('No event satisfies the condition')
    id = [];
else
    mhwbinary = zeros(size(ssti));
    mhwbinary(loc) = 1;

    % find start and end locations of all events 
    diff = mhwbinary(2:end)-mhwbinary(1:end-1);
    startloc = find(diff==1);
    endloc = find(diff==-1);
    
    if ~isempty(startloc) && ~isempty(endloc)
        if startloc(1)<endloc(1) && startloc(end)>endloc(end)
            endloc = [endloc length(ssti)];
        elseif startloc(1)>endloc(1) && startloc(end)<endloc(end)
            startloc = [0 startloc];
        elseif startloc(1)>endloc(1) && startloc(end)>endloc(end)
            startloc = [0 startloc];
            endloc = [endloc length(ssti)];
        end
    elseif isempty(startloc) && ~isempty(endloc)
        startloc = 0;
    elseif ~isempty(startloc) && isempty(endloc)
        endloc = length(ssti);
    end

    % duration of all events
    duration = endloc-startloc;

    % find events that also satisfy the duration threshold
    durLoc = find(duration>=duraThres);

    % final start, end and duration id based on both the threshold and duration
    % can be obtained as follow
    id.startloc = startloc(durLoc)+1;
    id.endloc   = endloc(durLoc);
    id.duration = duration(durLoc);
end

end
