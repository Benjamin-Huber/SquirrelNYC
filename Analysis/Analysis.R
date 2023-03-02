#Author: Benjamin Huber
#Date: February 27, 2023
#Project: Squirrel Census Analysis

#Objective: Model Predictors of squirrel Activity

#Output:

#Setup:
require(tidyverse)
require(gee)
squirrel_analysis_data <- read.csv("Data/squirrel_analysis_data.csv")

gee(eat_forag ~ busy_park, id = Park.ID, data = squirrel_analysis_data) %>%
  summary()

gee(above_ground ~ busy_park, id = Park.ID, data = squirrel_analysis_data) %>%
  summary()

gee(above_ground ~ busy_park*eat_forag, id = Park.ID, data = squirrel_analysis_data) %>%
  summary()


glm(above_ground~eat_forag, data = squirrel_analysis_data, family = "binomial") %>%
  summary()

#Model Investigation