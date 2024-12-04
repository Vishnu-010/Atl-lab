library(shiny)

# Define UI
ui <- fluidPage(
  titlePanel("SquaresFind"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput("number", "Enter a Number:", value = 1),
      actionButton("submit", "Calculate Square")
    ),
    
    mainPanel(
      textOutput("result")
    )
  )
)

# Define Server
server <- function(input, output) {
  observeEvent(input$submit, {
    output$result <- renderText({
      paste("The square of", input$number, "is", input$number^2)
    })
  })
}

# Run the application
shinyApp(ui = ui, server = server)









#---------------tree------------

# Install and load necessary packages

install.packages("rpart")

install.packages("rpart.plot")

library(rpart)

library(rpart.plot)



# Example dataset: Using the built-in iris dataset

data(iris)



# Create a decision tree model

# Predicting 'Species' based on 'Sepal.Length', 'Sepal.Width', 'Petal.Length', 'Petal.Width'

tree_model <- rpart(Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, data = iris)



# Print the tree model summary

print(tree_model)



# Visualize the decision tree using rpart.plot

rpart.plot(tree_model, 

           type = 3,          # Type of plot (type 3 gives the splits with text)

           extra = 102,       # Display additional info (e.g., probability of each class)

           under = TRUE,      # Underline the text labels

           box.palette = "RdYlGn",  # Color palette for boxes

           main = "Decision Tree for Iris Dataset") # Title of the plot



# Save the plot as a PNG file

png("decision_tree_iris.png", width = 800, height = 600)

rpart.plot(tree_model, 

           type = 3,

           extra = 102,

           under = TRUE,

           box.palette = "RdYlGn",

           main = "Decision Tree for Iris Dataset")

dev.off()  # Close the PNG device
