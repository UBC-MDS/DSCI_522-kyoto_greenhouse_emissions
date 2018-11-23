

# Team members: Miliban Keyim, Chao Wang, Kera Yucel
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

print(boxplot_result)
# save the boxplot as a png in image folder
ggsave("results/fig/GH_boxplot.png", plot =boxplot_result, width = 8, height = 4)
  
    
}

# call main function
main()
