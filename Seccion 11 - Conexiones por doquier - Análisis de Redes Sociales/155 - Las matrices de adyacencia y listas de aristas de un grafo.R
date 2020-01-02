install.packages("Matrix")

library(Matrix)
load("Seccion 11 - Conexiones por doquier - Análisis de Redes Sociales/meetup-hiking.Rdata")

unique(users$user_id)
unique(users$group_id)


group_membership <- sparseMatrix(users$group_id, users$user_id, x=T)

#matriz de adyacencia
#si usuario A y usuario B comparten 3 grupos, entonces ese es el dato que se guarda
#en la interseccion
adjacency <- t(group_membership) %*% group_membership

summary(adjacency)

#armamos una matriz de aristas
user_edgelist <- as.data.frame(summary(adjacency))
summary(user_edgelist)

#como es simetrica
user_edgelist.upper <- user_edgelist[user_edgelist$i < user_edgelist$j,]

save(user_edgelist.upper, file="Seccion 11 - Conexiones por doquier - Análisis de Redes Sociales/meetup-hiking-edgelist.Rdata")
