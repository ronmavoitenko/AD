library(openintro)
library(ggplot2)

crimes <- read.csv("D:/R labs/Crime_Data_from_2020_to_Present.csv")

crimes %>%
  filter(Vict.Age != 0 & Vict.Age > 25 & Vict.Age <70 ) %>%
  ggplot(aes(x = Vict.Age, fill = AREA.NAME)) +
  geom_histogram(binwidth = 5, color = "black", linetype = "solid", size = 0.5) +
  labs(x = "Victim Age", y = "Frequency") +
  ggtitle("Distribution of Crimes by Victim age") +
  scale_fill_manual(values = scales::hue_pal()(n_distinct(crimes$AREA.NAME))) +  # Использование hue_pal для генерации палитры цветов
  theme_minimal()