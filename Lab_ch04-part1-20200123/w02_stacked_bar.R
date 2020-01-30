# Load library
library("ggplot2")
# library("tidyverse")
# library("RColorBrewer")

# Set working directory
setwd("C:/Users/STD-PC/Desktop/Lab_ch04-part1-20200123")

# Clear data
rm(list=ls())

# Load data
hdp_data <- read.csv("./data/hotdog-places.csv",sep=",",header = TRUE)

# Transform to factor
hdp_data$year <- as.factor(hdp_data$year)

# Create geometric object
hdp_obj <- ggplot(data= hdp_data, aes(x=year, y= values)) + xlab("Year") + ylab("Hot dogs and buns (HDB) eaten") + ggtitle("Hot Dog Eating Contest Results, 1980-2010") + theme(plot.title = element_text(hjust = 0.5))

# Create stacked bar chart
hdp_bar <- hdp_obj + geom_bar(stat="identity", aes(fill= rank), position = position_stack(reverse = TRUE)) + geom_text(aes(label=values), position = position_stack(vjust=0.5), color = "white", size=3)

# Show bar chart
hdp_bar
