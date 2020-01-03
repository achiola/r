library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Elecciones condicionales"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput("plot_type", "Plot Type",
                        c("Nube de puntos"="scatter",
                          "Histograma"="histogram")),
            conditionalPanel(condition="input.plot_type != 'histogram")
        ),

        # Show a plot of the generated distribution
        mainPanel(
        )
    )
))
