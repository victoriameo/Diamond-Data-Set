Diamond Slides
========================================================
author: Victoria Meo    
date: November 20, 1016
autosize: smaller

Diamond Data Set
========================================================

##### Dataset containing the prices and other attributes of almost 54,000 diamonds
##### Variables defined

- Price = the price in US Dollars 
- Carat = weight
- cut = quality (fair, good, Very Good Premium, Ideal)
- Colour = J worst, D best
- Clarity - how cear (I1 (worst), SI1, SI2, VS1, VS2, VVS1, VVS2, IF (best))
- x = length in mm (0--10.74)
- y = width in mm (0--58.9)
- z = depth in mm (0--31.8)
- depth = total depth percentage = z / mean(x, y) = 2 * z / (x + y) (43--79)
- table =  width of top relative to widest point (43--95)

Sample Data Set
========================================================


```r
library(ggplot2)
data("diamonds")
head(diamonds)
```

```
  carat       cut color clarity depth table price    x    y    z
1  0.23     Ideal     E     SI2  61.5    55   326 3.95 3.98 2.43
2  0.21   Premium     E     SI1  59.8    61   326 3.89 3.84 2.31
3  0.23      Good     E     VS1  56.9    65   327 4.05 4.07 2.31
4  0.29   Premium     I     VS2  62.4    58   334 4.20 4.23 2.63
5  0.31      Good     J     SI2  63.3    58   335 4.34 4.35 2.75
6  0.24 Very Good     J    VVS2  62.8    57   336 3.94 3.96 2.48
```
Code for Interactive Data Table
========================================================


```r
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
library(shiny)
shinyServer(function(input, output) {

        # a large table, showing variables of the diamonds
        output$mytable1 = renderDataTable({
                library(ggplot2)
                diamonds[, input$show_vars, drop = FALSE]
        })


})
```


Thank you 
========================================================

This presentation includes the definitions of the variables associated with the data set
It also includes a sample of the data
Finally is the code i used to create the slidy datable

This link below will take you to the actual datatable

https://victoriameo.shinyapps.io/DiamondDataProducts/

Hope you enjoy
