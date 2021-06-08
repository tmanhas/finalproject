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
                               br(),
                               img(src = "nbagraphic.jpeg", height = 300, width = "auto"),
                               br(),
                               p("Our Data looks at the Analysis of the NBA Games between the years 
                               2014-2018, on a season basis. We have used a number of statistics to 
                               analyse the game play of each and every team at the NBA games between 
                               2014-2018. The major one we have used to understand the probability of a 
                               team winning is called 'novelPlusMinus', and this helps us in understanding 
                               where a team that won or was close to winning might have gone wrong/right. 
                               This data base is for NBA lovers, and we have made a lot analysis through 
                               data science to make users understand the teams better and have them 
                               represented through numerous statistics. Our data comes Kaggle, and a 
                               lot of data extraction has been done from the original data, which is 
                               being represented through graphs as you will see in the next couple of tabs. 
                               These graphs will enable users to compare the different NBA teams, and not just 
                               compare with other teams, but also see how the trajectory of each team has changed 
                               over time in the complete NBA data table."),
                               br(),
                               h2("Summary"),
                               p("We chose to work with an NBA statistics database because we think that it is a sport that can be overall predictable by looking at the team statistics from the entire season and by using descriptive statistics which helps us find a number, 
          that we call the 'novelPlusMinus' statistics. This predicts which teams are going to reach the final that year and who is the most probable to win. 
          First we needed to do some data wrangling to allow us to manage the data properly and find the statistics that were going to contribute to create our Novel Statistic. 
          In the meantime we spent some time reading articles to understand what basketball players, coaches, and analysts had to say about all the attributes that make a great basketball team; 
          and we end up with a hypothesis that rebounding was a key part in the success of Micheal Jordan’s Bulls team, and critical for Miami to reach the finals last year. 
             Is this the only stat that matters? 
          Of course not, but in our data science part of the analysis, we weighted this statistic more than some of the other stats (Assists, steals, blocks, 3pt shooting, etc). 
          We made an exploratory data analysis to see the distribution of all the features that happen in a basketball game and depending on the mean and median.
          We then filtered the teams in different “buckets” of information to categorize the statistics since we do not want to be exact, as basketball is a sport with multiple probability collisions. 
          In the end, we got two statistic numbers, one for offensive and another defensive in which we add them together and end up with a single Novel Plus minus statistic. 
          We proved these values to see if we could predict which team won in different years from 2014 to 2018  and we got good results as we got 3 out of 4, which proved our point. And in the one that we didn’t get right, the team that was the champion came second place. 
          With this, our hypothesis of weighting rebounds makes more sense if we add them to all the statistics that happen in a basketball game. We are optimistic in saying that we can also suggest an NBA team on what type of game or players they need in order to enhance their game in relation to one of the seasons. 
          For example, if a team has a novel statistic of 4.4 and the champions had a 5.3, we could tell analyze where the team lacked or had lapses in and what different types of features they should optimize in order to have that 5.3.
")
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
                              plotOutput("season14_15"),
                              br(),
                              plotOutput("season15_16"),
                              br(),
                              plotOutput("season16_17"),
                              br(),
                              plotOutput("season17_18")
                            ),
                          
                        )),
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

          
 
