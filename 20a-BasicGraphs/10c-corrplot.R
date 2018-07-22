# some more advance graphs




library(corrplot)
res=cor(mtcars)
res
corrplot(res, type = "upper", order = "hclust", 
         tl.col = "black", tl.srt = 45)


library("PerformanceAnalytics")
my_data <- mtcars[, c(1,3,4,5,6,7)]
chart.Correlation(my_data, histogram=TRUE, pch=19)


# Get some colors
col<- colorRampPalette(c("blue", "white", "red"))(20)
heatmap(x = res, col = col, symm = TRUE)
