library(shiny)
library(shinythemes)

#Define UI
ui<-fluidPage(theme=shinytheme("superhero"),
      navbarPage(
        "My first app",
        tabPanel("Navbar 1",
                 sidebarPanel(
                   tags$h3("Input:"),
                   textInput("txt1","Given Name:",""), #txt1 will be sent to the server
                   textInput("txt2","Surname:",""),    #txt2 will be sent to the server
                 ),
                 mainPanel(
                   h1("Header 1"),
                   h3("Output 1"),
                   verbatimTextOutput("txtout"), #txtout is generated from the server
                   
                 ) #mainPanel
      ), #Navbar 1, tabPanel
      tabPanel("Navbar 2","This panel is intentionally left blank"),
      tabPanel("Navbar 3", "This pannel is intetionally left blank")
      ) #navbarPage
) #fluidPage

  #Define server function
  server <- function(input,output) {
    output$txtout<-renderText({
      paste(input$txt1,input$txt2,sep=" ")
    })
  }
  