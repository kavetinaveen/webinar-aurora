## app.R ##
library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Shiny Demo - Aurora"),
  dashboardSidebar(),
  dashboardBody(
    fluidRow(
      box(textInput("text", label = h3("Text input"), placeholder = "Enter text..."),
          actionButton("button", "Classify"),
          textOutput(outputId = 'result'))
    )
  )
)

server <- function(input, output){
  observeEvent(input$button, {
    output$result <- renderText({
      if(input$text == '') return("None")
      if(grepl('good', tolower(input$text))) return("Positive")
      if(grepl('bad', tolower(input$text))) return("Negative")
    })
  })
}

shinyApp(ui, server)