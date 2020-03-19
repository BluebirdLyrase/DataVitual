#install.packages("maps")
library("ggplot2")
library("maps")
library("plotly")

# Set working directory
setwd("/Users/por/Documents/PSU/Course/C_DV/Lab/ch09/")

# Load data
fertility <- read.csv("data/adol-fertility.csv", sep = ",", header = TRUE)

# Generate world map data
world <- map_data("world")

# Plot
p <- ggplot() +
  # Plot map from world map data
  geom_polygon(data=world, aes(x=long, y=lat, group=group), 
               fill="#ffffff", color="#636363", size=0.15) +
  # Plot bubble from fertility (read from csv)
  geom_point(data=fertility, aes(x=longitude, y=latitude, 
                                 text=paste(country, "\n", "Rate: ", fert_rate)), 
             size=sqrt(fertility$fert_rate)/5, color="#de2d26", alpha=0.5) +
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
p

# Display text on hover
ggplotly(p, tooltip="text")