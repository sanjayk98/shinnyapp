library(shiny)

# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Stock Price Trend"),
  sidebarLayout(
    sidebarPanel(
      selectInput("stock", "Choose stock:",
                  list('ORCL','IBM','AMZN')
      ),
      # Input: Slider for the number of bins ----
      dateRangeInput('dateRange',
                     label = 'Date range input: yyyy-mm-dd',
                     start = Sys.Date() - 12000, end = Sys.Date()
      )
  ),
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot")
      
    )
 

)
  

)
