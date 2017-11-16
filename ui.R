library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Wind speed and direction from two Indiana state monitors."),
  sidebarPanel(
    sliderInput("range", "Range days:",
                min = 1, max = 365, value = c(1, 365)),
    
    selectInput("site", "Site:",
                list( "Petersburg" = "pr",
                      "Evansville" = "ev"))
),
  mainPanel(
    plotOutput("Plot")
    )
))