library(tidyverse)
library(readxl)
library(lubridate)

df <- read_excel("baby_weight.xlsx")

df$date <-ymd(df$date)
df$time <- strftime(df$time, format="%H:%M:%S")
df$date_time <- as.POSIXct(df$date_time)

df %>% 
  ggplot(aes(x = as.character(date), y = volume)) +
    geom_boxplot() 

df %>%
  ggplot(aes(x = as.character(date), y = volume, fill = type)) +
    geom_col()
