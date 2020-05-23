#Install packages
#install.packages("stringr")

# Load packages
library(dplyr)
library(stringr)

# Get functions for segregation metrics
setwd("~/INFO370/a2-bohran")

source('metric_functions.R')

filelocation <- file.path("~/INFO370/a2-bohran/data/prepped")

filenames <- list.files(path = filelocation, pattern = '.csv')

city.data <- lapply(file.path(filelocation,filenames),read.csv,stringsAsFactors = FALSE)

cities <- do.call("rbind", city.data)

city.names <- str_remove(filenames, "_race.csv")

metrics <- as.data.frame(cbind(City = city.names, Correlation_Index = lapply(city.data,correlation),
                               Isolation_Index = lapply(city.data, isolation), 
                               Dissimilarity_Index = lapply(city.data, dissimilarity), New_Index = lapply(city.data, new))) %>% 
  mutate(Correlation_Index = (as.numeric(Correlation_Index)), Isolation_Index = as.numeric(Isolation_Index),
         Dissimilarity_Index = as.numeric(Dissimilarity_Index),
         New_Index = as.numeric(New_Index))


corr_plot <- ggplot(data=metrics, aes(x=unlist(City), y=unlist(Correlation_Index), fill = unlist(City))) +
  geom_histogram(stat="identity") + ylab("Correlation") + xlab("City") + theme(axis.text.x=element_blank())

iso_plot <- ggplot(data=metrics, aes(x=unlist(City), y=unlist(Isolation_Index), fill = unlist(City))) +
  geom_histogram(stat="identity") + ylab("Isolation") + xlab("City") + theme(axis.text.x=element_blank())

diss_plot <- ggplot(data=metrics, aes(x=unlist(City), y=unlist(Dissimilarity_Index), fill = unlist(City))) +
  geom_histogram(stat="identity") + ylab("Dissimilarity") + xlab("City") + theme(axis.text.x=element_blank())

new_plot <- ggplot(data=metrics, aes(x=unlist(City), y=unlist(New_Index), fill = unlist(City))) +
  geom_histogram(stat="identity") + ylab("New Metric") + xlab("City") + theme(axis.text.x=element_blank())
                             