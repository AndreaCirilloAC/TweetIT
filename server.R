shinyServer(function(input, output,session) {
  
  output$cloud <- renderPlot({
    if (input$sentiment & input$selected_keyword != "") 
    {
    keyword = input$selected_keyword
    
    source("main.R",verbose =  TRUE)
    
    return(cloud)
    }else
      return()
    })
})