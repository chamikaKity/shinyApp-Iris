library(shiny)

shinyUI(fluidPage(
        
        titlePanel("Prediction of Species from Petal Length and Petal Width"),
        
        p(strong("Description")),
        p("This famous (Fisher's or Anderson's) iris data set gives the measurements",
          "in centimeters of the variables sepal length and width and petal length and width,",
          "respectively, for 50 flowers from each of 3 species of iris.",
          "The species are Iris setosa, versicolor, and virginica."),
        
        p("The application uses variables", strong("Species, Petal.Length"), "and",
          strong("Petal.Width"), "data from the", strong("iris"), "dataset to",
          "predict the category using a randomforest model as follows.",
          strong("randomForest(Species~Petal.Length+Petal.Width, data=iris)")),
        
        p(strong("How to use")),
        p("Select values for", strong("Petal.Length"), "and", strong("Petal.Width"), 
          "using the sliders on the left,","and click", strong("submit."),
          "You will see the chosen input displayed as a blue",
          "circle on the figure and the predicted category below the figure."),
        
        p(strong("Github link for server.R and ui.R code:"),
          a("https://github.com/chamikaKity/shinyApp-Iris")),
        
        
        
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
