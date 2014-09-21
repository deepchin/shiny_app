library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Develop data product - Project"),
  
  # Sidebar with controls to select a dataset and specify the
  # number of observations to view
  sidebarLayout(
    sidebarPanel(
      # Select the x axis , and y axis variables to plot
      
      selectInput("x_axis", "Choose X axis variable:", 
                  choices = c("cyl", "vs" ,  "am" ,  "gear" ,"carb")),

      
      selectInput("y_axis", "Choose Y axis variable:", 
                  choices=c("mpg" , "disp" , "hp" ,  "drat" ,"wt"  , "qsec")),

      
      
      verbatimTextOutput("sidebartext") ,
#get the users weightage on the following features
      #"mpg"  "cyl"  "disp" "hp"   "drat" "wt"   "qsec" 
      #"vs"   "am"   "gear" "carb"
      sliderInput("mlg",
                  "weightage on MPG",
                  min = 1,
                  max = 10,
                  value = 1),      
      
      sliderInput("cln",
                  "weightage on number of cylinder",
                  min = 1,
                  max = 3,
                  value = 1),

      sliderInput("dsp",
                  "weightage on engine displacement",
                  min = 1,
                  max = 10,
                  value = 1),
      

      sliderInput("hpr",
                  "weightage on horsepower",
                  min = 1,
                  max = 10,
                  value = 1),
      
      
      sliderInput("drt",
                  "weightage on drat",
                  min = 1,
                  max = 10,
                  value = 1),      
      
      sliderInput("wgt",
                  "weightage on Car weight",
                  min = 1,
                  max = 10,
                  value = 1),
      
      sliderInput("qsc",
                  "weightage on Acceleration",
                  min = 1,
                  max = 10,
                  value = 1),
      
      
      sliderInput("vsn",
                  "weightage on Vision",
                  min = 1,
                  max = 2,
                  value = 1),
      
      
      sliderInput("trn",
                  "weightage on Manual/Automatic transmission",
                  min = 1,
                  max = 2,
                  value = 1),      
      
      sliderInput("ger",
                  "weightage on number of Gears",
                  min = 1,
                  max = 3,
                  value = 1),
      
      sliderInput("crb",
                  "weightage on carb",
                  min = 1,
                  max = 10,
                  value = 1),
      

      verbatimTextOutput("sidebarNumInput") ,
      numericInput("obs", "Number of observations to view:", 2)
    ),
    
    # Show a summary of the dataset and an HTML table with the 
    # requested number of observations
    mainPanel(
      
       imageOutput("myImage2"),
        
       imageOutput("myImage") ,

       tableOutput("view")
    )
  )
))

