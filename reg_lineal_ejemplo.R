# Datos de ejemplo
x <- c(2, 3, 5, 7, 8)
y <- c(5, 7, 11, 15, 17)

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
nuevo_x <- c(4, 6, 9)
predicciones <- predict(modelo, data.frame(x = nuevo_x))

# Imprimir las predicciones
cat("Predicciones para nuevo_x:", predicciones, "\n")

# Graficar los datos de entrenamiento y el modelo ajustado
plot(x, y, main = "Regresión Lineal Simple", xlab = "x", ylab = "y")
abline(modelo, col = "blue")
points(nuevo_x, predicciones, col = "red", pch = 16)
legend("topleft", legend = c("Datos de entrenamiento", "Modelo ajustado", "Predicciones"), col = c("black", "blue", "red"), pch = c(1, NA, 16))
