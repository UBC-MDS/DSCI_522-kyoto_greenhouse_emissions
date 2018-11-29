#! /usr/bin/env Rscript
# 1_load_data.R
# Team members: Miliban Keyim, Chao Wang, Kera Yucel
#
# This very first script loads raw data from the data folder and
# output clean data int to a csv file.
#
# Usage: Rscript scripts/1_load_data.R data/raw/2018-11-14_DSCI_522_project_UN-data_GH.csv data/data_GH.csv


# import libraries/packages
library(readr)
library(tidyverse)

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input <- args[1]
output <- args[2]

# define main function
main <- function(){


  # Data analysis on greenhouse gas emission from 10 countries among 26 years
  data_GH <- read_csv(input,
                          col_types = cols(Year = col_character()))
  str(data_GH)

  # Rename column name `Country or Area`

  data_GH <- data_GH %>%
    rename('Country' = 'Country or Area')
  data_GH$Country <- as.factor(data_GH$Country)
  str(data_GH)
  write_csv(data_GH, output)

}

# call main function
main()
