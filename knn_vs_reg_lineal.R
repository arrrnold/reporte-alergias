library(class)

# Datos de ejemplo
x <- c(0,3,1,4,2,5)
y <- c(221,109,99,79,77,25)

# Ajuste del modelo de regresión lineal
modelo <- lm(y ~ x)

# Resumen del modelo
summary(modelo)

# Obtener los coeficientes de la regresión
coeficientes <- coef(modelo)

# Imprimir los coeficientes
cat("Coeficiente de la intersección (b0):", coeficientes[1], "\n")
cat("Coeficiente de la pendiente (b1):", coeficientes[2], "\n")

# Realizar predicciones
nuevo_x <- c(6)
predicciones <- predict(modelo, data.frame(x = nuevo_x))

# Imprimir las predicciones
cat("Predicciones para nuevo_x:", predicciones, "\n")

# Graficar los datos de entrenamiento y el modelo ajustado
plot(x, y, main = "Regresión Lineal Simple", xlab = "x", ylab = "y",xlim=NULL)
points(nuevo_x, predicciones, col = "red", pch = 16)
abline(modelo, col = "blue")
legend("topleft", legend = c("Datos de entrenamiento", "Modelo ajustado", "Predicciones"), col = c("black", "blue", "red"), pch = c(1, NA, 16))

# Predicción utilizando KNN
datos_entrenamiento <- data.frame(
  x = x,
  y = y
)

datos_prueba <- data.frame(x = nuevo_x)

# Ajuste del modelo KNN
k <- 2 # Valor de K
prediccion_knn <- knn(train = datos_entrenamiento[, "x"], 
                      test = datos_prueba, 
                      cl = datos_entrenamiento$y, 
                      k = k)

# Imprimir la predicción utilizando KNN
cat("Predicción usando KNN para numero_de_alergias =", nuevo_x, ":", prediccion_knn, "\n")

# Graficar los resultados
plot(datos$num_alergias, datos$Freq, main = "Comparación Regresión Lineal vs. KNN", 
     xlab = "Número de alergias", ylab = "Número de usuarios")
abline(modelo_rl, col = "blue")
points(numero_de_alergias, prediccion_rl, col = "purple", pch = 16)
points(prediccion_knn, numero_de_alergias, col = "green", pch = 16)
legend("topright", legend = c("Datos de entrenamiento",
                              "Modelo de RL ajustado", "Regresión lineal","KNN"),
       col = c("black", "blue", "red","green"), pch = c(16, 16, 16, 16))

