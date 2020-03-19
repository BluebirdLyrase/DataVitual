library(ggplot2)
library(plotly)
library(scales)

setwd("C:/Users/pisit/Documents/GitHub/DataVitual/Lab-ch08_part1-20200305")

crime <- read.csv("data/education.csv", sep=",", header=TRUE)
crime <- crime[c(1:5),c(1:7)]

radarchart(crime)




