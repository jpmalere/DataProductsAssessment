shinyUI(pageWithSidebar(
    
    headerPanel(h2("Assessment - Data Products Coursera"),
    ),
    
    #helpText("test"),
    
    sidebarPanel(
        selectInput(inputId = "select", label = "Select the forecast method",
                    choices = list("1. Average Method" = 1,
                                   "2. Naive Method" = 2,
                                   "3. Seasonal Naive Method" = 3,
                                   "4. Drift Method" = 4)),    
        h4("Introduction"),
        p("This Shiny App is part of the Data Products course at Coursera."),
        p("It shows the mean value of four simple forecast algorithms for a R dataset (Australia Gas Production)."),
        p("The methods are:"),
        p("- Average Method;"),
        p("- Naive Method;"),
        p("- Seasonal Naive Method;"),
        p("- Drift Method;"),
        p(""),
        p("The predictions are for two years ahead."),
        p(""),
        h4("Average Method"),
        p("This method forecasts all future values as the mean of the historical data."),
        p(""),
        h4("Naive Method"),
        p("This method forecasts the future values as being equal to the value of the last observation."),
        p(""),
        h4("Seasonal Naive Method"),
        p("Each forecast is equal than the last observed value from the same seasonal period."),
        p(""),
        h4("Drift Method"),
        p("A variation of the naive method, where the forecasts are allowed to increase or decrease over time."),
        p(""),
        h4("Github link"),
        p("The Github link for this project is indicated below:"),
        a(href="https://github.com/jpmalere/DataProductsAssessment/","Repo Link"),
        p(""),
        h4("References"),
        p("Hyndman, R. J., Athanasopoulos, G. (2013) Forecasting: principles and practice. http://otexts.org/fpp/. Accessed on March 22nd 2015"),
        p("")
    ),
    mainPanel(
        plotOutput('plotForecast'),
        p(""),
        textOutput('text1'),
        p(""),
        verbatimTextOutput('method')
    )
))
