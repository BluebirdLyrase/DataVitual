library(ggplot2)
library(plotly)
library(reshape2)
library(plyr)
library(scales)
library(fmsb)

setwd("C:/Users/pisit/Documen
summary(edu)
median(edu$writing)ts/GitHub/DataVitual/Lab-ch08_part1-20200305")

edu <- read.csv("data/educationNew.csv", sep=",", header=TRUE)

#Compute

#Define Color
math_colors <-c()
for(i in 1:length(edu$state)){
  
  if(edu$writing[i] > median(edu$writing)){
    col <- "#27AE60"
  } else {
    col <- "#E74C3C"
  }
  math_colors <-c(math_colors,col)
}

#multidimensional scaling
ed.dis <-dist(edu[,3:5], method="euclidean")
ed.mds <- cmdscale(ed.dis,k=2)
x <- ed.mds[,1]
y <- ed.mds[,2]
plot(x,y)
plot(x,y,type = "n") #n = Clear chart
text(x,y, labels=edu$state)
plot(x,y,type = "n")
#text(x,y, labels=edu$state, col=math_colors, cex=0.6)
text(x,y, labels=edu$abbreviation, col=math_colors, cex=0.6)

