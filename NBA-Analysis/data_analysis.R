library("dplyr")
library("tidyverse")
library("maps")
library("stringr")

nba_data <- read.csv("nba_games_stats.csv")

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
  summarise(AvgTeam = mean(TeamPoints), MedTeam = median(TeamPoints)) %>%
  mutate(Year = "14-15")

avg_per_team_15_16 <- group_by(nba_data_season_15_16, Team) %>%
  summarise(AvgTeam = mean(TeamPoints), MedTeam = median(TeamPoints)) %>%
  mutate(Year = "15-16")

avg_per_team_16_17 <- group_by(nba_data_season_16_17, Team) %>%
  summarise(AvgTeam = mean(TeamPoints), MedTeam = median(TeamPoints))  %>%
  mutate(Year = "16-17")

avg_per_team_17_18 <- group_by(nba_data_season_17_18, Team) %>%
  summarise(AvgTeam = mean(TeamPoints), MedTeam = median(TeamPoints))  %>%
  mutate(Year = "17-18")

## Get average of points allowed during the season per team

avg_pAgainst_team_14_15 <- group_by(nba_data_season_14_15, Team) %>%
  summarise(AvgAgainstTeam = mean(OpponentPoints), MedAgainstTeam = median(OpponentPoints)) %>%
  mutate(Year = "14-15")

avg_pAgainst_team_15_16 <- group_by(nba_data_season_15_16, Team) %>%
  summarise(AvgAgainstTeam = mean(OpponentPoints), MedAgainstTeam = median(OpponentPoints)) %>%
  mutate(Year = "15-16")

avg_pAgainst_team_16_17 <- group_by(nba_data_season_16_17, Team) %>%
  summarise(AvgAgainstTeam = mean(OpponentPoints), MedAgainstTeam = median(OpponentPoints)) %>%
  mutate(Year = "16-17")

avg_pAgainst_team_17_18 <- group_by(nba_data_season_17_18, Team) %>%
  summarise(AvgAgainstTeam = mean(OpponentPoints), MedAgainstTeam = median(OpponentPoints))  %>%
  mutate(Year = "17-18")


## Find the best defensive team per season
ggplot(data = avg_pAgainst_team_17_18) +
  geom_point(mapping = aes(x = Team, y = AvgAgainstTeam, size = AvgAgainstTeam))


all_seasons_avg_points_against <- rbind(avg_pAgainst_team_14_15, avg_pAgainst_team_15_16) %>%
  rbind(avg_pAgainst_team_16_17) %>%
  rbind(avg_pAgainst_team_17_18)


all_seasons_avg_points <- rbind(avg_per_team_14_15, avg_per_team_15_16) %>%
  rbind(avg_per_team_16_17) %>%
  rbind(avg_per_team_17_18)

## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ##
## Make a plot of the best offensive teams and best defensive teams              ##
## Data sets are "all_seasons_avg_points" and "all_seasons_avg_points_against"   ##
##                                                                               ##  
## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ##

## GSW 17-18 Best offense, SAS 15-16 Best Defense in our span
GSW_offensive_att <- filter(nba_data_season_17_18, Team == "GSW") %>%
  select(Team, FieldGoals, FieldGoalsAttempted, FieldGoals., X3PointShots, X3PointShotsAttempted, X3PointShots., FreeThrows., OffRebounds, Assists, Turnovers, Opp.TotalFouls) %>%
  group_by(Team) %>%
  summarise(FieldGoals. = mean(FieldGoals.), X3PointShots. = mean(X3PointShots.), FreeThrows. = mean(FreeThrows.), OffRebounds = mean(OffRebounds), Assists = mean(Assists), Turnovers = mean(Turnovers), Opp.TotalFouls = mean(Opp.TotalFouls)  )


SAS_defensive_att <- filter(nba_data_season_15_16, Team == 'SAS') %>%
  select(Team, Steals, Blocks, TotalFouls, TotalRebounds, OffRebounds, Opp.FieldGoals., Opp.3PointShots., Opp.FreeThrowsAttempted, Opp.Turnovers) %>%
  group_by(Team) %>%
  summarise(StealsAvg = mean(Steals), BlocksAvg = mean(Blocks), TotalFoulsAvg = mean(TotalFouls), DefensiveRebounds = mean(TotalRebounds - OffRebounds) ,OppFieldGoalsAvg = mean(Opp.FieldGoals.), Opp3PointShotsAvg = mean(Opp.3PointShots.), OppFreeThrowsAttAvg = mean(Opp.FreeThrowsAttempted), OppTurnoversAvg = mean(Opp.Turnovers))

nba_data_season <- mutate(nba_data_season, DefensiveRebounds = (TotalRebounds - OffRebounds))



## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ##
## Data Science                                                                        ##
## This is the Data Science section in which we are going to group different values in ##
## buckets of information to make the NovelPlusMinusI1 statistic                       ##
##                                                                                     ##
## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ##



## See the distribution to create buckets of information
ggplot(data = nba_data_season) +
  geom_bar(mapping = aes( x = FieldGoals.))

## See the distribution to create buckets of information
ggplot(data = nba_data_season) +
  geom_bar(mapping = aes(x = DefensiveRebounds))

## See the distribution to create buckets of information
ggplot(data = nba_data_season) +
  geom_bar(mapping = aes(x = OffRebounds))

## See the distribution to create buckets of information
ggplot(data = nba_data_season) +
  geom_bar(mapping = aes(x = Blocks))

## See the distribution to create buckets of information
ggplot(data = nba_data_season) +
  geom_bar(mapping = aes(x = Steals))

## See the distribution to create buckets of information
ggplot(data = nba_data_season) +
  geom_bar(mapping = aes(x = Turnovers))

## See the distribution to create buckets of information
ggplot(data = nba_data_season) +
  geom_bar(mapping = aes(x = Opp.FieldGoals.)) 

## Buckets for rebounds giving higher value to rebounds
## By using case statements we gave weight to different categpories where we weighted more the off and def rebounds.
nba_data_plus_minus <- mutate(nba_data_season, DefensiveReboundsCategory = case_when(
  DefensiveRebounds >= 45  ~ 4,
  DefensiveRebounds > 35 ~ 2,
  DefensiveRebounds >= 30 ~ 0,
  DefensiveRebounds > 25 ~ -1,
  TRUE ~ -2
))

nba_data_plus_minus <- mutate(nba_data_plus_minus, OffReboundsCategory = case_when(
  OffRebounds >= 20 ~ 2,
  OffRebounds > 12 ~ 1, 
  OffRebounds > 7 ~ 0,
  OffRebounds > 5 ~ -1,
  TRUE ~ -2
))

nba_data_plus_minus <- mutate(nba_data_plus_minus, BlocksCategory = case_when(
  Blocks >= 12 ~ 2,
  Blocks > 6 ~ 1,
  Blocks > 3 ~ 0,
  TRUE ~ -1
))

nba_data_plus_minus <- mutate(nba_data_plus_minus, StealsCategory = case_when(
  Steals >= 16 ~ 2.5,
  Steals > 13 ~ 2,
  Steals > 10 ~ 1,
  Steals > 7 ~ 0,
  Steals > 5 ~ -.5, 
  Steals > 3 ~ -1,
  TRUE ~ -2
))


## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ##
## Check this for interactive data vis                      ##
## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ##


## DefensiveIstat creation --> DefRebounds + steals + blocks - (5 * Opp.FieldGoals)

nba_inPlusMinStat <- mutate(nba_data_plus_minus, Defensive_i_stat = ((StealsCategory + DefensiveReboundsCategory + BlocksCategory) - (5 * Opp.FieldGoals.)))

ggplot(data = nba_inPlusMinStat) +
  geom_point(mapping = aes(x = Team, y = Defensive_i_stat)) 

## OffensiveIstat creation --> FieldGoals. * 10 + rebounds - TO/3

nba_inPlusMinStat <- mutate(nba_inPlusMinStat, Offensive_i_stat = ((20 * FieldGoals. + OffReboundsCategory) - (Turnovers / 3)))

nba_inPlusMinStat <- select(nba_inPlusMinStat, Team, SeasonYear, Defensive_i_stat, Offensive_i_stat)

nba_inPlusMinStat <- mutate(nba_inPlusMinStat , NovelPlusMinusI1 = (Offensive_i_stat + Defensive_i_stat))



## Find the real best offensive team per season


team_ranks_14_18 <- group_by(nba_inPlusMinStat, Team) %>%
  summarise(mean(NovelPlusMinusI1))



## Graph on how the total defensive attributes are compared to other teams
## This will answer our hypothesis of being a defensive team makes you win the championship
## If hypothesis is correct, graph other attributes

## If hypothesis is incorrect, look for other clues on what makes a champion


## For final plot you have to group by season then by team and then display data.
