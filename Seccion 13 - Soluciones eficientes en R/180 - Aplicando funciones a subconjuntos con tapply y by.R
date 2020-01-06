auto <- read.csv("Seccion 13 - Soluciones eficientes en R/auto-mpg.csv",
                 stringsAsFactors = F)

auto$cylinders <- factor(auto$cylinders,
                         levels = c(3,4,5,6,8),
                         labels = c("3C","4C","5C","6C","8C"))

tapply(auto$mpg, auto$cylinders, mean)
#multiples factores
tapply(auto$mpg, list(cyl = auto$cylinders), mean)


by(auto, auto$cylinders, 
   function(row){ cor(row$mpg, row$acceleration)} )
                                           