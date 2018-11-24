# DSCI_522_greenhouse_emissions_comparisons

Contributers:
- [Miliban Keyim](https://github.com/mkeyim)
- [Chao Wang](https://github.com/chaomander2018)
- [Kera Yucel](https://github.com/K3ra-y)  

## Overview of contents

This repository contains an inferential analysis regarding the Greenhouse Gas Emissions from 10 countries from 1990 to 2015. This analysis aims to find the significant difference of Greenhouse Gas Emissions across the countries between 1990 and 2015.


## Data Collection & Cleaning

Data is found from the United Nations Statistics Division databases: [Greenhouse Gas (GHGs) Emissions, including Indirect CO2, without LULUCF, in kilotonne CO2 equivalent](http://data.un.org/Data.aspx?d=GHG&f=seriesID%3aGH2)

[doc](https://github.com/UBC-MDS/DSCI_522_greenhouse_emissions_comparisons/tree/master/doc)

  - [report.Rmd](https://github.com/UBC-MDS/DSCI_522_greenhouse_emissions_comparisons/blob/master/doc/report.Rmd)

[data](https://github.com/UBC-MDS/DSCI_522_greenhouse_emissions_comparisons/tree/master/data)
  - [raw](https://github.com/UBC-MDS/DSCI_522_greenhouse_emissions_comparisons/tree/master/data/raw)

[scripts](https://github.com/UBC-MDS/DSCI_522_greenhouse_emissions_comparisons/tree/master/scripts)
  - [load_data.R](https://github.com/UBC-MDS/DSCI_522_greenhouse_emissions_comparisons/blob/master/scripts/1_load_data.R)
  
  - [data_exploration_and_clean_data.R](https://github.com/UBC-MDS/DSCI_522_greenhouse_emissions_comparisons/blob/master/scripts/2_data_exploration.R)

  - [analyze_data.R](https://github.com/UBC-MDS/DSCI_522_greenhouse_emissions_comparisons/blob/master/scripts/3_analyze_data.R)
  
  - [plot_results.R](https://github.com/UBC-MDS/DSCI_522_greenhouse_emissions_comparisons/blob/master/scripts/4_plot_results.R)
  
  - [plot_estimate.Rmd](https://github.com/UBC-MDS/DSCI_522_greenhouse_emissions_comparisons/blob/master/scripts/5_plot_estimates.R)

[results](https://github.com/UBC-MDS/DSCI_522_greenhouse_emissions_comparisons/tree/master/results)
  

## Proposal

1. Choose a public data set from the web that you are interested in to carry out a small data analysis. You may also use any data set we have previously worked with in MDS. Prove to us that you can load the data set into R or Python (this could be demonstrating by writing a script that downloads the data and saves a snippet of it, for example).

[R script](https://github.com/UBC-MDS/DSCI_522_greenhouse_emissions_comparisons/tree/master/scripts)


2. With that data set, identify a question you would like to ask from it that could be answered by some simple analysis and visualization (more on this below). State what kind of question it is (it should be one of the 6 types discussed in lecture 1).

- Question: Is there a significant difference in Greenhouse Gas Emission among the countries between 1990 and 2015? The type of the question is Inferential.

3. Make a plan of how you will analyze the data (report an estimate and confidence intervals? hypothesis test? classification with a decision tree?). Choose something you know how to do (report an estimate and confidence intervals, a two-group hypothesis), or will learn how to do in the first week of block 3 (ANOVA, classification with a decision tree).

- Data exploration and cleanup

  * We will be performing a set of [data exploration](https://besjournals.onlinelibrary.wiley.com/doi/full/10.1111/j.2041-210X.2009.00001.x) to identify initial problems in the dataset

- Calculate means and variances for the 10 countries.

- Set up hypotheses and determine level of significance.  
 
 * H0: The expected mean greenhouse gas emmision of all countries are equal.
 * H1: The expected mean greenhouse gas emmision of all countries are not equal.

- *ANOVA* will be used to decide whether there is a significant difference in the Greenhouse Gas Emission across the 10 countries.

- If ANOVA indicates that mean of some countries are different (*p*<0.05), we will Use Tukey multiple pairwise-comparison to define which countries are significantly different than the other one.

- Prepare a table to show differences between counties and report F-value, p-value and means.

- Conclusion.

4. Suggest how you might summarize the data to show this as a table or a number, as well as how you might show this as a visualization.

- A table will demonstrate the significant differences for each country along with the test statistics (F-value, p-value and mean) obtained from the ANOVA test.

- We will also retrieve statistics to plot boxplots of the means of greenhouse gas emissions for each country. We can then further show the differences with line plots over the 26 years of emission data. 

## Dependencies

library(readr)

library(ggplot2)

library(tidyverse)

library(dplyr)
