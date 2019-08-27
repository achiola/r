auto <- read.csv("Seccion 04 - El análisis exploratorio de datos/auto-mpg.csv",
                 header = T,
                 stringsAsFactors = T)

auto$cylinders <- factor(auto$cylinders, 
                         levels = c(3,4,5,6,8),
                         labels = c("3 cil", "4 cil", "5 cil", "6 cil", "8 cil"))

library(lattice)

bwplot(~auto$mpg | auto$cylinders,
       main = "MPG Segun cilindrada",
       xlab = "Millas por galon")

xyplot(mpg ~ weight | cylinders, data = auto,
       main = "Peso vs Consumo vs Cilindrada",
       xlab = "Peso",
       ylab = "Consumo",
       aspect = 1, layout = c(3,2))  

## cambiar el tema
trellis.par.set(theme = col.whitebg())
