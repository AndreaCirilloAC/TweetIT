library(shiny)
library(shinyBS)
library(shinythemes)

shinyUI(navbarPage(theme = "bootstrap.css" ,id = "bar" ,
                   #HOME PANEL with Keywork selection and language setting  
                   tabPanel("home"
                            ),
                   tabPanel(HTML("TweetIT</a></li><li><a style='color:#3399FF' 
                                 href=\"https://it.linkedin.com/in/cirilloandrea\">by Andrea Cirillo</a>"),
                            fluidRow(
                              column(4),
                              column(4,
                            div(style = "text-align: center;",
                            textInput("selected_keyword",h3("input keyword to look for on Twitter")),
                            radioButtons("selected_language",
                                                   h3("select language"),
                                                   choices = c("italian","english"),
                                                   inline = FALSE)
                            
                            )
                            ),
                            column(4)),
                            fluidRow(
                            div(style = "text-align: center;",
                            bsButton("sentiment","sentimentIT",
                                     style = "default",size = "large")
                            )
                            ),
                            fluidRow(
                              div(style = "text-align: center;",
                                  h3( "wordcloud for the given keyword"),
                                  plotOutput("cloud"))
                            )
                                      ),
                   windowTitle = "TweetIT"
                                      )
                              )