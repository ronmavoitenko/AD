library(dplyr)
library(ggplot2)

crimes <- read.csv("D:/R labs/Crime_Data_from_2020_to_Present.csv")

# Фильтрация данных только для AREA.NAME == "Hollywood"
hollywood_crimes <- crimes %>%
  filter(AREA.NAME == "Hollywood") %>%
  count(Crm.Cd.Desc) %>%
  filter(n > 350)

# Создание графика для площади под названием Hollywood
ggplot(hollywood_crimes, aes(x = Crm.Cd.Desc, y = n)) +
  geom_bar(stat = "identity", fill = "blue", color = "black") +
  labs(x = "Crime Description", y = "Frequency") +
  ggtitle("Distribution of Crime in Hollywood Area") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1, size = 6))