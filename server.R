library(shiny)
shinyServer(function(input, output) {
  model1 <- lm(Sepal.Length ~ Petal.Length, data = iris)
  model1pred <- reactive({
  PLInput <- input$sliderPL
  predict(model1, newdata = data.frame(Petal.Length = PLInput))
  })
  
  output$plot1 <- renderPlot({
  PLInput <- input$sliderPL
  plot(iris$Petal.Length, iris$Sepal.Length, xlab = "Tamano petalo", 
  ylab = "Tamano tallo", bty = "n", pch = 16,
  xlim = c(0, 10), ylim = c(0, 10))
  if(input$showModel1){
      abline(model1, col = "red", lwd = 2)
  }
    
  legend(25, 250, c("Model 1 Prediction"), pch = 16, 
  col = c("red", "blue"), bty = "n", cex = 1.2)
  points(PLInput, model1pred(), col = "red", pch = 16, cex = 2)
  })
  
  output$pred1 <- renderText({
    model1pred()
  })
  
})