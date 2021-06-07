## This is the user interface 

library("shiny")
library("shinythemes")
source("data_analysis.R")

fluidPage(theme = shinytheme("superhero"),
          fluidRow(
            
            column(8,
                   h1("Data Analysis in NBA Teams"),
            ),
            column(4,
                   img(src = "nba_logo.jpeg", height = 100, width = "auto")
            )
          ),
          ## Introduction before
          p("We made an exploratory analysis to see the ditribution of the data in order to 
            give weights to the Teams for the creation of our novel statistic of plus minus"),
          br(),
          tabsetPanel(type = "tabs",
                      tabPanel("Introduction",
                               h2("Introduction"),
                               ),
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
                              br(),
                              h2("All seasons data table below:"),
                              p("From this, it is clear that SAS during the '15-16 season was the 
                                strongest defensively as the gave up the least amount of points."),
                              dataTableOutput("all_seasons_avg_points_against")
                            )
                          )),
                        tabPanel("Offensive Statistics",
                                h2("Offensive Stats"),
                                p("This page looks at an important statistic when determining the best offensive team,
                                   average points scored per game. This is an indication of how strong a team is on the court.
                                   It can be concluded that a team with the highest average is the 
                                   strongest offensive team."),
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
                                     br(),
                                     h2("All seasons data table below:"),
                                     p("From this data, it can concluded that the strongest offensive team was GSW during the 'BLANK'16-17 season
                                       as that team had the highest average points scored per game,"),
                                     dataTableOutput("all_seasons_avg_points")
                                   )
                                 )),
                      
                        tabPanel(
                          "Novel Statistic",
                          h2("Looking at the Novel Statistic:"),
                          p("This page looks at the novel statistic which is a measure of offensive and defensive effeciency combined.
                            This statistic takes in things like field goal percentage, rebounds, and assists to give an accurate indicator
                            of how effective each team is during a season. A higher novel statistic means that that team is more effective
                            on the court and it can be predicted that they will have a more successful season than a team that has a lower novel
                            statistic."),
                           sidebarLayout(
                            sidebarPanel(
                              checkboxGroupInput(inputId = "TeamNov", label = "Select teams to compare",
                                                 choices = unique(nba_PlusMin_filtered$Team))
                              
                            ),
                            mainPanel(
                              plotOutput("14_15_season")
                              ## br(),
                              ## plotOutput("15_16_season"),
                              ## br(),
                              ## plotOutput("16_17_season"),
                              ## br(),
                              ## plotOutput("17_18_season")
                            ),
                          
                        ),
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
                      )
                      )
            )
          
 
