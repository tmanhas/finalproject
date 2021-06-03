## This is the backend

library("tidyverse")
library("maps")
library("ggplot2")

nba_data <- read.csv("nba_games_stats.csv")

shinyServer(function(input, output) {
  output$teams <- renderUI({
    checkboxGroupInput(inputId = "Teams")
  })
  react_avg_pAgainst_team_17_18 <- reactive({
    if (is.null(input$teams)) {
      avg_pAgainst_team_17_18
    } else {
      avg_pAgainst_team_17_18 %>% 
        filter(Team %in% input$teams)
    }
  })
  output$table <- renderPlot({
    ggplot(data = react_avg_pAgainst_team_17_18()) +
      geom_point(mapping = aes(x = Team, y = AvgAgainstTeam, size = AvgAgainstTeam))
  })
  output$allnba <- renderDataTable({
    nba_data
  })
  output$description <- renderText({
    print("This data table is the raw data that we used for our analysis of teams. 
          Feel free to click through using the filters above or below the table to narrow you search.
          Slide left and right to see all the different stats tracked.")
  })
  
})
