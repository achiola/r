library(igraph)

load("Seccion 11 - Conexiones por doquier - Análisis de Redes Sociales/bipartite-graph.Rdata")
load("Seccion 11 - Conexiones por doquier - Análisis de Redes Sociales/meetup-hiking-d-graph.Rdata")
load("Seccion 11 - Conexiones por doquier - Análisis de Redes Sociales/meetup-hiking-graph.Rdata")


degree(g)
plot.igraph(g)


degree(dg)
plot.igraph(dg)


degree(bg)
plot.igraph(bg, layout = layout.bipartite)

degree(bg, "g3")
degree(dg, 15, mode = "in")
degree(dg, 15, mode = "out")
degree(dg, 15)


options(digits = 3)
degree.distribution(bg)
degree.distribution(dg)

plot.igraph(g)
betweenness(g)



plot.igraph(bg, layout = layout.bipartite)
betweenness(bg)
betweenness(bg,"u3")

edge.betweenness(bg)

closeness(g)



#### 160. Añadir y quitar nodos y aristas en un grafo
E(g)
E(dg)

neighbors(g, 1)
neighbors(bg, "u1")
neighbors(bg, "g1")

V(bg)$name
V(bg)$name[neighbors(bg, "g1")]

neighborhood(g, 1, 1)
neighborhood(g, 2, 1)


#agregar un nodo
new.g <- g + vertex(27, 28, 29, 30, 31)
plot.igraph(new.g)

#agregar arista
new.g <- new.g + edge(27,1)
new.g <- new.g + edge(27,28)
plot.igraph(new.g)


#borrar los de grado 0 (aislados)
new.g <- delete.vertices(new.g, V(new.g)[degree(new.g)==0])
plot.igraph(new.g)


#subgrafos inducidos
sub.g <- induced.subgraph(g, c(3, 6, 8, 9, 15, 21))
plot.igraph(sub.g)
