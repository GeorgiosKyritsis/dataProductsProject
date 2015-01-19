library(shiny)
library(ggplot2) # for the diamonds dataset
shinyUI(fluidPage(
  titlePanel('Examples of Probability Distributions'),
  sidebarLayout(
    sidebarPanel(
      conditionalPanel(
        'input.dataset === "Normal Distribution"',
        sliderInput("slider1", label = h4("Mean"), min = 0, 
                    max = 50, value = 13),
      sliderInput("slider2", label = h4("Standard Deviation"), min = 1, 
                  max = 10, value = 3),
      sliderInput("range", label = h4("Range"),
                    min = 0, max = 100, value = c(0,30)),
      radioButtons("radio1", label = h4("Choose the color"),
                   c("Red", "Green", "Blue"), inline = TRUE),
      radioButtons("radio2", label = h4("Choose the width"),
                   c("Thin", "Medium", "Thick"), inline = TRUE),
      p("For more information visit the",
        a("Wikipedia's page.", 
          href = "http://en.wikipedia.org/wiki/Normal_distribution"))
        
      ),
      conditionalPanel(
        'input.dataset === "Exponential"',
        sliderInput("slider3", label = h4("Rate"), min = 0, 
                    max = 4, value = 1, step = 0.1),
        sliderInput("range2", label = h4("Range"),
                    min = 0, max = 100, value = c(0,30)),
        radioButtons("radio3", label = h4("Choose the color"),
                     c("Red", "Green", "Blue"), inline = TRUE),
        radioButtons("radio4", label = h4("Choose the width"),
                     c("Thin", "Medium", "Thick"), inline = TRUE),
        p("For more information visit the",
          a("Wikipedia's page.", 
            href = "http://en.wikipedia.org/wiki/Exponential_distribution"))
      ),
      conditionalPanel(
        'input.dataset === "t Distribution"',
        sliderInput("slider4", label = h4("Degrees of Freedom"), min = 1, 
                    max = 200, value = 3),
        radioButtons("radio5", label = h4("Choose the color"),
                     c("Red", "Green", "Blue"), inline = TRUE),
        radioButtons("radio6", label = h4("Choose the width"),
                     c("Thin", "Medium", "Thick"), inline = TRUE),
        p("For more information visit the",
          a("Wikipedia's page.", 
            href = "http://en.wikipedia.org/wiki/Student%27s_t-distribution"))
      ),
      conditionalPanel(
        'input.dataset === "Binomial Distribution"',
        sliderInput("slider5", label = h4("Number of Trials"), min = 1, 
                    max = 200, value = 3),
        sliderInput("slider6", label = h4("Probability of success for a single trial"), min = 0, 
                    max = 1, value = 0.5, step = 0.1),
        radioButtons("radio7", label = h4("Choose the color"),
                     c("Red", "Green", "Blue"), inline = TRUE),
        radioButtons("radio8", label = h4("Choose the width"),
                     c("Thin", "Medium", "Thick"), inline = TRUE),
        p("For more information visit the",
          a("Wikipedia's page.", 
            href = "http://en.wikipedia.org/wiki/Binomial_distribution"))
      ),
      conditionalPanel(
        'input.dataset === "Beta Distribution"',
        sliderInput("slider7", label = h4("alpha"), min = 0.1, 
                    max = 10, step = 0.1, value = 1),
        sliderInput("slider8", label = h4("beta"), min = 0.1, 
                    max = 10, value = 1, step = 0.1),
        radioButtons("radio9", label = h4("Choose the color"),
                     c("Red", "Green", "Blue"), inline = TRUE),
        radioButtons("radio10", label = h4("Choose the width"),
                     c("Thin", "Medium", "Thick"), inline = TRUE),
        p("For more information visit the",
          a("Wikipedia's page.", 
            href = "http://en.wikipedia.org/wiki/Beta_distribution"))
      ),
      conditionalPanel(
        'input.dataset === "Gamma Distribution"',
        sliderInput("slider9", label = h4("shape"), min = 0.1, 
                    max = 10, step = 0.1, value = 1),
        sliderInput("slider10", label = h4("scale"), min = 0.1, 
                    max = 10, value = 1, step = 0.1),
        radioButtons("radio11", label = h4("Choose the color"),
                     c("Red", "Green", "Blue"), inline = TRUE),
        radioButtons("radio12", label = h4("Choose the width"),
                     c("Thin", "Medium", "Thick"), inline = TRUE),
        p("For more information visit the",
          a("Wkipedia's page.", 
            href = "http://en.wikipedia.org/wiki/Gamma_distribution"))
      ),
      conditionalPanel(
        'input.dataset === "Poisson Distribution"',
        sliderInput("slider11", label = h4("lambda"), min = 0.1, 
                    max = 10, step = 0.1, value = 1),
        radioButtons("radio13", label = h4("Choose the color"),
                     c("Red", "Green", "Blue"), inline = TRUE),
        radioButtons("radio14", label = h4("Choose the width"),
                     c("Thin", "Medium", "Thick"), inline = TRUE),
        p("For more information visit the",
          a("Wikipedia's page.", 
            href = "http://en.wikipedia.org/wiki/Poisson_distribution"))
      ),
      conditionalPanel(
        'input.dataset === "Geometric Distribution"',
        sliderInput("slider12", label = h4("Probability"), min = 0, 
                    max = 1, step = 0.1, value = 0.2),
        radioButtons("radio15", label = h4("Choose the color"),
                     c("Red", "Green", "Blue"), inline = TRUE),
        radioButtons("radio16", label = h4("Choose the width"),
                     c("Thin", "Medium", "Thick"), inline = TRUE),
        p("For more information visit the",
          a("Wikipedia's page.", 
            href = "http://en.wikipedia.org/wiki/Geometric_distribution"))
      )
    ),
    mainPanel(
      tabsetPanel(
        id = 'dataset',
        tabPanel('Normal Distribution', plotOutput('myplot1')),
        tabPanel('Exponential', plotOutput('myplot2')),
        tabPanel('t Distribution', plotOutput('myplot3')),
        tabPanel('Binomial Distribution', plotOutput('myplot4')),
        tabPanel('Beta Distribution', plotOutput('myplot5')),
        tabPanel('Gamma Distribution', plotOutput('myplot6')),
        tabPanel('Poisson Distribution', plotOutput('myplot7')),
        tabPanel('Geometric Distribution', plotOutput('myplot8'))
      )
    )
  )
))