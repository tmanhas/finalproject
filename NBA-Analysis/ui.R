## This is the user interface 

library("shiny")
library("shinythemes")

fluidPage(theme = shinytheme("superhero"),
          h1("Data Analysis in NBA Teams"),
          ## Introduction before
          p("We made an exploratory analysis to see the ditribution of the data in order to 
            give weights to the Teams for the creation of our novel statistic of plus minus"),
          br(),
          tabsetPanel(type = "tabs",
                      tabPanel("Introduction",
                               h2("Introduction to Webpage"),
                               plotOutput("test")),
                      tabPanel("Defensive Statistics",
                              h2("Defensive Stats"),
                              p("This page looks at a key defensive stat, points scored by opponent.
                                 The below graphs display the average amount of points scored against a team
                                 in a given season. It can be concluded that lower the average amount of points 
                                 allowed, the stronger the team is defensively."),
                          sidebarLayout(
                            sidebarPanel(
                              checkboxGroupInput(inputId = "teamsd", label = "Select teams to compare",
                                                 choices = unique(nba_data$Team))
                            ),
                            mainPanel(
                              plotOutput("table1"),
                              br(),
                              plotOutput("table2"),
                              br(),
                              plotOutput("table3"),
                              br(),
                              plotOutput("table4"),
                              h2("All seasons data table below:"),
                              p("From this, it is clear that SAS during the '15-16 season was the 
                                strongest defensively as the gave up the least amount of points."),
                              dataTableOutput("all_seasons_avg_points_against")
                            )
                          )),
                        tabPanel("Offensive Statistics",
                                 sidebarLayout(
                                   sidebarPanel(
                                     checkboxGroupInput(inputId = "teamso", label = "Select teams to compare",
                                                        choices = unique(nba_data$Team))
                                   ),
                                   mainPanel(
                                     plotOutput("table5"),
                                     br(),
                                     plotOutput("table6"),
                                     br(),
                                     plotOutput("table7"),
                                     br(),
                                     plotOutput("table8"),
                                     br()
                                   )
                                 )),
                        tabPanel("Best/Worst Teams",
                                 h2("Best/Worst Teams in the NBA"),
                                 p("We created a data statstic to assign different points based on a teams
                                   success in a certain recorded stastics to determine the best and worst NBA teams."),
                                 h2("Best Offensive Team"),
                                 h2("Best Defensive Team")),
                        tabPanel(
                          "All NBA Data",
                          sidebarLayout(
                            sidebarPanel(
                              p("This data table is the raw data that we used for our analysis of teams. 
                                Feel free to click through using the filters above or below the table to narrow you search.
                                Slide left and right to see all the different stats tracked.")
                            ),
                          mainPanel(
                            dataTableOutput("allnba")
                          )
                          )
                          )),
            )
          
          ##Graphs from data analysis --> these go inside the tabs, rename appropriately 
