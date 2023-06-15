# otra cosa
# numero_repetido.R

# Cargar el dataset
data <- read.csv("usuarios.csv", sep=";")

# Elegir la columna numero_alergias del DS
num_alergias <- data$numero_alergias

# Tabla de frecuencias de los numeros de alergias
frecuencia_num_alergias <- table(num_alergias)

# Ordenar frecuencias de la tabla de manera descendente
frecuencia_num_alergias_ordenadas <- sort(frecuencia_num_alergias, decreasing = TRUE)

# Elegir la alergia #1
num_alergia_mas_frecuente <- names(frecuencia_num_alergias_ordenadas)[1]

# Imprimir solución
plot(frecuencia_num_alergias_ordenadas,
     ylab = "Número de alergias", xlab = "Cantidad de usuarios")
cat("Es más común que los usuarios tengan", num_alergia_mas_frecuente, "alergias")

# Predecir el número de usuarios que van a tener 6, 7 y 8 alergias
datos <- data.frame(frecuencia_num_alergias_ordenadas)

x <- as.numeric(datos$num_alergias)
y <- datos$Freq

# Ajuste del modelo de regresión lineal
modelo <- lm(y ~ x)

# Resumen del modelo
summary(modelo)

# Obtener los coeficientes de la regresión
coeficientes <- coef(modelo)

# Realizar predicciones
nuevo_x <- c(7)
prediccion <- predict(modelo, data.frame(x = nuevo_x))

# Imprimir las predicciones
cat("Predicciones para nuevo_x:", prediccion, "\n")

# Graficar los datos de entrenamiento y el modelo ajustado
plot(datos$num_alergias, datos$Freq, main = "Regresión Lineal Simple", 
     xlab = "Número de usuarios", ylab = "Número de alergias")
abline(modelo, col = "blue")
points(nuevo_x, prediccion, col = "red", pch = 16)
points(nuevo_x, prediccion_knn, col = "red", pch = 16)
legend("topleft", legend = c("Datos de entrenamiento",
                             "Modelo ajustado", "Predicciones"),
       col = c("black", "blue", "red"), pch = c(16, 16, 16))

