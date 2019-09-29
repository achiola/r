protein <- read.csv("Seccion 07 - Tecnicas de reduccion de datos/protein.csv")
rownames(protein) <- protein$Country
protein$Country <- NULL
protein.scaled <- as.data.frame(scale(protein))

library(cluster)
library(factoextra)

km <- pam(protein.scaled, 4)
km

fviz_cluster(km)

## 95. Clustering large application (clara)
clarafit <- clara(protein.scaled, 4, samples = 5)
clarafit
fviz_cluster(clarafit)
