# TVCSnowCLM
Data & code needed to construct figures for *Impact of measured and simulated tundra snowpack properties on heat transfer*, Dutch et al. (2022). [DOI Pending]

# Abstract 
Snowpack microstructure controls the transfer of heat to, as well as the temperature of, the underlying soils. In situ measurements of snow and soil properties from four field campaigns during two winters (March and November 2018, January and March 2019) were compared to an ensemble of CLM5.0 (Community Land Model) simulations, at Trail Valley Creek, Northwest Territories, Canada. Snow micropenetrometer profiles allowed for snowpack density and thermal conductivity to be derived at higher vertical resolution (1.25mm) and a larger sample size (n = 1050) compared to traditional snowpit observations (3 cm vertical resolution; n = 115). Comparing measurements with simulations shows CLM overestimated snow thermal conductivity by a factor of 3, leading to a cold bias in wintertime soil temperatures (RMSE = 5.8 ℃). Two different approaches were taken to reduce this bias: alternative parameterisations of snow thermal conductivity and the application of a correction factor. All the evaluated parameterisations of snow thermal conductivity improved simulations of wintertime soil temperatures, with that of Sturm et al. (1997) having the greatest impact (RMSE = 2.5 ℃). The required correction factor is strongly related to snow depth (R2 = 0.77;RMSE = 0.066) and thus differs between the two snow seasons, limiting the applicability of such an approach. Improving simulated snow properties and the corresponding heat flux is important, as wintertime soil temperatures are an important control on subnivean soil respiration and hence impact Arctic winter carbon fluxes and budgets.

# Read Me
This gitrepo should contain 3 subfolders:
- CLMOutputData
- TVCMetData
- TVCSnowpits

And 3 Files:
- ReadMe.md (This File)
- Paper1Figures.m
- shadedplot.m*

In order to create figures; 
1. Add snowpit data to TVCSnowpits folder from zip file at https://figshare.com/articles/dataset/TVC_Array_09_2021_zip/16685041
2. Run Paper1Figures.m

v1.2 - V. R. Dutch, Jan 2022

*Dave Van Tol (2020). Shaded area plot (https://www.mathworks.com/matlabcentral/fileexchange/18738-shaded-area-plot), MATLAB Central File Exchange. Retrieved October 2020.
This code and dataset: [![DOI](https://zenodo.org/badge/437042156.svg)](https://zenodo.org/badge/latestdoi/437042156)

