library(shinydashboard)
library(readr)
library(shiny)
library(leaflet)


shinyUI(dashboardPage(skin = "black",
    dashboardHeader(title = "Jae Ko",
        titleWidth = 350
        
    ),
   
    dashboardSidebar(
        width = 350,
        sidebarMenu(
            menuItem("Analysis", tabName = "analysis")
        )
        
    ),
    
   
    dashboardBody(
        
        tabItem(tabName = "analysis",
                fluidRow(
                    box(title = "Select the ferry routes to plot",
                       
                        checkboxGroupInput(inputId = "ferry_routes",
                                           label = "Select the ferry routes to plot",
                                           choices = list("East River" = "East.River",
                                                          "Rockaway" = "Rockaway",
                                                          "South Brooklyn" = "South.Brooklyn",
                                                          "Astoria" = "Astoria",
                                                          "Soundview" = "Soundview",
                                                          "Lower East Side" = "Lower.East.Side"),
                                           selected = unique(ferry_dat_long$name))),
                    
                    box(title = h3("Boxplot of Ferry Total Weekly Riders"),
                        plotOutput("ferry_boxplots")),

                    
                    box(title = h3("Proportion of riders yearly"),
                        plotOutput("yearlyriderchart"))
                   
                    
                    
                )
                
        )
        
    )))    
                    
                    
                    
                    
                
                
          
        
    



























  










