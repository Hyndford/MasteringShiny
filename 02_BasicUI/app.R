
library(shiny)
library(reactable)

animals <- c("dog", "cat", "mouse", "bird", "other", "I hate animals")

ui <- fluidPage(
    # Text
    textOutput("text"),
    verbatimTextOutput("code"),
    textOutput("moretext"),
    verbatimTextOutput("print"),
    
    # Tables
    tableOutput("static"),
    dataTableOutput("dynamic"),
    
    # Plots
    plotOutput("plot", width = "400px"),
    
    # Downloads
    downloadButton("downbut"),
    downloadLink("downlink"),
    
    # Exercises
    verbatimTextOutput("ex11"),
    textOutput("ex12"),
    verbatimTextOutput("ex13"),
    verbatimTextOutput("ex14"),
    
    plotOutput("ex2", width = "700px", height = "300px"),
    
    dataTableOutput("ex3"),
    
    reactableOutput("ex4")
)

server <- function(input, output, session) {
    # Text
    output$text <- renderText("Hello friend!")
    output$code <- renderPrint(summary(1:10))
    output$moretext <- renderText("hello!")
    output$print <- renderPrint("hello!")
    
    # Tables
    output$static <- renderTable(head(mtcars))
    output$dynamic <- renderDataTable(mtcars, options = list(pageLength = 5))
    
    # Plots
    output$plot <- renderPlot(plot(1:5), res = 96)
    
    # Exercises
    output$ex11 <- renderPrint(summary(mtcars))
    output$ex12 <- renderText("Good morning!")
    output$ex13 <- renderPrint(t.test(1:5, 2:6))
    output$ex14 <- renderPrint(str(lm(mpg ~ wt, data = mtcars)))
    
    output$ex2 <- renderPlot(plot(sample(1:5, 5)), res = 96, alt = "Scatterplot of five random numbers")
    
    output$ex3 <- renderDataTable(cbind("car" = rownames(mtcars), mtcars),
        options = list(
            pageLength = 5,
            searching = FALSE,
            ordering = FALSE,
            lengthChange = FALSE
        )
    )
    
    output$ex4 <- renderReactable(reactable(mtcars, defaultPageSize = 5, sortable = FALSE))
}

shinyApp(ui, server)
