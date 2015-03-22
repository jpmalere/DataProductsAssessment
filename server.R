library(forecast)

shinyServer(
    function(input, output) {
        output$plotForecast <- renderPlot({
            method <- input$select
            plot(gas, xlab='year', ylab='gas production',main='Australian monthly gas production: 1956-1995')            
            if (method == 1){
              lines(meanf(gas,24)$mean,col = 2, lwd = 3)   
              legend("topleft",lty=1,lwd = 3, col = 2, "Mean Value - Mean method")
            } else if (method == 2){
                lines(naive(gas,24)$mean,col = 3, lwd = 3)   
                legend("topleft",lty=1,lwd = 3, col = 3, "Mean Value - Naive method")
            } else if (method == 3){
                lines(snaive(gas,24)$mean,col = 4, lwd = 3)   
                legend("topleft",lty=1,lwd = 3,col = 4, "Mean Value - Seasonal Naive method")                
            } else if (method == 4){
                lines(rwf(gas,24,drift = TRUE)$mean,col = 5, lwd = 3)   
                legend("topleft",lty = 1,lwd = 3,col = 5, "Mean Value - Drift method")                
            }
        })

        output$text1 <- renderText({
            paste("You have selected: ", input$select)
        })
        
        output$method <- renderPrint({
            method <- input$select
            if (method == 1){
                summary(meanf(gas,24))   
             } else if (method == 2){
                summary(naive(gas,24))
            } else if (method == 3){
                summary(snaive(gas,24))   
            } else if (method == 4){
                summary(rwf(gas,24,drift = TRUE)) 
            }
        })
        
    }
)