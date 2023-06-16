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

