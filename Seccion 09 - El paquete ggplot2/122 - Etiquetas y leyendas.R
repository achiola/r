library(ggplot2)
tooth <- read.csv("Seccion 09 - El paquete ggplot2/ToothGrowth.csv")

ggplot(tooth,
       aes(x=dose, y=len, fill = as.factor(dose))) +
  geom_boxplot() +
  ggtitle("Crecimiento dental en fx de dosis") +
  xlab("Dosis de vitamina C") +
  ylab("Crecimiento dental") +
  labs(fill = "Dosis en mg/día") +
  theme(legend.position = "bottom") +
  guides(fill = F)



ggplot(tooth,
       aes(x=dose, y=len)) +
  geom_boxplot() +
#  theme_bw() +
#  theme_dark() +
#  theme_classic() +
  theme_gray() +
#  theme(plot.background = element_rect(fill = "red"))
  theme(axis.text.x = element_text(face = "bold", 
                                   family = "Times", 
                                   size = 14,
                                   angle = 45,
                                   color = "#FF0000"),
        axis.text.y = element_text(face = "italic",
                                   family = "Courier",
                                   size = 16)) +
  theme(panel.border = element_blank()) +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())
 