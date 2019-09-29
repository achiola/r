bh <- read.csv("Seccion 07 - Tecnicas de reduccion de datos/BostonHousing.csv")

install.packages("corrplot")
library(corrplot)

corr <- cor(bh[,-14])
corr

corrplot(corr,
         method = "color")

corrplot(corr,
         method = "circle")

#scale = T - Correlaciones
#scale = F - covarianzas

bh.acp <- prcomp(bh[,-14],
                 scale. = T)

summary(bh.acp)
plot(bh.acp)
plot(bh.acp, type = "lines")
biplot(bh.acp, col = c("gray", "red"))

head(bh.acp$x,5)

bh.acp$rotation

bh.acp$sdev
