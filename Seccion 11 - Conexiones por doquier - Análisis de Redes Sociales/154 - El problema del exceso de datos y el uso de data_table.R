library(jsonlite)

api_key = ""

meetup.getUsers <- function(groups, api_key){
  users <- as.data.frame(NULL)
  for (i in 1:nrow(groups)) {
    url <- paste0("https://api.meetup.com/2/members?group_id=", groups$id[i],
                  "&only=id&key=",api_key)
    while (url!= "") {
      temp_json <- fromJSON(RCurl::httpGET(url))
      if(class(temp_json$results) == "data.frame"){
        tests <- cbind(group_id=groups$id[i],member_id=temp_json$results)
        users <- rbind(users,tests)
      }
      url <- temp_json$meta$`next`
    }
    print(paste0("Hemos recuprado los miembros del grupo ",i))
  }
  u <- data.frame(group_id = users$group_id, user_id = users$id)
  u
}

hiking.data <- fromJSON("Seccion 11 - Conexiones por doquier - Análisis de Redes Sociales/hiking-ny.json")
hiking.groups <- hikin.data$results

hiking.members <- meetup.getUsers(hiking.groups, api_key)

library(data.table)
users <- setDT(hiking.members)[,.SD[.N > 5], by user_id]
