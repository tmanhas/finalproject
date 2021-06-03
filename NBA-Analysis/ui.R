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
                               h2("Introduction to Webpage")),
                      tabPanel("Defensive Statistics",
                              h2("Defensive Stats"),
                              p("This page looks at a key defensive stat, points scored by opponent.
                                 The below graphs display the average amount of points scored against a team
                                 in a given season. It can be concluded that lower the average amount of points 
                                 allowed, the stronger the team is defensively."),
                          sidebarLayout(
                            sidebarPanel(
                              checkboxGroupInput(inputId = "teams", label = "Select teams to compare",
                                                 choices = unique(nba_data$Team))
                            ),
                            mainPanel(
                              plotOutput("table1"),
                              br(),
                              plotOutput("table2"),
                              br(),
                              plotOutput("table3"),
                              br(),
                              plotOutput("table4")
                            )
                          )),
                        tabPanel("Offensive Statistics"),
                        tabPanel("Best/Worst Team"),
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
