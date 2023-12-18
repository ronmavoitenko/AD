library(openintro)
library(ggplot2)

crimes <- read.csv("D:/R labs/Crime_Data_from_2020_to_Present.csv")

colnames(crimes)

boxplot(crimes$Vict.Age, horizontal = TRUE, main = "Boxplot of Victim Age", xlab = "Victim Age")

crimes_no_out <- crimes[crimes$Vict.Age != 0, ]
boxplot(crimes_no_out$Vict.Age, horizontal = TRUE, main = "Boxplot of Victim Age (Excluding Outliers)", xlab = "Victim Age")

