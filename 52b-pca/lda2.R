# LDA 2
#https://www.r-bloggers.com/linear-discriminant-analysis-in-r-an-introduction/

library(devtools)
install_github("Displayr/flipStandardCharts")

library(flipMultivariates)
lda <- LDA(class ~ ., data = vehicles)

lda.2 <- LDA(class ~ COMPACTNESS + CIRCULARITY + DISTANCE.CIRCULARITY + RADIUS.RATIO,
             data = vehicles,
             output = "Scatterplot",
             prior = "Equal",
             subset = vehicles$ELONGATEDNESS < 50,
             weight = ifelse(vehicles$class == "saab", 2, 1))
