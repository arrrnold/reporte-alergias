library(class)

# Cargar el dataset
data <- read.csv("usuarios.csv", sep=";")
# elegir la columna numero_alergias del DS
num_alergias <- data$numero_alergias
# tabla de frecuencias de los numeros de alergias
frecuencia_num_alergias <- table(num_alergias)
# ordenar frecuencias de la tabla de manera descendente
frecuencia_num_alergias_ordenadas <- sort(frecuencia_num_alergias, decreasing = TRUE)

# Predicción utilizando Regresión Lineal
datos <- data.frame(frecuencia_num_alergias_ordenadas)

x <- as.numeric(datos$num_alergias)
y <- datos$Freq

# Ajuste del modelo de regresión lineal
modelo_rl <- lm(y ~ x)

# Realizar predicción utilizando regresión lineal
nuevo_x_rl <- 7
prediccion_rl <- predict(modelo_rl, data.frame(x = nuevo_x_rl))

# Imprimir la predicción utilizando regresión lineal
cat("Predicción usando Regresión Lineal para nuevo_x =", nuevo_x_rl, ":", prediccion_rl, "\n")


# Predicción utilizando KNN
datos_entrenamiento <- data.frame(
  x = as.numeric(as.character(datos$num_alergias)),
  y = as.numeric(as.character(datos$Freq))
)

datos_prueba <- data.frame(x = nuevo_x_rl)

# Ajuste del modelo KNN
k <- 1 # Valor de K
prediccion_knn <- knn(train = datos_entrenamiento[, "x"], 
                      test = datos_prueba, 
                      cl = datos_entrenamiento$y, 
                      k = k)

# Imprimir la predicción utilizando KNN
cat("Predicción usando KNN para nuevo_x =", nuevo_x_rl, ":", prediccion_knn, "\n")

# Graficar los resultados
plot(datos$num_alergias, datos$Freq, main = "Comparación Regresión Lineal vs. KNN", 
     xlab = "Número de usuarios", ylab = "Número de alergias")
abline(modelo_rl, col = "blue")
points(nuevo_x_rl, prediccion_rl, col = "purple", pch = 16)
points(prediccion_knn, nuevo_x_rl, col = "green", pch = 16)
legend("topright", legend = c("Datos de entrenamiento",
                             "Modelo de RL ajustado", "Regresión lineal","KNN"),
       col = c("black", "blue", "red","green"), pch = c(16, 16, 16, 16))

