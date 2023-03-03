#Author: Benjamin Huber
#Date: February 27, 2023
#Project: Squirrel Census Analysis

#Objective: Model Predictors of squirrel Activity

#Output:

#Setup:
require(tidyverse)
require(gee)
require(gtsummary)
setwd("C:/Users/bdh22/Dropbox/P8170S23/P8170-Lectures/SquirrelCodingSample/SquirrelNYC")
squirrel_analysis_data <- read.csv("Data/squirrel_analysis_data.csv")


gee(eat_forag ~ busy_park, id = Park.ID, family = "binomial", data = squirrel_analysis_data) %>%
  summary()

gee(above_ground ~ busy_park, id = Park.ID, family = "binomial", data = squirrel_analysis_data) %>%
  summary()

glm(above_ground~eat_forag, data = squirrel_analysis_data, family = "binomial") %>%
  summary()


squirrel_analysis_data %>%
  select(eat_forag, above_ground, busy_park)%>%
  tbl_summary(by = busy_park) %>%
  add_overall()


#setwd("C:/Users/bdh22/Dropbox/P8170S23/P8170-Lectures/SquirrelCodingSample/SquirrelNYC/Output")
#knitr::spin("C:/Users/bdh22/Dropbox/P8170S23/P8170-Lectures/SquirrelCodingSample/SquirrelNYC/Analysis/Analysis.R")
