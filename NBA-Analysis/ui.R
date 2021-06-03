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
                              textOutput("description")
                            ),
                          mainPanel(
                            dataTableOutput("allnba")
                          )
                          )
                          )),
            )
          
          ##Graphs from data analysis --> these go inside the tabs, rename appropriately 
