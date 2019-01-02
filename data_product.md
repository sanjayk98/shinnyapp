Shiny Application and Reproducible Pitch
========================================================
author: "Sanjay kumar"
date:  "01-Jan-2019"
autosize: true

Overview
========================================================

The goal of project is to provide intractive plot for stock price for following stocks based on data provided by <"https://stooq.com>.

- ORCL
- IBM
- AMZN

User Interface
========================================================
The interface provides user an ability to choose stock synbol and data range. Based on input selection, stock price trend is automationcally updated. Below is description of user input field
- Stock: User can select list of value among "ORCL","IBM" and "AMZN"
- Date Range: Calendar is prompted but user can also manually change year or date


Application Architecture (UI.R)
========================================================
The application uses shinny apps. It has two parts UI and Server


```r
library(shiny)
# Define UI for app that has sidebar pannel and main panel
ui <- fluidPage(
  
  # App title ----
  titlePanel("Stock Price Trend"),
  sidebarLayout(
    sidebarPanel(
      #input: stock selector
      selectInput("stock", "Choose stock:",list('ORCL','IBM','AMZN')
      ),
      # Input: date range selector
      dateRangeInput('dateRange',label = 'Date range input: yyyy-mm-dd',
                     start = Sys.Date() - 12000, end = Sys.Date()
      )
  ),
    mainPanel( # Output: linegraph ----
      plotOutput(outputId = "distPlot")
    )
)
)
```

Application Architecture (server.R)
========================================================


```r
server <- function(input, output) {
 
  stock <- reactive({
    switch(input$stock, "IBM" = IBM, "ORCL" = ORCL,  "AMZN"=AMZN
           )
  })
  
  output$distPlot <- renderPlot({
    data<-stock() %>% filter(Date >= as.Date(input$dateRange[1],'%Y-%m-%d'))
        ggplot(data,aes(Date,Close)) + geom_line(color="green", size=2)+geom_smooth()  + ylab("Stock Price")
    
  })
  
}
```
Reference
========================================================

code is published at github

  - https://github.com/sanjayk98/shinnyapp
 
Documentation is publsihed at RPub

  -http://rpubs.com/sanjayk98/455259

Application is published at shiniapp.io

  - https://sanjayk98.shinyapps.io/stockprice/
