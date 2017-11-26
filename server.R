library(shiny)
library(randomForest)

shinyServer(function(input, output) {
        
        Model1 <- randomForest(Species~Petal.Length+Petal.Width, data=iris)
        
        Model1Pred <- reactive({
                PetalLengthInput <- input$sliderPetalLength
                PetalWidthInput <- input$sliderPetalWidth
                predict(Model1, newdata=data.frame(Petal.Length=PetalLengthInput,
                                                   Petal.Width=PetalWidthInput))
        })
        
        output$Plot1 <- renderPlot({
                PetalLengthInput <- input$sliderPetalLength
                PetalWidthInput <- input$sliderPetalWidth
                plot(iris$Petal.Length, iris$Petal.Width, col=iris$Species,
                     xlab = "Petal.Length", ylab = "Petal.Width")
                
                legend("bottomright", legend =c("Setosa","Versicolor","Virginica"), pch=16,
                       col=c("black","red","green"), cex=1.2)
                
                points(PetalLengthInput, PetalWidthInput, col="blue", pch=19, cex=2)
        })
        
        output$Pred1 <- renderText({
                as.character(Model1Pred())
        })
        
})
