install.packages("fpc")
install.packages("NbClust")

library(factoextra)
library(cluster)
library(fpc)
library(NbClust)

protein <- read.csv("Seccion 07 - Tecnicas de reduccion de datos/protein.csv")
rownames(protein) <- protein$Country
protein$Country <- NULL
protein.scaled <- as.data.frame(scale(protein))

nb <- NbClust(protein.scaled,
              distance = "euclidean",
              min.nc = 2,
              max.nc = 12,
              method = "ward.D2",
              index = "all")

fviz_nbclust(nb) + theme_minimal()


km.res <- kmeans(protein.scaled, 3)

km.sil <- silhouette(km.res$cluster, dist(protein.scaled))

sil.sum <- summary(km.sil)
sil.sum

fviz_silhouette(km.sil)

dd <- dist(protein.scaled, method = "euclidean")

km_stats <- cluster.stats(dd, km.res$cluster)
km_stats$within.cluster.ss
km_stats$clus.avg.silwidths
km_stats$dunn

kmed <- pam(protein.scaled, 3)
kmed.stats <- cluster.stats(dd, kmed$clustering)
kmed.stats$dunn
kmed.stats$within.cluster.ss
kmed.stats$clus.avg.silwidths
kmed.sil <- silhouette(kmed$clustering, dist(protein.scaled))
fviz_silhouette(kmed.sil)

fviz_cluster(km.res, data = protein.scaled)
fviz_cluster(kmed, data = protein.scaled)

res.com <- cluster.stats(dd, km.res$cluster, kmed$clustering)
res.com$corrected.rand
res.com$vi
