#Author: Benjamin Huber
#Date: February 27, 2023
#Project: Squirrel Census Analysis

#Objective: Join the squirrel data and the park data and create derived variables

#Output:"Data/squirrel_analysis_data.csv"

#Setup:
require(tidyverse)
setwd("C:/Users/bdh22/Dropbox/P8170S23/P8170-Lectures/SquirrelCodingSample/SquirrelNYC")


#Data: 
parks <- read.csv("https://raw.githubusercontent.com/Benjamin-Huber/SquirrelNYC/main/Data/park-data.csv")
squirrel_data <- read.csv("https://raw.githubusercontent.com/Benjamin-Huber/SquirrelNYC/main/Data/squirrel-data.csv")



#Create Tree/Ground Variable
#Create Eating/Foraging vs other activities variable

squirrel_data <- squirrel_data %>% mutate(
  above_ground = ifelse(str_detect(Location, "Above"), 1, 0),
  eat_forag = case_when(
    str_detect(Activities, regex("eat", ignore_case = TRUE)) ~ 1,
    str_detect(Activities, regex("forag", ignore_case = TRUE)) ~ 1,
    TRUE ~ 0
  )
)


#Create Park Conditions Variable
parks <- parks %>% mutate(
  busy_park = ifelse(str_detect(Park.Conditions, regex("busy", ignore_case = TRUE)), 1, 0)
)


#Join Park Conditions variables with Squirrel data
squirrel_analysis_data <- squirrel_data %>% left_join(parks %>% select(Park.ID, busy_park))

write.csv(squirrel_analysis_data, "Data/squirrel_analysis_data.csv")
