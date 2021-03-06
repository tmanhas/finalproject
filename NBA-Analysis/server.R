## This is the backend

library("tidyverse")
library("ggplot2")
source("data_analysis.R")

nba_data <- read.csv("nba_games_stats.csv")

shinyServer(function(input, output) {
  output$teams <- renderUI({
    checkboxGroupInput(inputId = "Teams")
  })
  
#defense reactive graphs
  react_avg_pAgainst_team_14_15 <- reactive({
    if (is.null(input$teamsd)) {
      avg_pAgainst_team_14_15
    } else {
      avg_pAgainst_team_14_15 %>% 
        filter(Team %in% input$teamsd)
    }
  })
  output$table1 <- renderPlot({
    ggplot(data = react_avg_pAgainst_team_14_15()) +
      geom_point(mapping = aes(x = Team, y = AvgAgainstTeam, size = AvgAgainstTeam)) +
      theme(axis.text.x = element_text(angle = 75, hjust = 1)) +
      labs(title = "Defense - Average Points Allowed per Game in '14-15 Season", 
           x = "Team(s)", y = "Average Points Scored Against")
  })
  react_avg_pAgainst_team_15_16 <- reactive({
    if (is.null(input$teamsd)) {
      avg_pAgainst_team_15_16
    } else {
      avg_pAgainst_team_15_16 %>% 
        filter(Team %in% input$teamsd)
    }
  })
  output$table2 <- renderPlot({
    ggplot(data = react_avg_pAgainst_team_15_16()) +
      geom_point(mapping = aes(x = Team, y = AvgAgainstTeam, size = AvgAgainstTeam)) +
      theme(axis.text.x = element_text(angle = 75, hjust = 1)) +
      labs(title = "Defense - Average Points Allowed per Game in '15-16 Season", 
           x = "Team(s)", y = "Average Points Scored Against")
  })
  react_avg_pAgainst_team_16_17 <- reactive({
    if (is.null(input$teamsd)) {
      avg_pAgainst_team_16_17
    } else {
      avg_pAgainst_team_16_17 %>% 
        filter(Team %in% input$teamsd)
    }
  })
  output$table3 <- renderPlot({
    ggplot(data = react_avg_pAgainst_team_16_17()) +
      geom_point(mapping = aes(x = Team, y = AvgAgainstTeam, size = AvgAgainstTeam)) +
      theme(axis.text.x = element_text(angle = 75, hjust = 1)) +
      labs(title = "Defense - Average Points Allowed per Game in '16-17 Season", 
           x = "Team(s)", y = "Average Points Scored Against")
  })
  react_avg_pAgainst_team_17_18 <- reactive({
    if (is.null(input$teamsd)) {
      avg_pAgainst_team_17_18
    } else {
      avg_pAgainst_team_17_18 %>% 
        filter(Team %in% input$teamsd)
    }
  })
  output$table4 <- renderPlot({
    ggplot(data = react_avg_pAgainst_team_17_18()) +
      geom_point(mapping = aes(x = Team, y = AvgAgainstTeam, size = AvgAgainstTeam)) +
      theme(axis.text.x = element_text(angle = 75, hjust = 1)) +
      labs(title = "Defense - Average Points Allowed per Game in '17-18 Season", 
           x = "Team(s)", y = "Average Points Scored Against")
  })
  output$all_seasons_avg_points_against <- renderDataTable({
    all_seasons_avg_points_against
  })

#offensive graphs
  react_avg_per_team_14_15 <- reactive({
    if (is.null(input$teamso)) {
      avg_per_team_14_15
    } else {
      avg_per_team_14_15 %>% 
        filter(Team %in% input$teamso)
    }
  })
  output$table5 <- renderPlot({
    ggplot(data = react_avg_per_team_14_15()) +
      geom_point(mapping = aes(x = Team, y = AvgTeam, size = AvgTeam)) +
      theme(axis.text.x = element_text(angle = 75, hjust = 1)) +
      labs(title = "Offense - Average Points Scored per Game in '14-15 Season", 
           x = "Team(s)", y = "Average Points Scored")
  })
  react_avg_per_team_15_16 <- reactive({
    if (is.null(input$teamso)) {
      avg_per_team_15_16
    } else {
      avg_per_team_15_16 %>% 
        filter(Team %in% input$teamso)
    }
  })
  output$table6 <- renderPlot({
    ggplot(data = react_avg_per_team_15_16()) +
      geom_point(mapping = aes(x = Team, y = AvgTeam, size = AvgTeam)) +
      theme(axis.text.x = element_text(angle = 75, hjust = 1)) +
      labs(title = "Offense - Average Points Scored per Game in '15-16 Season", 
           x = "Team(s)", y = "Average Points Scored")
  })
  react_avg_per_team_16_17 <- reactive({
    if (is.null(input$teamso)) {
      avg_per_team_16_17
    } else {
      avg_per_team_16_17 %>% 
        filter(Team %in% input$teamso)
    }
  })
  output$table7 <- renderPlot({
    ggplot(data = react_avg_per_team_16_17()) +
      geom_point(mapping = aes(x = Team, y = AvgTeam, size = AvgTeam)) +
      theme(axis.text.x = element_text(angle = 75, hjust = 1)) +
      labs(title = "Offense - Average Points Scored per Game in '16-17 Season", 
           x = "Team(s)", y = "Average Points Scored")
  })
  react_avg_per_team_17_18 <- reactive({
    if (is.null(input$teamso)) {
      avg_per_team_17_18
    } else {
      avg_per_team_17_18 %>% 
        filter(Team %in% input$teamso)
    }
  })
  output$table8 <- renderPlot({
    ggplot(data = react_avg_per_team_17_18()) +
      geom_point(mapping = aes(x = Team, y = AvgTeam, size = AvgTeam)) +
      theme(axis.text.x = element_text(angle = 75, hjust = 1)) +
      labs(title = "Offense - Average Points Scored per Game in '17-18 Season", 
           x = "Team(s)", y = "Average Points Scored")
  })
  output$all_seasons_avg_points <- renderDataTable({
    all_seasons_avg_points
  })
  
#all data graphs
  output$allnba <- renderDataTable({
    nba_data
  })
  output$test <- renderPlot({
    ggplot(data = nba_inPlusMinStat) +
      geom_point(mapping = aes(x = Team, y = Defensive_i_stat)) +
      theme(axis.text.x = element_text(angle = 75, hjust = 1))
  })

## Novel Graphs
 react_novel_14_15 <- reactive({
    if(is.null(input$TeamNov)) {
      nba_PlusMin_14_15
    } else {
      nba_PlusMin_14_15 %>%
        filter(Team %in% input$TeamNov)
    }
  })
  output$season14_15 <- renderPlot({
    ggplot(data = react_novel_14_15()) +
      geom_point(mapping = aes(x = Team, y = AvgNovelStat)) +
      coord_flip() +
      labs(
        title = "Average Novel Statistic For Each Team, 2014-2015 Season",
        x = "Team",
        y = "Mean Novel Statistic"
      )
  })
  react_novel_15_16 <- reactive({
    if(is.null(input$TeamNov)) {
      nba_PlusMin_15_16
    } else {
      nba_PlusMin_15_16 %>%
        filter(Team %in% input$TeamNov)
    }
  })
  output$season15_16 <- renderPlot({
    ggplot(data = react_novel_15_16()) +
      geom_point(mapping = aes(x = Team, y = AvgNovelStat)) +
      coord_flip() +
      labs(
        title = "Average Novel Statistic For Each Team, 2015-2016 Season",
        x = "Team",
        y = "Mean Novel Statistic"
      )
  })
  react_novel_16_17 <- reactive({
    if(is.null(input$TeamNov)) {
      nba_PLusMin_16_17
    } else {
      nba_PLusMin_16_17 %>%
        filter(Team %in% input$TeamNov)
    }
  })
  output$season16_17 <- renderPlot({
    ggplot(data = react_novel_16_17()) +
      geom_point(mapping = aes(x = Team, y = AvgNovelStat)) +
      coord_flip() +
      labs(
        title = "Average Novel Statistic For Each Team, 2016-2017 Season",
        x = "Team",
        y = "Mean Novel Statistic"
      )
  })
  react_novel_17_18 <- reactive({
    if(is.null(input$TeamNov)) {
      nba_PlusMin_17_18
    } else {
      nba_PlusMin_17_18 %>%
        filter(Team %in% input$TeamNov)
    }
  })
  output$season17_18 <- renderPlot({
    ggplot(data = react_novel_17_18()) +
      geom_point(mapping = aes(x = Team, y = AvgNovelStat)) +
      coord_flip() +
      labs(
        title = "Average Novel Statistic For Each Team, 2017-2018 Season",
        x = "Team",
        y = "Mean Novel Statistic"
      )
  })
})
