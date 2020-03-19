library(ggplot2)
library(plotly)
library(reshape2)
library(plyr)
library(scales)

setwd("C:/Users/pisit/Documents/GitHub/DataVitual/Lab-ch08_part1-20200305")

crime <- read.csv("data/crimeRatesByState.csv", sep=",", header=TRUE)
crime[c(1:50),c(1:8)]

crime.m <- melt(crime, id.var = "State")

crime.m <- ddply(crime.m, .(variable), transform, rescale = rescale(value))

p <- ggplot(crime.m, aes(x=variable, y=State, text = paste('rate: ', value))) +
  geom_tile(aes(fill = rescale, colour = "white")) +
  scale_fill_gradient(low = "white",high = "red") +
  xlab("Crimes") + ylab("State") + labs(title = "Crime Rate by State") +
  scale_x_discrete(expand = c(0,0)) +
  scale_y_discrete(expand = c(0,0)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
  
ggplotly(p, tooltip=c("x","y","text"))
  
  
  
  
  

