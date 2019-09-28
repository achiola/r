protein <- read.csv("Seccion 07 - Técnicas de reduccion de datos/protein.csv")

rownames(protein) <- protein$Country
protein$Country <- NULL
protein.scale <- as.data.frame(scale(protein))

library(devtools)
devtools::install_github("kassambara/factoextra")

km <- kmeans(protein.scale, 4)
km

aggregate(protein.scale, by = list(cluster = km$cluster), mean)


library(factoextra)
fviz_cluster(km, data = protein.scale)
