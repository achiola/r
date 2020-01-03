#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    output$output_text <- renderText(paste("mpg ~", input$x))
    output$output_plot <- renderPlot(plot(as.formula(paste("mpg~", input$x)), data=auto))
    output$summary <- renderPrint({summary(auto)})
    output$table <- renderTable({data.frame(x=auto)})
#    output$datatable <- renderDataTable({auto}, options = list(aLengthMenu = c(5,25,50),
#                                                               iDisplayLength = 5)
    output$datatable <- DT::renderDataTable(DT::datatable({
      data <- auto
      data
    }))
#                                        )
})
