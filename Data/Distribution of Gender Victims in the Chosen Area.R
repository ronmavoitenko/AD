#install.packages("gapminder")

library(gapminder)
library(ggplot2)
library(openintro)
library(tidyverse)
library(dplyr)

crimes <- read.csv("D:/R labs/Crime_Data_from_2020_to_Present.csv")

americas_data <- crimes %>%
  filter(AREA.NAME %in% c("Hollywood"))

americas_data_filtered <- americas_data %>%
  filter(Vict.Sex %in% c("M", "F"))

ggplot(americas_data_filtered, aes(x = Vict.Sex, fill = Vict.Sex)) +
  geom_bar(width = 0.5, color = "black") +
  labs(x = "Sex", y = "Count") +
  ggtitle("Distribution of Gender Victims in the Chosen Area") + 
  scale_fill_manual(values = c("M" = "blue", "F" = "pink")) +
  theme_minimal() +
  theme(axis.text.y = element_text(size = 8), axis.text.x = element_text(size = 10)) +
  scale_y_continuous(labels = scales::comma)

