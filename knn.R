# Cargar paquetes necesarios
library(class)

# Cargar el dataset
data <- read.csv("usuarios.csv", sep=";")
# elegir la columna numero_alergias del DS

# Dividir los datos en conjunto de entrenamiento y conjunto de prueba
set.seed(123)
train_indices <- sample(1:nrow(data), size = 0.7 * nrow(data), replace = FALSE)
train_data <- data[train_indices, ]
test_data <- data[-train_indices, ]

# Entrenar el modelo KNN
k <- 1  # Número de vecinos cercanos
knn_model <- knn(
  train = as.matrix(train_data[, "numero_alergias"]),
  test = as.matrix(test_data[, "numero_alergias"]),
  cl = train_data[, "alergias"],
  k = k
)

# Imprimir las predicciones
cat("Predicciones del modelo KNN:\n")
print(knn_model)

plot(knn_model)
