names.first <- c("Abel German", "Juan", "Gabriel", "Sansa")
names.last <- c("Chiola", "Perez", "Gonzalez", "Stark")

#combinar vectores
paste(names.first, names.last)


single.surname <- c("Spina", "Otro")
paste(names.first, single.surname)

username <- function(first, last){
  tolower(paste0(last, substr(first,1, 1)))
}

username(names.first, names.last)

auto <- read.csv("Seccion 13 - Soluciones eficientes en R/auto-mpg.csv")
head(auto)

auto$dmpg <- auto$mpg*2
head(auto)

auto$kmpg <- auto$mpg * 1.609
head(auto)


sum(auto$mpg)
min(auto$mpg)
max(auto$mpg)
range(auto$mpg)
prod(auto$mpg)
mean(auto$mpg)
median(auto$mpg)
var(auto$mpg)
sd(auto$mpg)

## normalizar
(auto$mpg - mean(auto$mpg))/sd(auto$mpg)
