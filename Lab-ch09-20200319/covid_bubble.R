#install.packages("maps")
library("ggplot2")
library("maps")
library("plotly")

# Set working directory
setwd("C:/Users/pisit/Documents/GitHub/DataVitual/Lab-ch09-20200319")

# Load data
covid_data <- read.csv("data/covid19_preprocessed.csv", sep = ",", header = TRUE)

# Generate world map data
world_covid <- map_data("world")
world_covid$Recovered = covid_data$Recovered[match(world_covid$region, covid_data$Country)]
# Plot
p <- ggplot() +
  # Plot map from world map data
  geom_polygon(data=world_covid, aes(aes(fill = TotalCases), group=group), 
               fill="#ffffff", color="#636363", size=0.15) +
  # Plot bubble from fertility (read from csv)
  geom_point(data=covid_data, aes(x=long, y=lat, 
                                 text=paste(Country, "\n", "Rate: ", Recovered)), 
             size=sqrt(covid_data$Recovered)/5, color="#de2d26", alpha=0.5) +
  # Show title
  labs(title="Adolescent fertility rate worldwide") +
  # Align title as center
  theme(plot.title = element_text(hjust = 0.5)) +
  # Remove lines and text of x,y axises
  theme(axis.title=element_blank(),
        axis.text=element_blank(),
        panel.grid.major=element_blank(), 
        panel.grid.minor=element_blank(),
        axis.ticks=element_blank())

# Show plot


# Display text on hover
ggplotly(p, tooltip="text")
