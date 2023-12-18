#install.packages("gridExtra")

crimes <- read.csv("D:/R labs/Crime_Data_from_2020_to_Present.csv")

library(dplyr)
library(tidyr)
library(ggplot2)
library(gridExtra)


head(crimes)

levels(crimes$AREA)
levels(crimes$Vict.Sex)

contingency_table <- crimes %>%
  count(AREA, Vict.Age) %>%
  pivot_wider(names_from = Vict.Age, values_from = n)

contingency_table

class(crimes$AREA.NAME)

crimes$AREA.NAME <- as.factor(crimes$AREA.NAME)

crimes_filtered <- crimes %>%
  filter(Vict.Sex != "" & Vict.Sex != "X" & Vict.Sex != "H" & Vict.Sex != "-" & Vict.Age > 25)

crimes_filtered$AREA.NAME <- droplevels(crimes_filtered$AREA.NAME)

levels(comics_filtered$align)

plot1 <- ggplot(crimes_filtered, aes(x = AREA.NAME, fill = Vict.Sex)) +
  geom_bar(position = "dodge") +
  labs(x = "Area", y = "Quantity", fill = "Sex") +
  ggtitle("Area and Gender Comparison Chart")

plot1

