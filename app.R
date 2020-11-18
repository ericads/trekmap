#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(readr)

# Define UI for application that draws a histogram
ui <- fluidPage(tags$style("body {background-color: black; }"),

    # Application title
    titlePanel("Star map"),


        # Show a plot of the generated distribution
        #mainPanel(
           plotlyOutput("test_plot")
        #)
    )


# Define server logic required to draw a histogram
server <- function(input, output) {
    
    trekData_test <- read_csv("trekData_test.csv", 
                              col_names = FALSE, 
                              col_types = cols(X1 = col_character()))
    
    output$test_plot <- renderPlotly({
        fig <- plot_ly(trekData_test,x = ~X3, y = ~X4, z = ~X5, type = "scatter3d", mode = "markers",
                marker = list(symbol = 'circle', sizemode = 'diameter', size = 2), 
                text = ~paste('Body:', X1,'<br>Location',X2),
                height = 800)
        axx <- list(
            backgroundcolor="rgb(200, 200, 230",
            gridcolor="rgb(255,255,255)",
            showbackground=TRUE,
            zerolinecolor="rgb(255,255,255",
            zeroline = FALSE,
            showline = FALSE,
            showticklabels = FALSE
        )
        
        axy <- list(
            backgroundcolor="rgb(230, 200,230)",
            gridcolor="rgb(255,255,255)",
            showbackground=TRUE,
            zerolinecolor="rgb(255,255,255",
            zeroline = FALSE,
            showline = FALSE,
            showticklabels = FALSE
        )
        
        axz <- list(
            backgroundcolor="rgb(230, 230,200)",
            gridcolor="rgb(255,255,255)",
            showbackground=TRUE,
            zerolinecolor="rgb(255,255,255",
            zeroline = FALSE,
            showline = FALSE,
            showticklabels = FALSE

        )
        
        fig %>% layout(scene = list(xaxis=axx,yaxis=axy,zaxis=axz))
        fig %>% layout(fig_bgcolor='rgb(0, 0, 0)',paper_bgcolor='rgb(0, 0, 0)',plot_bgcolor='rgb(0, 0, 0)')
        
        
    })

    
}

# Run the application 
shinyApp(ui = ui, server = server)
