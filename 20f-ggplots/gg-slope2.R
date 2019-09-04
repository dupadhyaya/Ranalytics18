#ggplot - slope graph
#https://rdrr.io/github/leeper/slopegraph/man/ggslopegraph.html
#https://github.com/leeper/slopegraph
#https://rdrr.io/github/leeper/slopegraph/man/
require("ggplot2")
library(ggslopegraph) #na from CRAN
install.packages("remotes")
remotes::install_github("leeper/slopegraph", force=T)

#---------------
library("slopegraph")
data(cancer)
## Tufte's Cancer Graph (to the correct scale)
data(cancer)
cancer
ggslopegraph(cancer, col.lines = 'gray',  xlabels = c('5 Year','10 Year','15 Year','20 Year'))

## Tufte's GDP Graph
data(gdp)
ggslopegraph(gdp, col.line='gray', xlabels = c('1970','1979'),              main = 'Current Receipts of Goverment\nas a Percentage of Gross Domestic Product') + 
  theme_bw()

## Ranking of U.S. State populations
data(states)
ggslopegraph(states,  main = 'Relative Rank of U.S. State Populations, 1790-1870',  yrev = TRUE)

cls <- rep("black", nrow(states))
cls[rownames(states) == "South Carolina"] <- "red"
cls[rownames(states) == "Tennessee"] <- "blue"
ggslopegraph(states, main = 'Relative Rank of U.S. State Populations, 1790-1870', yrev = TRUE, col.lines = cls, col.lab = cls)

## ranking of U.S. Bachelors Degrees fields
data(bachelors)
bachelors[] <- lapply(bachelors, function(x) rank(x))
names(bachelors) <- substring(names(bachelors), 3, 7)
ggslopegraph(bachelors, offset.x = 0, xlim = c(1, 25), col.num = NA, labpos.left = NULL)


#
slopegraph(gdp, col.lines = 'gray', col.lab = "black", xlabels = c('1970','1979'),   main = 'Current Receipts of Goverment as a Percentage of Gross Domestic Product')


#
data(states)
cols <- `[<-`(rep("black", 37), 7, "red")
slopegraph(states, xlim = c(-1, 12), ylim = c(37,0), offset.x = 0.06,           col.lines = cols, col.lab = cols,            main = 'Relative Rank of U.S. State Populations, 1790-1870')


#---
data(states)
cols <- `[<-`(rep("black", 37), 7, "red")
ggslopegraph(states, offset.x = 0.06, yrev = TRUE,
             col.lines = cols, col.lab = cols, 
             main = 'Relative Rank of U.S. State Populations, 1790-1870') +
  theme_bw()   




#Slope Graph 2----------------------
# basic graph
ggslopegraph2(cancer2, Year, Survival, Type,  title = "Estimates of Percent Survival Rates")

# with further customization
ggslopegraph2(cancer2, Year, Survival, Type, title = "Estimates of Percent Survival Rates",   linecolor = "black",      linethickness = 1,  subtitle = NULL,   caption = NULL)

# demonstrating linecolor recyclng
ggslopegraph2(cancer2, Year, Survival, Type, 
title = "Estimates of Percent Survival Rates", subtitle = "Based on: Edward Tufte, Beautiful Evidence, 174, 176.",  caption = "DU",          linecolor = c("black", "red", "grey"), linethickness = .5)
#https://rdrr.io/github/leeper/slopegraph/man/ggslopegraph2.html

#---- segment
data(gdp)
gdp
head(segmentize(gdp))
segmentize(gdp)
