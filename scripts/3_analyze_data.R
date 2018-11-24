#! /usr/bin/env Rscript
# 3_analyze_data.R
# Team members: Miliban Keyim, Chao Wang, Kera Yucel
#
# Third script that reads the data from the first script, 
# performs an ANOVA test and writes these numerical data to file in CSV format. 
#
# Usage: Rscript scripts/3_analyze_data.R data/clean_data_GH.csv results/summarized_ANOVA.csv results/glht_GH_letters.csv 


# import libraries/packages
library(readr)
library(broom)
library(multcomp)
library(multcompView)
library(emmeans)



# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input <- args[1]
output_aov <- args[2]
output_labels <- args[3]

# define main function
main <- function(){
  clean_data_GH <- read_csv(input)
  str(clean_data_GH)
  
  # Set Country as factor for Pairwise comparison
  clean_data_GH$Country <- as.factor(clean_data_GH$Country)

  # ANOVA to detect if there is significant difference among the countries
  
  aov_GH <-aov(Value ~ Country, data = clean_data_GH)
  summary(aov_GH)
  
  # there is significant difference in greenhouse emission among the countries
  
  tidy_aov <- broom::tidy(aov_GH)
  tidy_aov
  #write ANOVA summary to .csv in results
  write_csv(tidy_aov, output_aov)
  
  ## RUN TUKEY ADJUSTED PAIRWISE COMPARISONS (ONLY IF FACTOR IS SIGNIFICANT THOUGH)
  glht_GH <- glht(aov_GH, linfct = mcp(Country = "Tukey"))
  ### extract information
  glht_GH_letters <- broom::tidy(cld(glht_GH))  ## GET DIFFERENCES INDICATED BY GROUP NUMBERS
  glht_GH_letters
  #write significant differences among countries in a .csv
  write_csv(glht_GH_letters, output_labels)
  
  

}

# call main function
main()