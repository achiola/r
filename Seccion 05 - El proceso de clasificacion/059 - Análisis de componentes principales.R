usaarrest <- read.csv("Seccion 05 - El proceso de clasificacion/USArrests.csv",
                      stringsAsFactors = F)

row.names(usaarrest)<-usaarrest$X
usaarrest$X <- NULL

apply(usaarrest, 2, var)

acp <- prcomp(usaarrest,
              center = T,
              scale = T)

print(acp)

plot(acp, type = "l")
summary(acp)

biplot(acp, scale = 0)

pc1 <- apply(acp$rotation[,1] * usaarrest, 1, sum)
pc2 <- apply(acp$rotation[,2] * usaarrest, 1, sum)
usaarrest$pc1 <- pc1
usaarrest$pc2 <- pc2
usaarrest[,1:4] <- NULL
