#! /usr/bin/env Rscript
# 4_plot_results.R
# Team members: Miliban Keyim, Chao Wang, Kera Yucel

# This plot reads the output of the third script, generate a boxplot and save it to results/fig folder. 
# Usage: Rscript scripts/4_plot_results.R data/clean_data_GH.csv results/glht_GH_letters.csv results/fig/GH_boxplot.png


# import libraries/packages
library(forcats)
library(scales)
library(ggplot2)
library(tidyverse)
library(dplyr)

# read in command line argument
args <- commandArgs(trailingOnly = TRUE)
input <- args[1]
input_letters <- args[2]
output_viz <- args[3]


# define main function
main <- function(){

    
  # read script 3_analyze_data.R
  clean_data_GH <- read_csv(input)
  clean_data_GH <- clean_data_GH %>% 
                      mutate(Country = factor(Country))

  
  
  gh_summarized = clean_data_GH %>% group_by(Country) %>% 
    summarize(max_value = max(Value)) #this determines where the letter will be.
  
  
  # Plot a boxplot to demonstrate the distributions of the 10 countries green-house emmission.
  glht_GH_letters <- read_csv(input_letters)
  glht_GH_letters 
  
  boxplot_result <- 
    ggplot(clean_data_GH, aes(x=fct_reorder(Country, Value), y=Value))+
    geom_boxplot()+
    geom_text(data = gh_summarized, aes(x = fct_reorder(Country, max_value), y = 15000 + max_value,
                                          label = glht_GH_letters$letters), vjust = 0) +
    scale_y_log10("Emissions Value(kt)",
                  breaks = trans_breaks("log10", function(x) 10^x),
                  labels = trans_format("log10", math_format(10^.x)))+
    xlab("Country")+
    ylab("Emissions Value(kt)")+
    ggtitle("Greenhouse Gas (GHGs) Emissions by Countries")+
    theme_bw()+
    theme(legend.position="none")+
    theme(plot.title = element_text(hjust = 0.5))
  
    # save the boxplot as a png in image folder
  ggsave(output_viz, plot =boxplot_result, width = 8, height = 4)
  
    
}

# call main function
main()
