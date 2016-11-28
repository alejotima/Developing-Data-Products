library(shiny)
library(plotly)

data(diamonds, package = "ggplot2")
nms <- names(diamonds)

shinyUI(pageWithSidebar(
    headerPanel("Prices of 50,000 round cut diamonds"),
    sidebarPanel(
        sliderInput('sampleSize', 'Size diamonds', min = 1, max = nrow(diamonds),
                    value = 1000, step = 500, round = 0),
        selectInput('x', 'X', choices = nms, selected = "carat"),
        selectInput('y', 'Y', choices = nms, selected = "price"),
        selectInput('color', 'Color', choices = nms, selected = "clarity"),
        helpText(p("Move the scroll bar to adjust the diamonds to displayed, and the differentes selections for change the variables and color."), p("Plot Created on 27 Nov 2016 by Manuel Ramírez"),  p("This plot was created for Developing Data Products MOOC."))
    ),
    mainPanel(
        h2("Description"),
        p("A dataset containing the prices and other attributes of almost 54,000 diamonds."),
        strong("Give the plot a little time to load (the dataset is not small). You can also show/hide series by clicking them below the plot."),
        em("The data was obtained from ggplot2 diamonds data set:", a("http://docs.ggplot2.org/0.9.3.1/diamonds.html", href="http://docs.ggplot2.org/0.9.3.1/diamonds.html")),
        plotlyOutput('trendPlot', height = "500px")
    )
))
