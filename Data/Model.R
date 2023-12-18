library(tidyr)
library(dplyr)
library(caret)
library(leaflet)

crime_data <- read.csv("D:/R labs/Crime_Data_from_2020_to_Present.csv")

cleaned_data <- crime_data %>%
  drop_na(LAT, LON, `AREA`, `Vict.Age`)


X <- cleaned_data %>% 
  select(LAT, LON, `Vict.Age`)
y <- cleaned_data$`AREA`

set.seed(42)  
train_indices <- createDataPartition(y, p = 0.8, list = FALSE)
X_train <- X[train_indices, ]
X_test <- X[-train_indices, ]
y_train <- y[train_indices]
y_test <- y[-train_indices]

linear_model <- lm(y_train ~ ., data = cbind(X_train, y_train))

y_pred <- predict(linear_model, newdata = X_test)
mse <- mean((y_test - y_pred)^2)

cat("Коэффициент детерминации R^2:", summary(linear_model)$r.squared, "\n")

cat("Среднеквадратичная ошибка (MSE):", mse, "\n")

map <- leaflet() %>%
  setView(lng = mean(cleaned_data$LON), lat = mean(cleaned_data$LAT), zoom = 10) %>%
  addTiles()

for (i in 1:50) {
  map <- addCircleMarkers(map, lng = cleaned_data$LON[i], lat = cleaned_data$LAT[i],
                          color = "red", radius = 2, opacity = 1,
                          popup = as.character(y_pred[i]))
}

map