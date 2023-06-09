# Cargar el dataset
data <- read.csv("usuarios.csv", sep=";")
# elegir la columna numero_alergias del DS
num_alergias <- data$numero_alergias
# tabla de frecuencias de los numeros de alergias
frecuencia <- table(num_alergias)
# ordenar frecuencias de la tabla de manera descendente
frecuencia_num_ordenadas <- sort(frecuencia,decreasing = TRUE)
# elegir la alergia #1
num_alergia_mas_frecuente <- names(frecuencia_num_ordenadas)[1]
# imprimir solución
plot(frecuencia)
cat("Es más común que los usuarios tengan", num_alergia_mas_frecuente, "alergias")