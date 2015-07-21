shinyServer(function(input, output,session) {
  #keyword <- reactive(input$selected_keyword)
  output$cloud <- renderPlot({
    keyword = input$selected_keyword
    
    source("main.R",verbose =  TRUE)
    
    return(cloud)

    })
})