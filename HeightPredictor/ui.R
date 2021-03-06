#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Baby Height Predictor"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      radioButtons("gender", "Baby's gender:",
                   c("Female" = "F",
                     "Male" = "M")),
      sliderInput("heightMother",
                  label = "How tall is the mother in inches?",
                  min = 50, max = 85, value = 0),
      sliderInput("heightFather",
                  label = "How tall is the father in inches?",
                  min = 50, max = 85, value = 0),
      actionButton("goButton", "Calculate", icon("refresh"))
    ),

    # Show a plot of the generated distribution
    mainPanel(
      h4("Can't wait to see how tall your child will be as an adult? Use the height calculator to find out. Simply enter the values in the side panel and press the \"Calculate\" button. The result will be shown below."),
      helpText(a("See github page for details about server calculations and code",
                 href="https://github.com/peggylind/week4-shiny",
                 target="_blank")
      ),
      textOutput("result")
    )
  )
))
