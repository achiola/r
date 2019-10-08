library(ggplot2)
library(corrplot)

mtcars <- read.csv("Seccion 09 - El paquete ggplot2/mtcars.csv")
mtcars$X <- NULL

mtcars.cor <- cor(mtcars, 
                  method = "pearson")

round(mtcars.cor,
      digits = 2)

corrplot(mtcars.cor)

corrplot(mtcars.cor,
         method = "shade",
         shade.col = NA,
         tl.col = "black",
         tl.srt = 45)

colores <- colorRampPalette(c("#BB4444",
                              "#EE9988",
                              "#FFFFFF",
                              "#77AADD",
                              "#4477AA"))


corrplot(mtcars.cor,
         method = "shade",
         shade.col = NA,
         tl.col = "black",
         tl.srt = 45,
         col = colores(200),
         addCoef.col = "black",
         addcolorlabel = "no",
         order = "AOE")
 


corrplot(mtcars.cor,
         method = "shade",
         shade.col = NA,
         tl.col = "black",
         tl.srt = 45,
         col = colores(200),
         addCoef.col = "black",
         addcolorlabel = "no",
         order = "AOE",
         type = "lower")


corrplot(mtcars.cor,
         method = "shade",
         shade.col = NA,
         tl.col = "black",
         tl.srt = 45,
         col = colores(200),
         addCoef.col = "black",
         addcolorlabel = "no",
         order = "AOE",
         type = "upper")


corrplot(mtcars.cor,
         method = "shade",
         #shade.col = NA,
         tl.col = "black",
         tl.srt = 45,
         col = colores(200),
         addCoef.col = "black",
         addcolorlabel = "no",
         order = "AOE",
         type = "lower",
         diag = F,
         addshade = "all")



corrplot(mtcars.cor,
         method = "circle",
         #shade.col = NA,
         tl.col = "black",
         tl.srt = 45,
         col = colores(200),
         addCoef.col = "black",
         addcolorlabel = "no",
         order = "AOE",
         type = "lower",
         diag = F,
         addshade = "all")

corrplot(mtcars.cor,
         method = "pie",
         #shade.col = NA,
         tl.col = "black",
         tl.srt = 45,
         col = colores(200),
         addCoef.col = "black",
         addcolorlabel = "no",
         order = "AOE",
         type = "lower",
         diag = F,
         addshade = "all")


## con ggplot tambien podemos representar una matrix de corr
library(reshape2)
mtcars.melted <- melt(mtcars.cor)
ggplot(data = mtcars.melted,
       aes(x=Var1, 
           y=Var2,
           fill = value)) +
  geom_tile()


####119. Agregando tonalidades a las matrices de color
get_lower_triangle <- function(cormat) {
  cormat[upper.tri(cormat)] <- NA
  return(cormat)
}

get_upper_triangle <- function(cormat) {
  cormat[lower.tri(cormat)] <- NA
  return(cormat)
}

reorder_cormat <- function(cormat){
  dd <- as.dist((1 - cormat)/2)
  hc <- hclust(dd)
  cormat <- cormat[hc$order,hc$order]
}

cormat <- reorder_cormat(mtcars.cor)
cormat.up <- get_upper_triangle(cormat)
cormat.up.melted <- melt(cormat.up,
                         na.rm = T)
ggplot(cormat.up.melted,
       aes(x = Var1,
           y = Var2,
           fill = value)) +
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "blue",
                       high = "red",
                       mid = "white",
                       midpoint = 0,
                       limit = c(-1, 1),
                       space = "Lab",
                       name = "Pearson\nCorrelation") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, size = 12, hjust = 1)) +
  coord_fixed()
