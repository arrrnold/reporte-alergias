# numero_repetido.R

# Cargar el dataset
data <- read.csv("usuarios.csv", sep=";")
# elegir la columna numero_alergias del DS
num_alergias <- data$numero_alergias
# tabla de frecuencias de los numeros de alergias
frecuencia_num_alergias <- table(num_alergias)
# ordenar frecuencias de la tabla de manera descendente
frecuencia_num_alergias_ordenadas <- sort(frecuencia_num_alergias,decreasing = TRUE)
# elegir la alergia #1
num_alergia_mas_frecuente <- names(frecuencia_num_alergias_ordenadas)[1]
# imprimir solución
plot(frecuencia_num_alergias_ordenadas,
     ylab="Numero de alergias",xlab="Cantidad de usuarios")
cat("Es más común que los usuarios tengan", num_alergia_mas_frecuente, "alergias")


# predecir el num de usuarios que van a tener 6, 7 y 8 alergias
datos <- data.frame(frecuencia_num_alergias_ordenadas)

x <- as.numeric(datos$num_alergias)
y <- datos$Freq

# Ajuste del modelo de regresión lineal
modelo <- lm(y ~ x)

# Resumen del modelo
summary(modelo)

# Obtener los coeficientes de la regresión
coeficientes <- coef(modelo)

# Realizar prediccion
nuevo_x <- c(6)
prediccion <- predict(modelo, data.frame(x = nuevo_x))

# Imprimir las prediccion
cat("prediccion para nuevo_x:", prediccion, "\n")

# Graficar los datos de entrenamiento y el modelo ajustado
plot(x, y, main = "Regresión Lineal Simple", xlab = "Número de usuarios", ylab = "Número de alergias")
abline(modelo, col = "blue")
points(nuevo_x, prediccion, col = "red", pch = 16)
legend("topleft", legend = c("Datos de entrenamiento", "Modelo ajustado", "Predicción"),
       col = c("black", "blue", "red"), pch = c(1, 16, 16))

