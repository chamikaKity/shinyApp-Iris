library(shiny)

shinyUI(fluidPage(
        
        titlePanel("Prediction of Species from Petal Length and Petal Width"),
        
        p(strong("Description")),
        p("The famous (Fisher's or Anderson's)", span("iris",style="font-family:monospace"),
          "data set gives the measurements",
          "in centimeters of the variables sepal length and width and petal length and width,",
          "respectively, for 50 flowers from each of 3 species of iris.",
          "The species are Iris setosa, versicolor, and virginica."),
        
        p("This application uses variables", span("Species, Petal.Length",style="font-family:monospace"),
          "and",span("Petal.Width",style="font-family:monospace"), 
          "data from the", span("iris",style="font-family:monospace"), "dataset to",
          "predict the category (",span("Species",style="font-family:monospace"),
          ") using a randomforest model as follows.",
          div("randomForest(Species~Petal.Length+Petal.Width, data=iris)",style="font-family:monospace")),
        
        p(strong("How to use")),
        p("Select values for", span("Petal.Length",style="font-family:monospace"), "and"
          , span("Petal.Width",style="font-family:monospace"), 
          "using the sliders on the left,","and click", strong("submit."),
          "You will see the chosen input displayed as a blue",
          "circle on the figure and the predicted category below the figure."),
        
        p(strong("Github link for server.R and ui.R code:"),
          a("https://github.com/chamikaKity/shinyApp-Iris",
            href="https://github.com/chamikaKity/shinyApp-Iris")),
       
        
        sidebarLayout(
                sidebarPanel(
                        sliderInput("sliderPetalLength", "What is the Petal.Length?", 0.9, 7.1, value = 4),
                        sliderInput("sliderPetalWidth", "What is the Petal.Width?", 0.1, 2.5, value = 1.5),
                        submitButton("Submit")
                ),
                
                mainPanel(
                        plotOutput("Plot1"),
                        h3("Predicted species from the fitted randomforest model:"),
                        textOutput("Pred1")
                )
        )
))
