# Cargar paquetes necesarios
library(class)
library(ggplot2)
# Generar datos de ejemplo
set.seed(123)
n <- 100 # Número de puntos de datos
k <- 5 # Número de vecinos cercanos
x <- seq(1, 10, length.out = n)
y <- as.factor(ifelse(2 * x + rnorm(n, mean = 0, sd = 2) > 0, "A", "B")) # Variable categórica
# Cargar paquetes necesarios
library(class)
library(ggplot2)
# Generar datos de ejemplo
set.seed(123)
n <- 100 # Número de puntos de datos
k <- 5 # Número de vecinos cercanos
x <- seq(1, 10, length.out = n)
y <- as.factor(ifelse(2 * x + rnorm(n, mean = 0, sd = 2) > 0, "A", "B")) # Variable categórica
# Crear el dataframe de datos
data <- data.frame(x, y)
# Dividir los datos en conjunto de entrenamiento y conjunto de prueba
train_indices <- sample(1:n, size = 0.7 * n, replace = FALSE)
train_data <- data[train_indices, ]
test_data <- data[-train_indices, ]
# Entrenar el modelo k-NN
knn_model <- knn(train = as.matrix(train_data[, "x"]), test = as.matrix(test_data[, "x"]), cl = train_data[, "y"], k = k)
# Entrenar el modelo de regresión lineal
lm_model <- lm(y ~ x, data = train_data)
# Predecir valores usando k-NN
knn_predictions <- knn(train = as.matrix(train_data[, "x"]), test = as.matrix(test_data[, "x"]), cl = train_data[, "y"], k = k)
# Predecir valores usando regresión lineal
lm_predictions <- predict(lm_model, newdata = test_data)
# Calcular el error cuadrado medio (MSE) para k-NN y regresión lineal
knn_mse <- mean((knn_predictions - test_data$y)^2)
lm_mse <- mean((lm_predictions - test_data$y)^2)
cat("Error cuadrado medio (MSE) de k-NN:", knn_mse, "\n")
cat("Error cuadrado medio (MSE) de regresión lineal:", lm_mse, "\n")
# Crear una visualización de los resultados
ggplot(data, aes(x = x, y = factor(y))) + geom_point(size = 3) + 
  geom_point(data = test_data, aes(y = knn_predictions), color = "blue", size
             = 2, shape = 4) + geom_line(data = test_data, aes(y = lm_predictions), color 
                                         = "red", size = 1) + labs(x = "Variable X", y = "Variable Y", title = 
                                                                     "Comparación de k-NN y Regresión Lineal") + theme_minimal()
