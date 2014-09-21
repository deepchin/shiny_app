library(shiny)
library(datasets)
library(ggplot2)

#Helper function to calculate the score for
#each car.The algorithm is simplistic -
#Multiply the feature value with the feature
#weight and add them to get the overall score.

rankcars <-  function(dinpt , input){
  score <- dinpt$mpg*(input$mlg) + 
    dinpt$cyl*(input$cln) +    
    dinpt$disp*(input$dsp) +
    dinpt$hp*(input$hpr) +    
    dinpt$drat*(input$drt) +
    dinpt$wt*(input$wgt) +    
    dinpt$qsec*(input$qsc) +
    dinpt$vs*(input$vsn) +    
    dinpt$am*(input$trn) +
    dinpt$gear*(input$ger) +    
    dinpt$carb*(input$crb)
  
  rcar <- data.frame(score)
  
  rownames(rcar) <- rownames(mtcars)
  
  rcar
}

# Define server logic 
shinyServer(function(input, output) {
  
  # Return the requested dataset
  
  datasetInput <- mtcars
 
  #get the x axis and y axis features from the 
  #user and generate the data frame for later use
  XYpairs <- reactive({ 
    
    datasetInput[,c(input$x_axis,input$y_axis)]
    
  })
  
  #create a table of the car scores and use a 
  #input variable to control the number of records to display.
  output$score <- renderTable({
    head(rankcars(datasetInput,input), n = input$obs)
  })
  
  #text string
  output$sidebartext <- renderText({
    "Choose weightage for different features below"
  })
  
  
  #text string
  output$sidebarNumInput <- renderText({
    "Choose number of records to display"
  })
  # Show the first "n" observations
  output$view <- renderTable({
    head(datasetInput, n = input$obs)
    
  })
  
  #This Image will provide a mapping of 
  #model vs score 
  output$myImage <- renderImage({
    # A temp file to save the output.
    # This file will be removed later by renderImage
    outfile <- tempfile(fileext='.png')
    
    # Generate the PNG
    png(outfile, width=800, height=500)
    
    
    scr<- rankcars(datasetInput,input)
    p <- qplot( scr[[1]],
                rownames(scr) , 
                data = scr , 
                color =  score ,
                geom= "point" ,
                size=I(5),
                xlab= "Score", 
                ylab="Model")  
    print(p)
    
    dev.off()
    
    # Return a list containing the filename
    list(src = outfile,
         contentType = 'image/png',
         width = 800,
         height = 500,
         alt = "alternate text")
  }, deleteFile = TRUE)
  
  
  
  output$myImage2 <- renderImage({
    # A temp file to save the output.
    # This file will be removed later by renderImage
    outfile <- tempfile(fileext='.png')
    
    # Generate the PNG
    png(outfile, width=600, height=300)
    
    
    
    
    # The factors with value labels will be required in the plot
    datasetInput$gear <- factor(datasetInput$gear,levels=c(3,4,5),
                                labels=c("3gears","4gears","5gears"))
    datasetInput$am <- factor(datasetInput$am,levels=c(0,1),
                              labels=c("Automatic","Manual"))
    datasetInput$cyl <- factor(datasetInput$cyl,levels=c(4,6,8),
                               labels=c("4cyl","6cyl","8cyl"))
    
    #Plot the x y pairs , user input is used
    #to determine the x axis and y axis variable
    qP <- qplot( XYpairs()[[1]], 
                 XYpairs()[[2]] ,
                 data=datasetInput,
                 color=am,
                 facets=gear~cyl, 
                 size=I(4),
                 xlab= input$x_axis, 
                 ylab=input$y_axis)  
    print(qP)    
    
    dev.off()
    
    list(src = outfile,
         contentType = 'image/png',
         width = 600,
         height = 300,
         alt = "This is alternate text")
  }, deleteFile = TRUE)
  
  
})



