install.packages("igraph")

library(igraph)
load("Seccion 11 - Conexiones por doquier - Análisis de Redes Sociales/meetup-hiking-edgelist.Rdata")

#vamos a filtrar un poco para poder graficar
user_edgelist.filtered <- user_edgelist.upper[user_edgelist.upper$x > 15, ]
head(user_edgelist.filtered)

#cambiamos los id de los usuarios, solo para que sea mas legible
uids <- unique(c(user_edgelist.filtered$i,user_edgelist.filtered$j))
i <- match(user_edgelist.filtered$i, uids)
j <- match(user_edgelist.filtered$j, uids)

new.graph <- data.frame(i, j, x = user_edgelist.filtered$x)


#ahora si graficamos
g <- graph.data.frame(new.graph, 
                      directed = F)
g
save(g, file = "Seccion 11 - Conexiones por doquier - Análisis de Redes Sociales/meetup-hiking-graph.Rdata")
plot.igraph(g, vertex.size = 20)

#con otros layouts
plot.igraph(g, 
            layout = layout.circle,
            vertex.size = 20)

plot.igraph(g, 
            edge.curved = T,
            vertex.color = "pink",
            edge.color = "blue",
            vertex.size = 20)

V(g)$size = degree(g)*4
plot.igraph(g, 
            edge.curved = T,
            vertex.color = "pink",
            edge.color = "blue")


color <- ifelse(degree(g) >= 5, "red", "blue")
size <- degree(g)*4
plot.igraph(g,
            vertex.label = NA,
            layout = layout.fruchterman.reingold,
            vertex.color = color,
            vertex.size = size)

E(g)$x
plot.igraph(g,
            edge.curved = T,
            edge.color = "black",
            edge.width = (E(g)-min(E(g))+1)/5)


## Grafo dirigido
gd <- graph.data.frame(new.graph, 
                      directed = T)
plot.igraph(gd,
            edge.curved = T,
            edger.color = "black",
            vertex.label.cex = 0.5,
            edge.width = 0)


# Grafo con pesos en las aristas
new.graph.w <- new.graph
names(new.graph.w) <- c('i','j','weight')
wg <- graph.data.frame(new.graph.w, directed = F)
wg
E(wg)$weight
plot.igraph(wg)
plot.igraph(wg, edge.label = E(wg)$weight)


#obtener la matriz de adyacencia de un grafo
get.adjacency(g, type = "upper")
get.adjacency(g, type = "lower")
get.adjacency(g, type = "both")
get.adjacency(g, type = "both", attr = "x")


#obtener lista de arista de un grafo
get.data.frame(g)
V(g)$size = degree(g)
get.data.frame(g, "vertices")
get.data.frame(g, "edges")
get.data.frame(g, "both")


#grafo bipartito
g1 <- rbinom(10,1,0.5)
g2 <- rbinom(10,1,0.5)
g3 <- rbinom(10,1,0.5)
g4 <- rbinom(10,1,0.5)
g5 <- rbinom(10,1,0.5)

membership <- data.frame(g1,g2,g3,g4,g5)
names(membership)
rownames(membership)
rownames(membership) <- c("u1","u2","u3","u4","u5","u6","u7","u8","u9","u10")

bg <- graph.incidence(membership)
bg
V(bg)$type
V(bg)$name
layout <- layout.bipartite(bg)
plot(bg,
     layout = layout,
     vertex.size = 15)

#proyeccion de un grafo bipartito
p <- bipartite.projection(bg)
p


plot(p$proj1)
plot(p$proj2)
