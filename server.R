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
    #add reactive data information. Dataset = built in diamonds data
    dataset <- reactive({
        diamonds[sample(nrow(diamonds), input$sampleSize),]
    })
    
    output$trendPlot <- renderPlotly({
        
        # build graph with ggplot syntax
        p <- ggplot(dataset(), aes_string(x = input$x, y = input$y, color = input$color)) + 
            geom_point()
        
        
        ggplotly(p)
        
    })
})
