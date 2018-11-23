# run_all.#!/bbin/#!/bin/sh
# Team members: Miliban Keyim, Chao Wang, Kera Yucel

# This is the sh file for our Green House Emission project

# example usage:
# bash run_all.#!/bin/sh

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
Rscript -e"rmarkdown::render('results/report.Rmd')"
