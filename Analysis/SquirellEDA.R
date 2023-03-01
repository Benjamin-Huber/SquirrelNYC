#Author: Benjamin Huber
#Date: February 27, 2023
#Project: Squirrel Census Analysis

#Objective: Create EMA Report of Squirrel Census Data Files

#Output:SquirrelEDA.html

#Setup:
require(tidyverse)
require(SmartEDA)

#Data: 
parks <- read.csv("~/SquirrelNYC/Data/park-data.csv")
stories <- read.csv("~/SquirrelNYC/Data/stories.csv")
squirrel_data <- read.csv("~/SquirrelNYC/Data/squirrel-data.csv")


#Create Automated Summary Reports of each dataset
ExpReport(
  squirrel_data,
  label=NULL,
  op_file="SquirrelEDA.html",
  op_dir="~/SquirrelNYC/Output")

ExpReport(
  parks,
  label=NULL,
  op_file="ParksEDA.html",
  op_dir="~/SquirrelNYC/Output")

ExpReport(
  stories,
  label=NULL,
  op_file="StoriesEDA.html",
  op_dir="~/SquirrelNYC/Output")




