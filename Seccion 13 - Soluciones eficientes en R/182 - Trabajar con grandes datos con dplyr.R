auto <- read.csv("Seccion 13 - Soluciones eficientes en R/auto-mpg.csv",
                 stringsAsFactors = F)
auto$cylinders <- factor(auto$cylinders,
                         levels = c(3,4,5,6,8),
                         labels = c("3C","4C","5C","6C","8C"))
# dplyr
# select -> select()
# where -> filter()
# group by -> group_by() / summarise()
# order by -> arrenge()
# join -> join()
# column alias -> mutate()

#install.packages("dplyr")
library(dplyr)

#subconunto
subset.auto <- select(auto, mpg, horsepower, acceleration)
head(subset.auto)

#filter - where
auto.80 <- filter(auto,model_year >= 80)
head(auto.80)

#nueva variable
auto.norm <- mutate(auto,mpg.norm = round((mpg - mean(mpg))/sd(mpg),2))
head(auto.norm)

#agrupaciones
summarise(group_by(auto, cylinders),mean(mpg))
summarise(group_by(auto, model_year),mean(mpg))


#operador pipe %>%
auto %>%
  filter(model_year < 78) %>%
  group_by(cylinders) %>%
  summarise(mean(mpg))
