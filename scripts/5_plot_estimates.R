#! /usr/bin/env Rscript
# 5_plot_estimates.R
# Team members: Miliban Keyim, Chao Wang, Kera Yucel

# This plot reads the output of the third script, generate a boxplot and save it to results/fig folder. 
# Usage: Rscript 5_plot_estimates.R


# import libraries/packages
library(forcats)
library(scales)
library(ggplot2)
library(tidyverse)
library(dplyr)

# read in command line argument
args <- commandArgs(trailingOnly = TRUE)
input <- args[1]
output <- args[2]


# define main function
main <- function(){
  
  
  # read script 3_analyze_data.R
  boxplot_data <- read.csv(input)
  boxplot_data <- boxplot_data %>% 
    mutate(Country = factor(Country))
  
  
  # get the ci and means by countries
  GH_est <- boxplot_data %>% 
    group_by(Country) %>% 
    summarize(mean_GH = mean(Value),
              n       = length(Value),
              se      = sd(Value)/sqrt(n),
              Value   = sum(Value))
  
  GH_est_plot<- 
    ggplot(boxplot_data,aes(fct_reorder(Country, Value), Value))+
    geom_violin()+
    theme_bw() +
    labs(x = "Country", 
         y = "Emission Value(kt)") +
    scale_y_log10("Emissions Value(kt)",
                  breaks = trans_breaks("log10", function(x) 10^x),
                  labels = trans_format("log10", math_format(10^.x)))
  
  GH_est_plot <- GH_est_plot+
    geom_point(data =GH_est, mapping = aes(x=Country, y=mean_GH),colour = "red")+
    geom_errorbar(data =GH_est,mapping = aes(ymin = mean_GH+ qnorm(0.025)*se, 
                                             ymax = mean_GH - qnorm(0.025)*se),
                  colour = "red",
                  width = 0.2)+
    theme_bw() +
    ggtitle("Greenhouse Gas (GHGs) Emissions Estimates and Confidence Intervals by Countries")+
    labs(x = "Country", 
         y = "Emission Value(kt)") +
    scale_y_log10("Emissions Value(kt)",
                  breaks = trans_breaks("log10", function(x) 10^x),
                  labels = trans_format("log10", math_format(10^.x)))
  
  

  # save violin plots
  ggsave(output, plot =GH_est_plot, width = 8, height = 4)
}

# call main function
main()
