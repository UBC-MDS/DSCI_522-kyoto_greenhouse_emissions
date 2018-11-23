#! /usr/bin/env Rscript
# 4_plot_results.R
# Team members: Miliban Keyim, Chao Wang, Kera Yucel

# This plot reads the output of the third script, generate a boxplot and save it to results/fig folder. 
# Usage: Rscript 4_plot_results.R


# import libraries/packages
library(forcats)
library(scales)

# define main function
main <- function(){

    
  # read script 3_analyze_data.R
  boxplot_data <- read.csv('data/clean_data_GH.csv')
  boxplot_data <- boxplot_data %>% 
    mutate(Country = factor(Country))

  # Plot a boxplot to demonstrate the distributions of the 10 countries green-house emmission.
  boxplot_result <- 
    ggplot(boxplot_data, aes(x=fct_reorder(Country, Value), y=Value, color=fct_reorder(Country, Value)))+
    geom_boxplot()+
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
  ggsave("results/fig/GH_boxplot.png", plot =boxplot_result, width = 8, height = 4)
  
    



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
    labs(x = "Country", 
         y = "Emission Value(kt)") +
    scale_y_log10("Emissions Value(kt)",
                  breaks = trans_breaks("log10", function(x) 10^x),
                  labels = trans_format("log10", math_format(10^.x)))


  print(GH_est_plot)
  # save violin plots
  ggsave("results/fig/GH_est_plot.png", plot =GH_est_plot, width = 8, height = 4)
}

# call main function
main()
