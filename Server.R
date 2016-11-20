library(shiny)

shinyServer(function(input, output) {

        # a large table, showing variables of the diamonds
        output$mytable1 = renderDataTable({
                library(ggplot2)
                diamonds[, input$show_vars, drop = FALSE]
        })


})
