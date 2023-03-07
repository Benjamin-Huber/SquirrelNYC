###################################################################################
#BAD
################################################################################
library(gee)
library(tidyverse)

gee(above_ground ~ busy_park, id = Park.ID, family = "binomial",
    data = read.csv("https://raw.githubusercontent.com/Benjamin-Huber/SquirrelNYC/main/Data/squirrel-data.csv") %>% mutate(
      above_ground = ifelse(str_detect(Location, "Above"), 1, 0),
      eat_forag = case_when(
        str_detect(Activities, regex("eat", ignore_case = TRUE)) ~ 1,
        str_detect(Activities, regex("forag", ignore_case = TRUE)) ~ 1,
        TRUE ~ 0))%>% left_join(read.csv("https://raw.githubusercontent.com/Benjamin-Huber/SquirrelNYC/main/Data/park-data.csv") %>% mutate(busy_park = ifelse(str_detect(Park.Conditions, regex("busy", ignore_case = TRUE)), 1, 0))
                                %>% select(Park.ID, busy_park)) )

#Gee analysis
gee(above_ground ~ busy_park, id = Park.ID, family = "binomial",
    #get squirrel data
    data = read.csv("https://raw.githubusercontent.com/Benjamin-Huber/SquirrelNYC/main/Data/squirrel-data.csv") %>% mutate(
      #if location is "above ground" create binary above ground variable
      above_ground = ifelse(str_detect(Location, "Above"), 1, 0),
      #create eat forage binary varible
      eat_forag = case_when(
        #create eat variable (This comment is wrong)
        str_detect(Activities, regex("eat", ignore_case = TRUE)) ~ 1,
        #create forage variable
        str_detect(Activities, regex("forag", ignore_case = TRUE)) ~ 1,
        TRUE ~ 0))%>% left_join(read.csv("https://raw.githubusercontent.com/Benjamin-Huber/SquirrelNYC/main/Data/park-data.csv") %>% mutate(busy_park = ifelse(str_detect(Park.Conditions, regex("busy", ignore_case = TRUE)), 1, 0))
                                %>% select(Park.ID, busy_park)) )



