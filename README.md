# Occurrences of Marine Heatwaves

#marine-heatwaves #intensity-duration-frequency-diagram

## 1. Introduction

Marine heatwaves (MHWs) are events characterized by prolonged anomalously warm ocean surface or subsurface temperatures (Hobday et al 2016; 2018). By definition, MHWs may be quantified using measures of their intensity and duration; that is, given an intensity and a duration, one can find events that satisfies those criteria and count the total number of events in a time series. The following schematic diagram (adapted from Hobday et al 2016) illustrates the identification of one MHW event.

<img src="https://github.com/Tongtong-Xu-PSL/global-MHW/blob/main/schematic_mhw.png " width="40%" />

A recent paper has extensively analyzed the occurrences of MHWs at multiple regions of the world and the changes of occurrences linked to climate change (Xu et al 2022). This repository serves as a code source associated with Xu et al 2022, mainly to provide codes that can be used to quantify occurrences of MHWs. Codes are written in MATLAB.

## 2. Computing number of events given a intensity and a duration

Given a sea surface temperature time series, one may be interested in how many events of a specific intensity (often 90th percentile, 95th percentile, $1\sigma$) last at least a certain duration (often 5 days, 1 months, 5 months).

## 3. Deriving Intensity-Duration-Frequency (IDF) diagram


### References

Hobday AJ, Alexander LV, Perkins SE, Smale DA, Straub SC, Oliver ECJ, et al. A hierarchical approach to defining marine heatwaves. Progress in Oceanography 2016, 141: 227-238.

Hobday AJ, Oliver ECJ, Sen Gupta A, Benthuysen JA, Burrows MT, Donat MG, et al. Categorizing and Naming MARINE HEATWAVES. Oceanography 2018, 31(2): 162-173.

Xu T, Newman M, Capotondi A, Stevenson S, Di Lorenzo E, Alexander M.A. An increase in marine heatwaves without significant changes in surface ocean temperature variability. Nature Communications 2022. In press.