#text in graphs

#Text can be added to graphs using the text( ) and mtext( ) functions. text( ) places text within the graph while mtext( ) places text in one of the four margins.

text(location, "text to place", pos, ...)
mtext("text to place", side, line=n, ...)

# Example of labeling points
attach(mtcars)
plot(wt, mpg, main="Milage vs. Car Weight", 
     xlab="Weight", ylab="Mileage", pch=18, col="blue")
text(wt, mpg, row.names(mtcars), cex=0.6, pos=4, col="red")
