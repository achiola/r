library(igraph)

g.dir <- graph(edges = c(1, 2, 2, 3, 2, 4, 1, 4, 5, 5, 3, 6, 5, 6),
               n = 6)

g.n_dir <- graph(edges = c(1, 2, 2, 3, 2, 4, 1, 4, 5, 5, 3, 6, 5, 6),
                 n = 6,
                 directed = F)

par(mfrow=c(1,2))

plot(g.dir)
plot(g.n_dir)


g_isolated <- graph(c("Juan", "Mar�a",
                      "Mar�a", "Ana",
                      "Ana", "Juan",
                      "Jos�", "Mar�a",
                      "Pedro", "Jos�",
                      "Joel", "Pedro"),
                    isolates = c("Carmen",
                                 "Antonio",
                                 "Mario",
                                 "Vicente"))

par(mfrow=c(1,1))
plot(g_isolated,
     edge.arrow.size = 0.5,
     vertex.color = "gold",
     vertex.size = 15,
     vertex.frame.color = "gray",
     vertex.label.color = "black",
     vertex.label.cex = 0.8,
     vertex.label.dist = 2,
     edge.curved = 0.2)
