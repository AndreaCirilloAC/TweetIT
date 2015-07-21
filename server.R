shinyServer(function(input, output,session) {
  output$cloud <- renderPlot(
    keyword = input$selected_keyword,
    source("main.R",verbose =  TRUE),
    return(cloud)
    
  )
})