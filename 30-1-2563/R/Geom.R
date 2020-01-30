library("tidyverse")

setwd("")

rm(list=ls())

pop <- read.csv("data/world-population.csv",sep=",",header=TRUE)

ggplot(pop,aes(x=pop$Year, y=pop$Population)) + 
geom_line(color='steelblue',size=1) +
xlab("Year")+ylab("Population (Billion people)") +
  scale_y_continuous(breaks = c(seq(0,7000000000,1000000000)), 
                     labels = c(seq(0,7,1)),
                     limits = c(0,7000000000))

#Real begin with 0 end at   7000000000 incrase by 1000000000
#in Pic begin with 0 end at   7 incrase by 1
