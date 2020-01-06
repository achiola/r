#lapply , l es de lista
#se puede aplicar a vectores, listas y data frame

auto <- read.csv("Seccion 13 - Soluciones eficientes en R/auto-mpg.csv",
                 stringsAsFactors = F)


x <- c(1,2,3)
x

lapply(x, sqrt)

x <- list(a=1:10,
          b=c(1,10,100,1000),
          c=seq(5,50,by = 5))
x
x_con_lapply <- lapply(x, mean)
class(x_con_lapply)

x_con_sapply <- sapply(x, mean)
class(x_con_sapply)
x_con_sapply



lapply(auto[,2:8], min)
sapply(auto[,2:8], min)


sapply(auto[,2:8], summary)

sapply(auto[,2:8], range)

# sapply devuelve la misma clase que el inputo
sapply(auto[,2:8], min)
sapply(auto[,2], min) # es incorrecto
sapply(as.data.frame(auto[,2]), min) #ok
