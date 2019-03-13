
library(shiny)

function(input, output, session) {
  output$zemljevid <- renderPlot({
    graf.zemljevid(input$st)
  })
}