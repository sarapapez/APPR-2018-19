library(shiny)

shinyUI(fluidPage(
 sidebarPanel(
               sliderInput(inputId="st", label="Izberite število skupin:",
                           value=3, min=2, max=5)
             ),
             mainPanel(plotOutput("zemljevid")))
  )
