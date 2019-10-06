library(ggplot2)

#scatter plot
auto <- read.csv("Seccion 09 - El paquete ggplot2/auto-mpg.csv",
                 stringsAsFactors = F)
auto$cylinders <- factor(auto$cylinders, 
                         labels = c("3cyl","4cyl","5cyl","6cyl","8cyl"))

plot <- ggplot(auto,
               aes(weight, mpg))
plot + geom_point()
plot + geom_point(alpha = 1/2, size = 5, aes(color = factor(cylinders)) ) + 
  geom_smooth(method = "lm", se = TRUE, color = "green") +
 # facet_grid(cylinders ~ .) +
 # facet_grid(. ~ cylinders) +
  theme_bw(base_family = "Calibri", base_size = 10) +
  labs(x = "Peso") + labs(y = "Millas por galeón") + 
  labs(title = "Consume vs Peso")


qplot(x = weight, 
      y = mpg,
      data = auto,
      geom = c("point","smooth"),
      method = "lm",
      formula = y~x,
      color = cylinders,
      main = "Regresion de MPG sobre el peso")
 
