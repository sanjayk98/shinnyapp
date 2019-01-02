library(ggplot2)
library(plotly)
library(webshot)
library(htmlwidgets)
# Define server logic required to draw a histogram ----
#ORCL<-read.csv("https://stooq.com/q/d/l/?s=ORCL.US&i=d")
ORCL<-read.csv("https://www.dropbox.com/s/0dxa7rw0da3dxfs/orcl_us_d.csv?dl=1")
ORCL$Date<-as.Date(ORCL$Date)
ORCL<-data.frame(ORCL[,c(1,5)])

IBM<-read.csv("https://www.dropbox.com/s/0whqhjwaa948pgd/ibm_us_d.csv?dl=1")
IBM$Date<-as.Date(IBM$Date)
IBM<-data.frame(IBM[,c(1,5)])
#orcl<-data.frame(orcl)

AMZN<-read.csv("https://www.dropbox.com/s/27phyqfrzf1okxl/amzn_us_d.csv?dl=1")
AMZN$Date<-as.Date(AMZN$Date)
AMZN<-data.frame(AMZN[,c(1,5)])

server <- function(input, output) {
 
  stock <- reactive({
    switch(input$stock,
           "IBM" = IBM,
           "ORCL" = ORCL,
            "AMZN"=AMZN
           )
  })
  
  output$distPlot <- renderPlot({
   
    data<-stock() %>% filter(Date >= as.Date(input$dateRange[1],'%Y-%m-%d'))
        ggplot(data,aes(Date,Close)) + geom_line(color="green", size=2)+geom_smooth()  + ylab("Stock Price")
    
  })
  
}