library(ggplot2)
library(shiny)
library(dplyr)
library(tidyr)
library("rsconnect")
library('shinythemes')
library("rsconnect")
library("plotly")
library(weathermetrics)
library("knitr")
dir.create("output", showWarnings = FALSE)

source("ui.R")
source("server.R")

shinyApp(ui = my.ui, server = my.server)

# Drop null values
OG_data <- read.csv("data/dengue_features_train.csv")
OG_data %>% drop_na()
# import second dataset with case data
caseData <- read.csv("data/dengue_labels_train.csv")
#merge
OG_data_cases <- cbind(OG_data, caseData)
View(OG_data_cases)
# Convert column of interest from Kelvin to Celsius.
OG_data_cases$reanalysis_avg_temp_k <- kelvin.to.celsius(OG_data_cases$reanalysis_avg_temp_k)
#export
View(OG_data_cases)
write.csv(OG_data_cases, file = "output/OG_data_cases.csv")
# Divide data into cities, SJ

# Divide data into cities, IQ


###
View(OG_data_cases)
OG_data_cases$year = NULL
OG_data_cases$weekofyear = NULL
OG_data_cases$city = NULL

View(OG_data_cases)
new_OG_data_cases <- select(OG_data_cases, -city)
View(new_OG_data_cases)
sj_data <- OG_data_cases %>% filter(OG_data_cases$city == "sj")
new_data_sj <- sj_data %>%
  group_by(year) %>%
  summarise_at(vars(-ndvi_ne), funs(mean(., na.rm=TRUE)))
new_data_sj <- select(new_data_sj, -city)
new_data_sj <- select(new_data_sj, -week_start_date)
new_data_sj$city <- 'sj'   # Use the same value (0) for all rows

View(new_data_sj)

iq_data <- OG_data_cases %>% filter(OG_data_cases$city=="iq")
View(iq_data)
new_data_iq <- iq_data %>%
  group_by(year) %>%
  summarise_at(vars(-ndvi_ne), funs(mean(., na.rm=TRUE)))
new_data_iq <- select(new_data_iq, -city)
new_data_iq <- select(new_data_iq, -week_start_date)
new_data_iq$city <- 'iq'   # Use the same value (0) for all rows

View(new_data_iq)

new_data_iq <- as_data_frame(new_data_iq)
new_data_sj <- as_data_frame(new_data_sj)

View(new_data_iq)
View(new_data_sj)

write.csv(new_data_iq, file = "output/iq_data.csv")
write.csv(new_data_sj, file = "output/sj_data.csv")
