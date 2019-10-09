install.packages("plot3D")
library(plot3D)

mtcars <- read.csv("Seccion 09 - El paquete ggplot2/mtcars.csv")
rownames(mtcars) <- mtcars$X
mtcars$X <- NULL

scatter3D(x = mtcars$disp,
          y = mtcars$wt,
          z = mtcars$mpg,
          clab = "Millas por galeón",
          pch = 19,
          cex = 0.5,
          theta = 18,
          phi = 20,
          main = "Titulo NNN",
          xlab = "Despazamiento",
          ylab = "Peso",
          zlab = "mpg",
          bty = "g")

text3D(x = mtcars$disp,
       y = mtcars$wt,
       z = mtcars$mpg,
       labels = rownames(mtcars),
       add = T,
       colkey = F,
       cex = 0.5)


### 127. Textos e Histogramas en 3D
data("VADeaths")
head(VADeaths)

hist3D(z = VADeaths,
       scale = F,
       expand = 0.01,
       bty = "g",
       phi = 30,
       col = "#1188CC",
       border = "black",
       shade = 0.2,
       ltheta = 80,
       space = 0.3,
       ticktype = "detailed")

scatter3D(x = mtcars$disp,
          y = mtcars$wt,
          z = mtcars$mpg,
          type = "h")

##128. Exportando los gráficos a varios formatos de salida

library(ggplot2)
library(GGally)
auto <- read.csv("Seccion 09 - El paquete ggplot2/auto-mpg.csv",
                 stringsAsFactors = F)
auto$cylinders <- factor(auto$cylinders,
                         labels = c("3c", "4c", "5c", "6c", "8c"))

#pdf(file = "Seccion 09 - El paquete ggplot2/multivarian.pdf")
png(file = "Seccion 09 - El paquete ggplot2/multivarian.png",
    width = 3000, height = 3000, res = 72)
ggpairs(auto[,2:8],
        aes(colour = cylinders, alpha = 0.4),
        title = "Análisis multivanza",
        upper = list(continuous = "density" ),
        lower = list(combo = "denstrip")) +
  theme(plot.title = element_text(hjust = 0.5))
dev.off()
 