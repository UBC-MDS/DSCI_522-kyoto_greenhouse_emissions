

# Team members: Miliban Keyim, Chao Wang, Kera Yucel
# Usage: Rscript 4_plot_results.R

# define main function
main <- function(){
  
# read script 3_analyze_data.R
boxplot_data <- read.csv('results/TBD!!!!!')

# Plot a boxplot to demonstrate the distributions of the 10 countries green-house emmission.
boxplot_result <- 
  ggplot(boxplot_data, aes(x= country, y = values))+
  boxplot()+
  labs(title="Green House Emission",
       x ="Country", y = "Emission")+
  theme_bw()

# save the boxplot as a png in image folder
ggsave("image/GH_boxplot.png", plot =boxplot_result)
  
    
}

# call main function
main()