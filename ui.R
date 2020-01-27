library(shinydashboard)
library(readr)
library(shiny)
read.csv(file = "./NYC_FerryData.csv")


shinyUI(dashboardPage(skin = "black",
    dashboardHeader(title = "Jae Ko",
        titleWidth = 350
        
    ),
    dashboardSidebar(
        width = 350,
        sidebarMenu(
            menuItem(`Start Station`, tabName = `start`),
            menuItem(`End Station`, tabName = `end`),
            menuItem(`Analysis`, tabName = `analysis`)
        )
        
    ),
    dashboardBody(
        tabItem(
            tabItem(tabName = `start`, 
                    fluidRow(
                        box(title = h3(`Top NYC Ferry Station`),
                            leafletOutput(`startmap`, height = 880)),
                        box(title = `Filter your station`),
                        sliderInput(inputId = `start_num`,
                                    label = `Number of Stations`,
                                    0,50,10))
            )
        ),
        tabItem(tabName = `end`,
                fluidRow(
                    box(title = h3(`NYC Ferry End Stations`),
                        leafletOutput(`end_num`,
                                      label = `Number of NYC End Stations`,
                                      0,50,10)),
                    box(title = `Top End Stations`, plotOutput(`top_end`)),
                    box(title = `Average Number From End Stations (people)`,
                        plotOutput(`avg_end`))
                    
                )
        ),
        tabItem(tabName = `analysis`,
                fluidRow(
                    box(title = h3(`Average Number of Riders in Months`),
                        plotOutput(`avg_months`)),
                    box(title = h3(`Average of Riders in Weeks`),
                        plotOutput(`ave_weeks`))
                )
                
        )    
        
    )))



























  










