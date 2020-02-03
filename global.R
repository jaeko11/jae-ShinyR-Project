library(shinydashboard)
library(readr)
library(shiny)
library(leaflet)
library(ggplot2)
library(dplyr)
library(magrittr)
library(tidyr)



ferry_dat <- read.csv(here::here("NYC_FerryData.csv")) 
names(ferry_dat)[1] <- "Date"
ferry_dat <- ferry_dat%>% 
   separate(col = Date,  into = c("Month", "Year", "Week"), sep = "/")



ferry_dat_long <- pivot_longer(data = ferry_dat,
                               cols = seq(4, length(names(ferry_dat)), 3),
                               values_to = "weekly_total") %>% 
   select(Month, Year, Week, name, weekly_total) %>%
   filter(name != "Week..Subtotal") %>% 
   mutate(daily_average = weekly_total / 7)

yearly_summary <- ferry_dat_long %>% 
   group_by(Year, name) %>% 
   summarize(total_riders = sum(weekly_total))

     





