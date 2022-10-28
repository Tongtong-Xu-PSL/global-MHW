# Occurrences of Marine Heatwaves

#marine-heatwaves #intensity-duration-frequency-diagram

## 1. Introduction

Marine heatwaves (MHWs) are events characterized by prolonged anomalously warm ocean surface or subsurface temperatures (Hobday et al 2016; 2018). By definition, MHWs may be quantified using measures of their intensity and duration; that is, given an intensity and a duration, one can find events that satisfies those criteria and count the total number of events in a time series. The following schematic diagram (adapted from Hobday et al 2016) illustrates the identification of one MHW event.

<img src="https://github.com/Tongtong-Xu-PSL/global-MHW/blob/main/schematic_mhw.png " width="40%" />

A recent paper has extensively analyzed the occurrences of MHWs at multiple regions of the world and the changes of occurrences linked to climate change (Xu et al 2022). This repository serves as a code source associated with Xu et al 2022, mainly to provide codes that can be used to quantify occurrences of MHWs. Codes are written in MATLAB.

## 2. Computing number of events given an intensity and a duration

Given a sea surface temperature time series, one may be interested in how many events of a specific intensity (often 90th percentile, 95th percentile, $1\sigma$, $2\sigma$) last at least a certain duration (often 5 days, 1 month, 5 months). 

The following [MATLAB code](https://github.com/Tongtong-Xu-PSL/global-MHW/blob/main/tx_findEvents_basedOn_valueDuration.m) can be used to count the number of events, given an intensity and a duration. Our formal definition used in the code is to calculate the number of events that exceed $(\ge)$ a given intensity for a period longer than $(\ge)$ a given duration.

```Matlab
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
```

## 3. Deriving Intensity-Duration-Frequency (IDF) diagram



### References

Hobday AJ, Alexander LV, Perkins SE, Smale DA, Straub SC, Oliver ECJ, et al. A hierarchical approach to defining marine heatwaves. Progress in Oceanography 2016, 141: 227-238.

Hobday AJ, Oliver ECJ, Sen Gupta A, Benthuysen JA, Burrows MT, Donat MG, et al. Categorizing and Naming MARINE HEATWAVES. Oceanography 2018, 31(2): 162-173.

Xu T, Newman M, Capotondi A, Stevenson S, Di Lorenzo E, Alexander M.A. An increase in marine heatwaves without significant changes in surface ocean temperature variability. Nature Communications 2022. In press.