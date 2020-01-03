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
