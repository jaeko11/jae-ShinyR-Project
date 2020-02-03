shinyServer(function(input, output, session) {
    
 
    ferry_routes_selected = reactive({
        routes = ferry_dat_long %>%
            filter(name %in% input$ferry_routes) 
        routes
    })
    
    
    
    yearlyriderdata = reactive({
        routes = yearly_summary %>%
            filter(name %in% input$ferry_routes)
        routes
    })
    
    
   
    output$ferry_boxplots = renderPlot({
        ggplot(data = ferry_routes_selected(),
               aes(x = name,
                   y = weekly_total)) +
            geom_boxplot() +
            labs(x = "Ferry Route", y = "Total Number of Weekly Riders") +
            theme(axis.text.x = element_text(angle = 45, hjust=1)) +
            theme(axis.text = element_text(size = 10)) +
            theme_classic()
    })
    
    
    output$yearlyriderchart = renderPlot({
        ggplot(data = yearlyriderdata(),
               aes(x = "",
                   y = total_riders,
                   fill = name)) +
                   geom_bar(position = "fill", width = 3, stat = "identity") +
                   coord_polar("y", start = 0) +
            facet_wrap(~ Year)
               
               
    })
    
})
    
  
    
    
