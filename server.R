library(shiny)
shinyServer(function(input, output) {
  #Normal Distribution
  output$myplot1 <- renderPlot({
    x = seq(input$range[1], input$range[2], 0.001)
    y = dnorm(x, as.numeric(input$slider1), as.numeric(input$slider2))
    plot(x,y, type ='l', col= switch(input$radio1, Red = 'red', Green = 'green', Blue = 'blue'), ylim = c(0, 0.4),
         main = paste('Probability Density Function, mean =',input$slider1, ", sd=", input$slider2), ylab = 'Probability Density',
         lwd = switch(input$radio2, 'Thin' = 1, Medium = 3, Thick = 10))
  })
  #Exponential
  output$myplot2 <- renderPlot({
    x = seq(input$range2[1], input$range2[2], 0.001)
    y=dexp(x,rate=input$slider3)
    plot(x,y,type = 'l', col= switch(input$radio3, Red = 'red', Green = 'green', Blue = 'blue'), ylim=c(0,2),
         main = paste('Probability Density Function, rate =',input$slider3), ylab = 'Probability Density',
         lwd = switch(input$radio4, 'Thin' = 1, Medium = 3, Thick = 10))
  }) 
  # t Distribution
  output$myplot3 <- renderPlot({
    x = seq(-4, 4, 0.001)
    y=dt(x,df=input$slider4)
    plot(x,y,type = 'l', col= switch(input$radio5, Red = 'red', Green = 'green', Blue = 'blue'), 
         main=paste('Probability Density Function, mean = 0, sd = 1, degrees of freedom =',input$slider4),
         ylab = 'Probability Density', lwd = switch(input$radio6, 'Thin' = 1, Medium = 3, Thick = 10))
  })
  #Binomial Distribution
  output$myplot4 <- renderPlot({
    x = seq(0, input$slider5, 1)
    y=dbinom(x, input$slider5, input$slider6)
    plot(x,y,type = 'o', col= switch(input$radio7, Red = 'red', Green = 'green', Blue = 'blue'), main = paste('Probability Mass Function, Number of Trials=', input$slider5,', Probability of success on each trial=', input$slider6),
         ylab = 'Probability', lwd = switch(input$radio8, 'Thin' = 1, Medium = 3, Thick = 10))
  })
  #Beta Distribution
  output$myplot5 <- renderPlot({
    x = seq(0, 1, 0.001)
    y=dbeta(x, input$slider7, input$slider8)
    plot(x,y,type = 'l', col= switch(input$radio9, Red = 'red', Green = 'green', Blue = 'blue'),
         main = paste('Probability Density Function, alpha =', input$slider7, 'beta =', input$slider8), 
         ylab = 'Probability Density', ylim = c(0, 4), lwd = switch(input$radio10, 'Thin' = 1, Medium = 3, Thick = 10))
  })
  #Gamma Distribution
  output$myplot6 <- renderPlot({
    x = seq(0, 20, 0.001)
    y=dgamma(x, input$slider9, input$slider10)
    plot(x,y,type = 'l', col= switch(input$radio11, Red = 'red', Green = 'green', Blue = 'blue'), ylim = c(0, 2),
         main = paste('Probability Density Function, shape =', input$slider9, ', scale =', input$slider10),
         ylab = 'Probability Density', lwd = switch(input$radio12, 'Thin' = 1, Medium = 3, Thick = 10))
  })
  #Poisson Distribution
  output$myplot7 <- renderPlot({
    x <- seq(0,20, by = 1)
    y <- dpois(x, lambda = input$slider11)
    plot(x, y, type ='o', ylim = c(0, 0.4),
         main = paste('Probability Mass Function, lambda =', input$slider11), ylab = 'Probability',
         col= switch(input$radio13, Red = 'red', Green = 'green', Blue = 'blue'),
         lwd = switch(input$radio14, 'Thin' = 1, Medium = 3, Thick = 10))
  })
  #Geometric Distribution
  output$myplot8 <- renderPlot({
    x <- seq(0,10, by = 1)
    y <- dgeom(x, p = input$slider12)
    plot(x, y, type ='o', ylim = c(0, 1),
         main = paste('Probability Mass Function, probability of success in each trial =', input$slider12),
         ylab = 'Probability', col= switch(input$radio15, Red = 'red', Green = 'green', Blue = 'blue'),
         lwd = switch(input$radio16, 'Thin' = 1, Medium = 3, Thick = 10))
  })
})