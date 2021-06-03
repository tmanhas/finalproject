## This is the backend

library("tidyverse")
library("ggplot2")

nba_data <- read.csv("nba_games_stats.csv")

shinyServer(function(input, output) {
  output$teams <- renderUI({
    checkboxGroupInput(inputId = "Teams")
  })
  
#defense reactive graphs
  react_avg_pAgainst_team_14_15 <- reactive({
    if (is.null(input$teams)) {
      avg_pAgainst_team_14_15
    } else {
      avg_pAgainst_team_14_15 %>% 
        filter(Team %in% input$teams)
    }
  })
  output$table1 <- renderPlot({
    ggplot(data = react_avg_pAgainst_team_14_15()) +
      geom_point(mapping = aes(x = Team, y = AvgAgainstTeam, size = AvgAgainstTeam)) +
      labs(title = "Defense - Average Points Allowed per Game in '14-15 Season", 
           x = "Team(s)", y = "Average Points Scored Against")
  })
  react_avg_pAgainst_team_15_16 <- reactive({
    if (is.null(input$teams)) {
      avg_pAgainst_team_15_16
    } else {
      avg_pAgainst_team_15_16 %>% 
        filter(Team %in% input$teams)
    }
  })
  output$table2 <- renderPlot({
    ggplot(data = react_avg_pAgainst_team_15_16()) +
      geom_point(mapping = aes(x = Team, y = AvgAgainstTeam, size = AvgAgainstTeam)) +
      labs(title = "Defense - Average Points Allowed per Game in '15-16 Season", 
           x = "Team(s)", y = "Average Points Scored Against")
  })
  react_avg_pAgainst_team_16_17 <- reactive({
    if (is.null(input$teams)) {
      avg_pAgainst_team_16_17
    } else {
      avg_pAgainst_team_16_17 %>% 
        filter(Team %in% input$teams)
    }
  })
  output$table3 <- renderPlot({
    ggplot(data = react_avg_pAgainst_team_16_17()) +
      geom_point(mapping = aes(x = Team, y = AvgAgainstTeam, size = AvgAgainstTeam)) +
      labs(title = "Defense - Average Points Allowed per Game in '16-17 Season", 
           x = "Team(s)", y = "Average Points Scored Against")
  })
  react_avg_pAgainst_team_17_18 <- reactive({
    if (is.null(input$teams)) {
      avg_pAgainst_team_17_18
    } else {
      avg_pAgainst_team_17_18 %>% 
        filter(Team %in% input$teams)
    }
  })
  output$table4 <- renderPlot({
    ggplot(data = react_avg_pAgainst_team_17_18()) +
      geom_point(mapping = aes(x = Team, y = AvgAgainstTeam, size = AvgAgainstTeam)) +
      labs(title = "Defense - Average Points Allowed per Game in '17-18 Season", 
           x = "Team(s)", y = "Average Points Scored Against")
  })
  output$allnba <- renderDataTable({
    nba_data
  })

})
