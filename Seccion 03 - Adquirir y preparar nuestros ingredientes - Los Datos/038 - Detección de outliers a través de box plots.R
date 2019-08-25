ozone.data <- read.csv("Seccion 03 - Adquirir y preparar nuestros ingredientes - Los Datos/ozone.csv",
                       stringsAsFactors = FALSE)

boxplot(ozone.data$pressure_height,
        main = "Pressure Height",
        boxwex = 0.1)

boxplot(pressure_height ~ Month,
        data = ozone.data,
        main = "Pressure Height per month")


boxplot(ozone_reading ~ Month,
        data = ozone.data,
        main = "Ozone Reading per month")

######################################################
##### y para ver los outlier solamente....
######################################################
boxplot(ozone_reading ~ Month,
        data = ozone.data,
        main = "Ozone Reading per month")$out


######################################################
#39. Enmascarando los outliers con transformaciones y cappings
######################################################
imputed_outlier <- function(x, removeNA = TRUE){
  quantiles = quantile(x, c(0.05, 0.95), na.rm = removeNA)
  x[x<quantiles[1]] <- mean(x, na.rm = removeNA)
  x[x>quantiles[2]] <- median(x, na.rm = removeNA)
  x
}

imputed_data <- imputed_outlier(ozone.data$pressure_height)

par(mfrow = c(1,2))
boxplot(ozone.data$pressure_height, main = "Datos originales")
boxplot(imputed_data, main = "Datos sin outlier")


######################################################
#Ota forma sería reemplazando el el q1 y el q3
######################################################
replace_outlier <- function(x, removeNA = TRUE){
  qrts <- quantile(x, probs = c(0.25, 0.75), na.rm = removeNA)
  caps <- quantile(x, probs = c(0.05, 0.95), na.rm = removeNA)
  iqr <- qrts[2]-qrts[1]
  h <- iqr * 1.5
  x[x<qrts[1]-h] <- caps[1]
  x[x>qrts[2]+h] <- caps[2]
  x
}

replaced_data <- replace_outlier(ozone.data$pressure_height)

par(mfrow = c(1,3))
boxplot(ozone.data$pressure_height, main = "Datos originales")
boxplot(imputed_data, main = "Datos sin outlier (promedio)")
boxplot(replaced_data, main = "Datos sin outlier (reemplazo)")
