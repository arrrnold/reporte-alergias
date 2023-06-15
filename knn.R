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

# predecir el num de usuarios que van a tener 6 alergias usando KNN
library(class)

# Datos de ejemplo
datos <- data.frame(frecuencia_num_alergias_ordenadas)
x <- as.numeric(datos$num_alergias)
y <- datos$Freq

# Ajuste del modelo KNN ponderado
k <- 3  # Número de vecinos más cercanos a considerar
nuevo_x <- c(7) # cuando x=6 qué valor habrá en y
prediccion <- knn(train = matrix(x), test = matrix(nuevo_x), cl = y, k = k, prob = TRUE, use.all = TRUE)

# Imprimir la predicción
cat("Predicción para nuevo_x:", prediccion, "\n")

# Graficar los datos de entrenamiento y la predicción
plot(x, y, main = "KNN Ponderado - Regresión", xlab = "x", ylab = "y")
points(nuevo_x, prediccion, col = "red", pch = 16)
legend("topleft", legend = c("Datos de entrenamiento", "Predicción"), col = c("black", "red"), pch = c(1, 16))

