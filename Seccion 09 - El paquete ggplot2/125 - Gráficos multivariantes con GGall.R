library(ggplot2)
library(GGally)
auto <- read.csv("Seccion 09 - El paquete ggplot2/auto-mpg.csv",
                 stringsAsFactors = F)
auto$cylinders <- factor(auto$cylinders,
                         labels = c("3c", "4c", "5c", "6c", "8c"))

ggpairs(auto[,2:8],
        aes(colour = cylinders, alpha = 0.4),
        title = "Análisis multivanza",
        upper = list(continuous = "density" ),
        lower = list(combo = "denstrip")) +
  theme(plot.title = element_text(hjust = 0.5))
