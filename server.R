library(shiny)
library(datasets)
library(ggplot2)

welcome <<- "Welcome"
House <<- "Of House"


shinyServer(
  
  function(input, output){
    
    
    output$text1 <- renderText({
      if(input$goButton == 0) "Stranger"
      else  isolate (paste(input$text1, House, input$text2))
  
  })
   output$text2 <- renderText({
     if(input$goButton == 0) "You haven't pressed the button yet!"
     else  input$goButton
         
   })
  
#   datasetChoice <<- as.numeric(input$datasetChoice)
#   
#   output$table1 <- 
#     if(datasetChoice == 1) renderTable({mtcars})
#     else (datasetChoice == 2) renderTable({ChickWeight})
#     else renderTable({Trees})

output$plot1 <- renderPlot({
          datatable <<- as.numeric(input$datasetChoice)
          names(mtcars) <- c("Miles Per Gallon", "Cylinders", "Displacement", "HorsePower", "Drat", "Weight (tonnes)", "Quarter Mile Time", "Piston Configuration", "Automatic", "No. of Gears", "No. of Carburetors")
          yvar <<- as.numeric(input$yaxis)
          datatablenames <- names(mtcars)
          title <- paste("Boxplot of", datatablenames[datatable], "against", datatablenames[yvar])
          ggplot(mtcars, aes(factor(mtcars[,datatable]), mtcars[,yvar])) +
                  geom_boxplot(aes(fill=factor(mtcars[,datatable]))) +
                  xlab(names(mtcars)[datatable]) +
                  ylab(names(mtcars)[yvar]) +
                  ggtitle(paste0(title)) +
                  guides(fill=FALSE)
                      })

output$table1 <- renderTable({
                  datatable <- as.numeric(input$datasetChoice)
                  yvar <- as.numeric(input$yaxis)
                  mtcars[,c(datatable, yvar)]
  
                            })
                               
  })
