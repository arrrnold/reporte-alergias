data <- read.csv("D:/Escritorio/IPN Upiiz/6ª Semestre/Mineria de datos/reporte/usuarios.csv", sep=";")

alergias <- data$alergias
numero_alergias <- data$numero_alergias

#Regresion Lineal sin normalizar
model <- lm(numero_alergias ~ alergias)

r_cuadrado <- summary(model)$r.squared 
cat("Coeficiente de determinación (R²):", round(r_cuadrado, 3), "\n")

error_estandar <- summary(model)$sigma 
cat("Error estándar de la estimación:", round(error_estandar, 3), "\n")

plot(numero_alergias ~ alergias,data=data,pch=16)
abline((model),col="red")
