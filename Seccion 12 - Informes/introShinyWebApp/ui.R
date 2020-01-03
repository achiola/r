
library(shiny)


shinyUI(
    pageWithSidebar(
        headerPanel("Aplicacion simple con shiny"),
        sidebarPanel(p("Vamos a crear plots con el data frame de 'auto'"),
                     selectInput("x","Selecciona el eje de las x",
                                 choices = c("weight","cylinders","acceleration",
                                             "horsepower", "displacement"))
                     ),
        mainPanel(
            tabsetPanel(
                tabPanel("plot",
                    h3(textOutput("output_text")),
                    plotOutput("output_plot")
                ),
                tabPanel("Image",
                    img(src="san_juan.jpg", height=400, width=600)
                ),
                tabPanel("Summary", verbatimTextOutput("summary")),
                tabPanel("Table", tableOutput("table")),
                #tabPanel("Data table", dataTableOutput("datatable"))
                tabPanel("Data table", DT::dataTableOutput("datatable"))
                
            )
        )
    )

    
)
