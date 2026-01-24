print("NAME : SHIMAL AYMAN.S")
print("ROLL.NO : 23BAD112")

library(ggplot2)
library(dplyr)
traffic_data <- read.csv("4.traffic_accidents.csv")
str(traffic_data)
summary(traffic_data)
traffic_data <- traffic_data %>%
  mutate(
    Severity = factor(Severity, levels = c("Minor", "Major", "Fatal")),
    Accident_Type = as.factor(Accident_Type)
  )
ggplot(traffic_data, aes(
  x = Vehicles_Involved,
  y = Accident_ID,
  color = Severity,
  size = Casualties,
  shape = Accident_Type
)) +
  geom_point(alpha = 0.8) +
  scale_color_manual(
    values = c("Minor" = "yellow", "Major" = "orange", "Fatal" = "red")
  ) +
  scale_size_continuous(
    range = c(3, 10)
  ) +
  labs(
    title = "Visual Encoding of Traffic Accident Data",
    x = "Number of Vehicles Involved",
    y = "Accident ID",
    color = "Severity",
    size = "Casualties",
    shape = "Accident Type"
  ) +
  theme_minimal()
