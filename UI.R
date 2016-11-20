library(shiny)
library(ggplot2)

shinyUI(pageWithSidebar(
        headerPanel('Diamond Data Table'),
        sidebarPanel(
                checkboxGroupInput('show_vars',
                                   'Colums in diamond table to be shown',
                                   names(diamonds),
                                   selected = names(diamonds)),
                helpText('Note: You can choose what columns are shown in the table by checking the box.')
        ),
        mainPanel(
                h3(textOutput("Diamonds")),
                dataTableOutput("mytable1")
        )
))










