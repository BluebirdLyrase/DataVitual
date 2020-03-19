
library(ggplot2)
library(plotly)
library(scales)
setwd("C:/Users/pisit/Documents/GitHub/DataVitual/Lab-ch08_part1-20200305")

crime <- read.csv("data/education.csv", sep=",", header=TRUE)
crime <- crime[c(1:5),c(1:7)]
crime.m <- melt(crime, id.var = "state")
crime.m <- ddply(crime.m, .(variable), transform, rescale = rescale(value))

radar <- ggplot(crime.m, aes(x = variable, y=state,group=state, colour=state)) +
  geom_polygon(aes(group = type, color = type), fill="#3232ff", size = 1, alpha=0.2) +
  geom_line(aes(group = type, color = type), size = 1)
