library(ggplot2)
library(shiny)
library(dplyr)
library(tidyr)
library(knitr)

my.server <- shinyServer(function(input, output) {
  myData<-read.csv(file = 'output/OG_data_cases.csv', header = TRUE)
  myData %>% drop_na()
  View(myData)
  selectedData <- reactive({
    return(myData[myData$city %in% c(input$checkGroup),])
    cityChecked <- c(input$checkGroup)
    })
  output$distPlot <- renderPlot({
    ggplot(data = myData, aes_string(x='city', y=input$select)) +
      geom_col(aes_string(fill=input$cityChecked)) 
  })
  
  
  
})
