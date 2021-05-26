library("dplyr")
library("tidyverse")
library("maps")
library("stringr")

nba_data <- read.csv("nba_games_stats.csv")

nba_data_season <- mutate(nba_data, DateCorrectYear = str)

nba_data_season <- mutate(nba_data, SeasonYear = as.Date(Date, "%m/%d/%y"))

nba_data_season_14_15 <- filter(nba_data_season, SeasonYear <= "2015-04-15" )

nba_data_season_15_16 <- filter(nba_data_season, SeasonYear <= "2016-06-19") %>%
  filter(SeasonYear > "2015-04-15")

nba_data_season_16_17 <- filter(nba_data_season, SeasonYear <= "2017-06-19") %>%
  filter(SeasonYear > "2016-06-19")

nba_data_season_17_18 <- filter(nba_data_season, SeasonYear <= "2018-06-19") %>%
  filter(SeasonYear > "2017-06-19")



## Get average of points during the season 

avg_14_15 <- summarise(nba_data_season_14_15, AvgPoints = mean(TeamPoints), MedianPoints = median(TeamPoints))

avg_15_16 <- summarise(nba_data_season_15_16, AvgPoints = mean(TeamPoints), MedianPoints = median(TeamPoints))

avg_16_17 <- summarise(nba_data_season_16_17, AvgPoints = mean(TeamPoints), MedianPoints = median(TeamPoints))

avg_17_18 <- summarise(nba_data_season_17_18, AvgPoints = mean(TeamPoints), MedianPoints = median(TeamPoints))

## Get average of points during the season per team

avg_per_team_14_15 <- group_by(nba_data_season_14_15, Team) %>%
  summarise(AvgTeam = mean(TeamPoints), MedTeam = median(TeamPoints))

avg_per_team_15_16 <- group_by(nba_data_season_15_16, Team) %>%
  summarise(AvgTeam = mean(TeamPoints), MedTeam = median(TeamPoints))

avg_per_team_16_17 <- group_by(nba_data_season_16_17, Team) %>%
  summarise(AvgTeam = mean(TeamPoints), MedTeam = median(TeamPoints))

avg_per_team_17_18 <- group_by(nba_data_season_17_18, Team) %>%
  summarise(AvgTeam = mean(TeamPoints), MedTeam = median(TeamPoints))

## Get average of points allowed during the season per team

avg_pAgainst_team_14_15 <- group_by(nba_data_season_14_15, Team) %>%
  summarise(AvgAgainstTeam = mean(OpponentPoints), MedAgainstTeam = median(OpponentPoints))

avg_pAgainst_team_15_16 <- group_by(nba_data_season_15_16, Team) %>%
  summarise(AvgAgainstTeam = mean(OpponentPoints), MedAgainstTeam = median(OpponentPoints))

avg_pAgainst_team_16_17 <- group_by(nba_data_season_16_17, Team) %>%
  summarise(AvgAgainstTeam = mean(OpponentPoints), MedAgainstTeam = median(OpponentPoints))

avg_pAgainst_team_17_18 <- group_by(nba_data_season_17_18, Team) %>%
  summarise(AvgAgainstTeam = mean(OpponentPoints), MedAgainstTeam = median(OpponentPoints))


## Find the best defensive team per season

## Find best offensive team per season

## Graph on how the total defensive attributes (Rebounds, steals, TO, etc) are compared to other teams
## This will answer our hypothesis of being a defensice team makes you win the championship
## If hypothesis is correct, graph other attributes
## If hypothesis is incorrect, look for other clues on what makes a champion