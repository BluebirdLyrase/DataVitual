#install.packages("plotly")

library("ggplot2")
library("plotly")

# Set working directory
setwd("C:/Users/pisit/Desktop/RdisCo")

# Load data
crime <- read.csv("data/crimeRatesByState.csv", sep=",", header=TRUE)
pop <- round(crime$population/1000000,1)

# Plot
p <- ggplot(crime, aes(x=murder, y=Robbery,
                       text = paste('State: ', state, "\n", "Population: ", pop,"M"))) + 
  geom_point(aes(size=pop, col=factor(pop)), alpha=0.3) +
  xlab("Murder") + ylab("Robbery") + 
  theme(legend.position="none") + labs(title = "Crime Rates by State")
# factor is to change numberic to category
# Display text on hover
ggplotly(p, tooltip="text")

