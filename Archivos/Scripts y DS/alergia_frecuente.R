# Cargar el dataset
data <- read.csv("usuarios.csv", sep=";")

# Calcular la frecuencia de las alergias
# strsplit para dividir los nombres separados por coma
# en elementos individuales
ingredientes_separados <- strsplit(data$alergias, ",")

# unlist para crear un vector para poner los nombres separados
ingredientes <- unlist(ingredientes_separados)
tabla_de_frecuencia <- table(ingredientes)

# ordenar de menor a mayor las frecuencias
alergias_ordenadas <- sort(tabla_de_frecuencia, decreasing = TRUE)
alergia_mas_comun <- names(alergias_ordenadas)[1] # alergia ubicada en el #1

# Mostrar el resultado
cat("La alergia m�s com�n es:", alergia_mas_comun)
plot(alergias_ordenadas[1:8], xlab="Ingrediente",
     ylab="Frecuencia", ylim=c(0,100))