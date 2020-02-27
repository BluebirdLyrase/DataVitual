#install.packages("plotly")

library("ggplot2")
library("plotly")

# Set working directory
setwd("C:/Users/pisit/Desktop/RdisCo")

# Load data
tv <- read.delim("data/tvsize.txt", sep="\t", header=TRUE)
p <-ggplot(tv, aes(x=factor(year), y=size,fill=factor(year))) +
  geom_boxplot()+
  theme_classic()
# Plottv
#p <- plot_ly(tv, y=factor(size), x =factor(year),color = factor(year), type = "box")

ggplotly(p, tooltip="text")

