library(shiny)
library(datasets)
library(ggplot2)

shinyUI(
  
pageWithSidebar(
  headerPanel("Welcome"),
  sidebarPanel(
    tabsetPanel(
      tabPanel("Intro",
               includeMarkdown("Introduction.Rmd")
              ),
       tabPanel("DataSet", 
                selectInput(inputId="datasetChoice", label = h3("Pick an Engine Factor"),
                           choices = c("Cylinders" = 2, 
                                      "Piston Configuration"= 8, 
                                      "Automatic" = 9, 
                                      "No of Gears" = 10, 
                                      "No of Carboreteurs" = 11), 
                                      selected = 2 
                                            
                            ),
                selectInput(inputId="yaxis", label = h3("Pick a Performance Indicator"),
                            choices = c("Miles Per Gallon" = 1, 
                                        "Weight"= 6, 
                                        "Quarter Mile Time" = 7 
                                        ), 
                            selected = 1 
                            
                )
#                 selectInput(inputId="tableChoice", label = h3("Pick a Dataset"),
#                             choices = c("mtcars" = 1, 
#                                         "Weight"= 6, 
#                                         "Quarter Mile Time" = 7 
#                             ), 
#                             selected = 1 
#                             
#                 )
               
      ))),
  
  mainPanel(
    tabsetPanel(
#       tabPanel("Welcome", 
#         textOutput('text1')),
#       tabPanel("Button Counter", 
#         textOutput('text2')),
      tabPanel("Data Plot",
              plotOutput('plot1')
               ),
      tabPanel("Data Table", 
               tableOutput('table1')
        )
      
                ))#tabsetpanelandmainpanel

                )) #pagewithsidebarandshinyUI
