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
                        tabPanel("Defense",
                                 h2("Defensive Stats"), 
                          sidebarLayout(
                            sidebarPanel(
                              checkboxGroupInput(inputId = "teams", label = "Select teams to view",
                                                 choices = unique(nba_data$Team))
                            ),
                            mainPanel(
                              plotOutput("table")
                            )
                          )),
                        tabPanel("Offense"),
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
