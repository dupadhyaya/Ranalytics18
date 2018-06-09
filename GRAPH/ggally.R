
data(trees)
trees

library(GGally)
ggpairs(data=trees, columns=1:3, title="trees data")
fit_1  <- lm(Volume ~ Girth, data = trees) 
summary(fit_1) 
