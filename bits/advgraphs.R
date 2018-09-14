#Advanced Graphs


library(corrgram)
cor(mtcars[1:4])
corrgram(mtcars[1:4], order=TRUE, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt,
         main="Car Milage Data in PC2/PC1 Order")


#alternative of box plot

boxplot(mpg ~ cyl, data=mtcars)


library(corrplot)
relationship=cor(mtcars)
relationship
corrplot(relationship)
corrplot(relationship, type="upper")

#-----

library(vioplot)
x1 <- mtcars$mpg[mtcars$cyl==4]
x2 <- mtcars$mpg[mtcars$cyl==6]
x3 <- mtcars$mpg[mtcars$cyl==8]
x1; x2; x3
vioplot(x1, x2, x3, names=c("4 cyl", "6 cyl", "8 cyl"), 
        col="gold")
title("Violin Plots of Miles Per Gallon")

