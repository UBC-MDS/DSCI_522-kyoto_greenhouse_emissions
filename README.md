# DSCI_522_Greenhouse_Emissions_Comparisions

Contributers:
- [Miliban Keyim](https://github.com/mkeyim)
- [Chao Wang](https://github.com/chaomander2018)
- [Kera Yucel](https://github.com/K3ra-y)  

## Overview of contents

This repository contains an inferential analysis regarding the Greenhouse Gas Emissions from 10 countries from 1990 to 2015. This analysis aims to find the significant difference of average Greenhouse Gas Emissions.


## Data Collection & Cleaning

Data is found from the United Nations Statistics Division databases: [Greenhouse Gas (GHGs) Emissions, including Indirect CO2, without LULUCF, in kilotonne CO2 equivalent](http://data.un.org/Data.aspx?d=GHG&f=seriesID%3aGH2)

[data](https://github.com/UBC-MDS/DSCI_522_greenhouse_emissions_comparisons/tree/master/data)
  - [raw](https://github.com/mkeyim/kyoto-greenhouse-emissions/tree/master/data/raw)
  - clean

[scripts](https://github.com/UBC-MDS/DSCI_522_greenhouse_emissions_comparisons/tree/master/scripts)

analysis


results
  - figures
  - nums

tables

visualization

## Proposal

1. Choose a public data set from the web that you are interested in to carry out a small data analysis. You may also use any data set we have previously worked with in MDS. Prove to us that you can load the data set into R or Python (this could be demonstrating by writing a script that downloads the data and saves a snippet of it, for example).

> [R script](https://github.com/UBC-MDS/DSCI_522-kyoto_greenhouse_emissions/blob/master/scripts/2018-11-14_DSCI_522_project_data_GH.R)

2. With that data set, identify a question you would like to ask from it that could be answered by some simple analysis and visualization (more on this below). State what kind of question it is (it should be one of the 6 types discussed in lecture 1).

> Question: Is there a significant difference in Greenhouse Gas Emission among the countries between 1990 and 2015? The type of the question is Inferential.

3. Make a plan of how you will analyze the data (report an estimate and confidence intervals? hypothesis test? classification with a decision tree?). Choose something you know how to do (report an estimate and confidence intervals, a two-group hypothesis), or will learn how to do in the first week of block 3 (ANOVA, classification with a decision tree).

> This analysis will use *ANOVA test* to decide whether there is a significant difference in the Green House Emission across the 10 countries.

> Calculate means and variances for the 10 countries.

> Set up hypotheses and determine level of significance.  
> H0: μ1 = μ2 = μ3 = μ4 = μ5 = μ6 = μ7= μ8= μ9 = μ10
> H1: Means are not all equal
> α=0.05

> Select the appropriate test statistic. F-value.

> Set up decision rule.

> Compute test statistics.

> Conclusion.

4. Suggest how you might summarize the data to show this as a table or a number, as well as how you might show this as a visualization.

> A table will demonstrate the significant differences for each country along with the test statistics (F values) obtained from the ANOVA test.

> We can also retrieve statistics to plot boxplots of the means of greenhouse gas emissions for each country. We can then further show the differences with line plots over the 26 years of emission data. 

## Dependencies
