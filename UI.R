library(shiny)
library(shinyBS)
library(shinythemes)

shinyUI(navbarPage(theme = "bootstrap.css" ,id = "bar" ,
                   #HOME PANEL     
                   tabPanel("home"
                        
                            ),
                   
                   tabPanel(HTML("TweetIT</a></li><li><a style='color:#3399FF' 
                                 href=\"https://it.linkedin.com/in/cirilloandrea\">by Andrea Cirillo</a>"),
                            
                            h3("here we are")
                           
                                     ),
                   
                   #SCRIPTS
                   
                  
                   windowTitle = "TweetIT"
                   
                              ))