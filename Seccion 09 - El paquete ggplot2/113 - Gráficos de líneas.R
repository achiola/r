library(ggplot2)
mtcars <- read.csv("Seccion 09 - El paquete ggplot2/mtcars.csv",
                   stringsAsFactors = F)
head(mtcars)

plot <- ggplot(mtcars,
               aes(x=wt, y=mpg))
plot + geom_line()
plot + geom_line(linetype = "dashed",
                 color = "red")

plot + geom_line(aes(color = as.factor(carb)))
