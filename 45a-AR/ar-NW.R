# Interactive Association rule Analysis
#https://www.r-bloggers.com/interactive-association-rules-exploration-app/
library('devtools')
install_github('brooksandrew/Rsenal')
library('Rsenal')
?Rsenal::arulesApp
source_gist(id='706a28f832a33e90283b')
# Not Working Now - check after update
library('devtools')
library('shiny')
library('arules')
library('arulesViz')
source_gist(id='706a28f832a33e90283b')
