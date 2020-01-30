# Set working directory
setwd("C:/Users/STD-PC/Desktop/Lab_ch04-part1-20200123")

# Clear data
rm(list=ls())

# Load data
hd_data <- read.csv("./data/flowingdata_subscribers.csv",sep=",",header = TRUE)
geom_point

#Create scatter plot
hd_obj <- ggplot(data=hd_data, aes(x=Date, y=Subscribers)) + geom_point(size=2, shape=23)+ theme(axis.text.x = element_text(angle = 270, hjust = 1))

#show scatter plot
hd_obj

