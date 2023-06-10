# ejemplo de knn con mas datos usando el DS "iris"
# bibliotecas
library(class)
library(datasets)
library(ggplot2)
library(GGally)
# cargar DS
data(iris)
ds_alergias_ordenadas <- read.csv("alergias_ordenadas.csv",sep=";")

ggpairs(ds_alergias_ordenadas,columns = (1))

ggplot(data = ds_alergias_ordenadas, aes(x = X, y = Freq, col = Freq)) +
  geom_point()