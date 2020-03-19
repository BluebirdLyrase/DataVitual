library(ggplot2)
library(plotly)
library(reshape2)
library(plyr)
library(scales)
library(fmsb)

setwd("C:/Users/pisit/Documents/GitHub/DataVitual/Lab-ch08_part1-20200305")

crime <- read.csv("data/education.csv", sep=",", header=TRUE)
crime <- crime[c(1:5),c(1:4)]
crime.m <- melt(crime, id.var = "state")
crime.m <- ddply(crime.m, .(variable), transform, rescale = rescale(value))
radarchart(crime.m)






