#install.packages("openintro")
#install.packages("ggplot2")
library(openintro)
library(ggplot2)

crimes <- read.csv("D:/R labs/Crime_Data_from_2020_to_Present.csv")

colnames(crimes)

plot1 <- ggplot(crimes, aes(x = Vict.Age)) +
  geom_histogram(binwidth = 3, fill = "blue", color = "black") +
  labs(title = "Histogram of Victim Age (Binwidth = 3)",
       x = "Victim Age",
       y = "Frequency")

plot2 <- ggplot(crimes, aes(x = Vict.Age)) +
  geom_histogram(binwidth = 30, fill = "green", color = "black") +
  labs(title = "Histogram of Victim Age (Binwidth = 30)",
       x = "Victim Age",
       y = "Frequency")

plot3 <- ggplot(crimes, aes(x = Vict.Age)) +
  geom_histogram(binwidth = 60, fill = "red", color = "black") +
  labs(title = "Histogram of Victim Age (Binwidth = 60)",
       x = "Victim Age",
       y = "Frequency")

# Arrange the plots side by side
library(gridExtra)
grid.arrange(plot1, plot2, plot3, ncol = 3)

