#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {


  calc <- eventReactive(input$goButton, {
    # Use an if statement to create a correction of 5 if gender is male and
    # -5 if gender is -5
    if(input$gender=="M") correction <- 5 else
      correction <- -5
    # Calculate height by adding the mother's height, the father's height and
    # the correction factor
    height <- (input$heightMother + input$heightFather + correction) / 2
    # Create values that the user will understand
    feet <- trunc(height / 12)
    inches <- round(height - feet * 12, 0)
    paste(paste("Your baby will be about ",feet," feet, ",inches," inches tall as an adult.",sep=""))
  })

  output$result <- renderText({
    calc()
  })




})
