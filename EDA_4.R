# -----------------------------------------
# TRAFFIC ACCIDENT DATA VISUALIZATION
# -----------------------------------------

# Load required libraries
library(ggplot2)
library(dplyr)

# Read the CSV file
traffic_data <- read.csv("4.traffic_accidents.csv")

# Check structure (optional)
str(traffic_data)

# -----------------------------------------
# DATA PREPARATION
# Calculate Accident Frequency per Location & Accident Type
# -----------------------------------------

accident_summary <- traffic_data %>%
  group_by(Location, Accident_Type) %>%
  summarise(
    Accident_Frequency = n(),
    .groups = "drop"
  )

# Convert to factors
accident_summary$Location <- as.factor(accident_summary$Location)
accident_summary$Accident_Type <- as.factor(accident_summary$Accident_Type)

# -----------------------------------------
# VISUALIZATION
# Color Gradient → Accident Frequency
# Shape → Accident Type
# -----------------------------------------

ggplot(accident_summary,
       aes(x = Location,
           y = Accident_Frequency,
           color = Accident_Frequency,
           shape = Accident_Type)) +
  
  geom_point(size = 4, alpha = 0.85) +
  
  scale_color_gradient(
    low = "lightblue",
    high = "red",
    name = "Accident Frequency"
  ) +
  
  scale_shape_discrete(
    name = "Accident Type"
  ) +
  
  labs(
    title = "Traffic Accident Analysis by Location",
    subtitle = "Identification of High-Risk Zones Using Visual Encoding",
    x = "Accident Location",
    y = "Number of Accidents",
    caption = "Color gradient represents accident frequency | Shape represents accident type"
  ) +
  
  theme_minimal(base_size = 14) +
  
  theme(
    plot.title = element_text(face = "bold", hjust = 0.5),
    plot.subtitle = element_text(hjust = 0.5),
    axis.text.x = element_text(angle = 45, hjust = 1),
    legend.position = "right",
    legend.title = element_text(face = "bold")
  )
