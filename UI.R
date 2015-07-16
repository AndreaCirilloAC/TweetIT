library(shiny)
library(shinyBS)
library(shinythemes)

shinyUI(navbarPage(theme = "bootstrap.css" ,id = "bar" ,
                   #HOME PANEL     
                   tabPanel("home"
                            ),
                   tabPanel(HTML("TweetIT</a></li><li><a style='color:#3399FF' 
                                 href=\"https://it.linkedin.com/in/cirilloandrea\">by Andrea Cirillo</a>"),
                            h3(""),
                            textInput("selected_keyword",h3("input keyword to look for on Twitter")),
                                      radioButtons("selected_language",
                                                   "select language",
                                                   choices = c("italian","english"),
                                                   inline = TRUE)
                                      ),
                   windowTitle = "TweetIT"
                                      )
                              )