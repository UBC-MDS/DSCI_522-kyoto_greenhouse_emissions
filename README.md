# DSCI_522_greenhouse_emissions_comparisons

Contributers:
- [Miliban Keyim](https://github.com/mkeyim)
- [Chao Wang](https://github.com/chaomander2018)
- [Kera Yucel](https://github.com/K3ra-y)  

## Overview of contents

This report contains an inferential analysis regarding the Greenhouse Gas Emissions from 10 countriesbetween 1990 and 2015. The analysis aims to find if these is a differences of greenhouse gas emissions (kt)across these countries in the past 25 years. An ANOVA was performed to determine whether there is anysignificant difference in GHG Emissions when observed, multiple comparisons on counties were performed.The data is obtained from the Greenhouse Gas Inventory Data of the United Nations Framework Conventionon Climate Change.

The final report consist
- Hypothesis
- Statistical Summary of ANOVA
- Interpretation of Findings
- Critics, limitations, and assumptions on analysis
- References


## Data Collection & Cleaning

Data is found from the United Nations Statistics Division databases: [Greenhouse Gas (GHGs) Emissions, including Indirect CO2, without LULUCF, in kilotonne CO2 equivalent](http://data.un.org/Data.aspx?d=GHG&f=seriesID%3aGH2)

## Repository Structure

[doc](https://github.com/UBC-MDS/DSCI_522_greenhouse_emissions_comparisons/tree/master/doc)

  - [report.Rmd](https://github.com/UBC-MDS/DSCI_522_greenhouse_emissions_comparisons/blob/master/doc/report.Rmd)

[data](https://github.com/UBC-MDS/DSCI_522_greenhouse_emissions_comparisons/tree/master/data)
  - [raw](https://github.com/UBC-MDS/DSCI_522_greenhouse_emissions_comparisons/tree/master/data/raw)

[scripts](https://github.com/UBC-MDS/DSCI_522_greenhouse_emissions_comparisons/tree/master/scripts)
  - [load_data.R](https://github.com/UBC-MDS/DSCI_522_greenhouse_emissions_comparisons/blob/master/scripts/1_load_data.R)
  
  - [data_exploration_and_clean_data.R](https://github.com/UBC-MDS/DSCI_522_greenhouse_emissions_comparisons/blob/master/scripts/2_data_exploration.R)

  - [analyze_data.R](https://github.com/UBC-MDS/DSCI_522_greenhouse_emissions_comparisons/blob/master/scripts/3_analyze_data.R)
  
  - [plot_results.R](https://github.com/UBC-MDS/DSCI_522_greenhouse_emissions_comparisons/blob/master/scripts/4_plot_results.R)
  
  - [plot_estimate.R](https://github.com/UBC-MDS/DSCI_522_greenhouse_emissions_comparisons/blob/master/scripts/5_plot_estimates.R)

[results](https://github.com/UBC-MDS/DSCI_522_greenhouse_emissions_comparisons/tree/master/results)

  - [report.pdf](https://github.com/UBC-MDS/DSCI_522_greenhouse_emissions_comparisons/blob/master/results/report.pdf)
  

## Procedure

This project contains five major steps including data cleaning, exploratory data analysis, ANOVA test, data visualization and final report.
![analysis process chart](data/procedure.png)

## Usage
The usage of the scripts are:
```
# Load data
Rscript scripts/1_load_data.R data/raw/2018-11-14_DSCI_522_project_UN-data_GH.csv data/clean_data_GH.csv

# EDA
Rscript scripts/2_data_exploration.R data/clean_data_GH.csv results/fig/GHG_exploreView.png

# Clean data
Rscript scripts/3_analyze_data.R data/clean_data_GH.csv results/summarized_data.csv

# Create the boxplot
Rscript scripts/4_plot_results.R data/clean_data_GH.csv results/fig/GH_boxplot.png

# Create the estimate the ci
Rscript scripts/5_plot_estimates.R data/clean_data_GH.csv results/fig/GH_est_plot.png


# write the report
Rscript -e "rmarkdown::render('results/report.Rmd')"
```

Or, you can use our run_all.sh in the root repository:
```
bash run_all.sh
```
The report will be rendered into a PDF document.

## Dependencies

R version 3.5.1
library(readr)
library(ggplot2)
library(tidyverse)
library(dplyr)
library(forcats)
library(broom)
library(scales)


## Release version
 - Proposal    [V1.0](https://github.com/UBC-MDS/DSCI_522_greenhouse_emissions_comparisons/releases/tag/v1.0)
 - Milestone 1 [V2.0](https://github.com/UBC-MDS/DSCI_522_greenhouse_emissions_comparisons/releases/tag/v2.0)
