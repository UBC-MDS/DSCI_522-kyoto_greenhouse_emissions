#! /usr/bin/env Rscript
# 3_analyze_data.R
# Team members: Miliban Keyim, Chao Wang, Kera Yucel
#
# Third script that reads the data from the first script, 
# performs an ANOVA test and writes these numerical data to file in CSV format. 
#
# Usage: Rscript 3_analyze_data.R


# import libraries/packages
library(readr)
library(broom)

# define main function
main <- function(){
  clean_data_GH <- read_csv("data/clean_data_GH.csv")
  str(clean_data_GH)

  # ANOVA to detect if there is significant difference among the countries

  aov_GH <-aov(Value ~ Country, data = clean_data_GH)
  summary(aov_GH)
  # there is significant difference in greenhouse emission among the countries
  
  tidy_aov <- broom::tidy(aov_GH)
  
  #write ANOVA summary to .csv in results
  write_csv(tidy_aov, "results/summarized_data.csv")



}

# call main function
main()