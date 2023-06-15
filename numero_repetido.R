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
