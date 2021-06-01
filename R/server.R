## This is the backend

library("tidyverse")
library("maps")
library("ggplot2")

function(input, output) {
  output$teams <- renderUI(
    selectInput(inputId = "Team", label = "Choose team to view", choices = unique(nba_data$Team))
  )
  
  output$allnba <- renderDataTable({
    nba_data
  })
  output$description <- renderText({
    print("This data table is the raw data that we used for our analysis of teams. 
          Feel free to click through using the filters above or below the table to narrow you search.
          Slide left and right to see all the different stats tracked.")
  })
  
}