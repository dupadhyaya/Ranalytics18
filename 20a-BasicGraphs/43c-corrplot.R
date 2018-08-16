# some more advance graphs

#install corrplot
library(corrplot)
relationship=cor(mtcars)
relationship
corrplot(relationship, type = "upper", order = "hclust",  tl.col = "black", tl.srt = 45)

#install library
library("PerformanceAnalytics")
my_data <- mtcars[, c(1,3,4,5,6,7)]
chart.Correlation(my_data, histogram=TRUE, pch=19)


# Get some colors
col<- colorRampPalette(c("blue", "white", "red"))(20)
heatmap(x = res, col = col, symm = TRUE)

