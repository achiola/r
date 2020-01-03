library(shiny)


ui <- fluidPage(
    selectInput("choise", "Selecciona variable para eje X",
                choices = c("weight", "acceleration", "horsepowe", "cylinders")),
    downloadButton("report","Generar Reporte")
)

server <- function(input, output) {
    output$report <- downloadHandler(
        filename = "report.pdf",
        content = function(file){
            report <- file.path("Report.Rmd")
            params <- list(n = input$choise)
            rmarkdown::render(report, 
                              output_file = file, 
                              params = params, 
                              envir = new.env(parent = globalenv()))
        }
    )
}

# Run the application 
shinyApp(ui = ui, server = server)
