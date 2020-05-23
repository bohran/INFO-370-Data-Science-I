library(shiny)
library(shinythemes)
library(knitr)
my.ui <- shinyUI(navbarPage(theme = shinytheme("cerulean"), "Dengue Fever",
                   tabPanel("Overview",
                            
    mainPanel(
      includeHTML("overview.html")
    )
  ),
  tabPanel("Interactive Visualization",
           sidebarLayout(
             sidebarPanel(
               selectInput("select", label = h3("Select Content"),
                           choices = list("Total Cases" = 'total_cases', "Vegetation NE" = 'ndvi_ne', "Vegetation NW" = 'ndvi_nw', "Vegetation SE" = 'ndvi_se', "Vegetation SW" = 'ndvi_sw',"Precipitation" = 'precipitation_amt_mm',"Average Temp" = 'reanalysis_avg_temp_k'),
                           selected = 'year')
             ),
            
             mainPanel(
               plotOutput("distPlot")
             )
           )),
  tabPanel("Visualizations",
             mainPanel(
               includeHTML("visuals.html")
             )
           
  ),
  tabPanel("Statistical Modeling",
           mainPanel(
                 includeHTML("statisticalmodeling.html")
           )
           
  ),
  tabPanel("About the Project",
           mainPanel(
             includeHTML("documentation.html")
           )
  )
  
))
