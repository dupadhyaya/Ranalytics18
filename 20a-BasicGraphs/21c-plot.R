#Plot
#https://www.programiz.com/r-programming/plot-function
#simplest case, we can pass in a vector and we will get a scatter plot of magnitude vs index. But generally, we pass in two vectors 
#and a scatter plot of these points are plotted.
plot(c(1,2),c(3,5))
plot(1)
x <- seq(-pi,pi,0.1)

plot(x, sin(x))

plot(x, sin(x),
     main="The Sine Function",
     ylab="sin(x)")
#options
#"p" - points
# "l" - lines
# "b" - both points and lines
# "c" - empty points joined by lines
# "o" - overplotted points and lines
# "s" and "S" - stair steps
# "h" - histogram-like vertical lines
# "n" - does not produce any points or lines
plot(x, sin(x),
     main="The Sine Function",
     ylab="sin(x)",
     type="l",
     col="blue")
#Overlaying plot
plot(x, sin(x),
     main="Overlaying Graphs",
     ylab="",
     type="l",
     col="blue")

lines(x,cos(x), col="red")

legend("topleft",
       c("sin(x)","cos(x)"),
       fill=c("blue","red")
)
