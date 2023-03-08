
library(shiny)

animals <- c("dog", "cat", "mouse", "bird", "other", "I hate animals")

ui <- fluidPage(
    # Free Text
    textInput("name", "What's your name?"),
    passwordInput("password", "What's your password?"),
    textAreaInput("story", "Tell me about yourself", rows = 3),
    
    # Numeric
    numericInput("num", "Number one", value = 0, min = 0, max = 100),
    sliderInput("num2", "Number two", value = 50, min = 0, max = 100),
    sliderInput("rng", "Range", value = c(10, 20), min = 0, max = 100),
    
    # Dates
    dateInput("dob", "When were you born?"),
    dateRangeInput("holiday", "When do you want to go on vacation next?"),
    
    # Limited Choices
    selectInput("state", "What's your favourite state?", state.name),
    radioButtons("animal", "What's your favourite animal?", animals),
    radioButtons("rb", "Choose one:",
        choiceNames = list(
            icon("angry"),
            icon("smile"),
            icon("sad-tear")
        ),
        choiceValues = list("angry", "happy", "sad")
    ),
    selectInput(
        "state", "What's your favourite state?", state.name,
        multiple = TRUE
    ),
    checkboxGroupInput("animal", "What animals do you like?", animals),
    checkboxInput("cleanup", "Clean up?", value = TRUE),
    checkboxInput("shutdown", "Shutdown?"),
    
    # File Uploads
    fileInput("upload", NULL),
    
    # Action Buttons
    actionButton("click", "Click me!"),
    actionButton("drink", "Drink me!", icon = icon("cocktail")),
    actionLink("drink", "More drinks!", icon = icon("cocktail")),
    fluidRow(
        actionButton("click", "Click me!", class = "btn-danger"),
        actionButton("drink", "Drink me!", class = "btn-lg btn-success"),
        actionLink("drink", "More drinks!",
            icon = icon("cocktail"), class = "btn-lg btn-success")
    ),
    fluidRow(
        actionButton("eat", "Eat me!", class = "btn-block"),
        actionLink("eat", "More eat!", class = "btn-block", style = "text-align: center")
    ),
    
    # Exercises
    textInput("name", NULL, placeholder = "Your name"),
    sliderInput("date", "When should we deliver?",
        value = as.Date("2020-09-17"), min = as.Date("2020-09-16"), max = as.Date("2020-09-23")),
    sliderInput("number", NULL, value = 10, min = 0, max = 100, step = 5, animate = TRUE),
    selectInput(
        "number", "High or Low?",
        choices = list("High" = list("11", "22", "33"), "Low" = list("1", "2", "3"))
    )
)

server <- function(input, output, session) {
    
}

shinyApp(ui, server)
