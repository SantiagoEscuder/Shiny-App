library(shiny)
shinyUI(fluidPage(
  titlePanel("Prediccion Iris"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderPL", "Tamano Petalo", 0, 10, value = 20),
      checkboxInput("showModel1", "Recta", value = TRUE),
      submitButton("Actualizar")
    ),
    mainPanel(
      plotOutput("plot1"),
      h3("Prediccion:"),
      textOutput("pred1"),
      h4("Se trata de un analisis de la base Iris. Por mas informacion ver: https://rpubs.com/moeransm/intro-iris "),
      h5("Presentacion disponible en: https://rpubs.com/sescuder/coursera_ejercicio")
      )
  )
))