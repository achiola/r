library(mice)

housing.data <- read.csv("Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/housing-with-missing-value.csv",
                         header = TRUE,
                         stringsAsFactors = FALSE)

columns <- c("ptratio", "rad")

imputed_data <- mice(housing.data[,names(housing.data) %in% columns],
                     m = 5,
                     maxit = 50,
                     method = "pmm",
                     seed = 2018)

## pmm : comparacion predictiva de medias 
## logreg : regresion logistica
## poly : regresion polinomica
## polr : probabilidades proporcionales

summary(imputed_data)


complete.data <- complete(imputed_data)

housing.data$ptratio <- complete.data$ptratio
housing.data$rad <- complete.data$rad


anyNA(housing.data)


library(Hmisc)
housing.data <- read.csv("Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/housing-with-missing-value.csv",
                         header = TRUE,
                         stringsAsFactors = FALSE)

impute_arg <- aregImpute(~ptratio + rad, data = housing.data, n.impute = 5)
impute_arg

impute_arg$imputed$rad
