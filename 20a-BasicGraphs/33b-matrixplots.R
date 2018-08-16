# Matrix Plots
# Multiple Series on one Graph

table(iris$Species) # is data.frame with 'Species' factor
iS <- iris$Species == "setosa"
iV <- iris$Species == "versicolor"
iS;iV
op <- par(bg = "bisque")
matplot(c(1, 8), c(0, 4.5), type =  "n", xlab = "Length", 
        ylab = "Width",  main = "Petal and Sepal Dimensions in Iris Blossoms")
matpoints(iris[iS,c(1,3)], iris[iS,c(2,4)], pch = "sS", 
          col = c(2,4))
matpoints(iris[iV,c(1,3)], iris[iV,c(2,4)], pch = "vV", 
          col = c(2,4))
legend(1, 4, c("    Setosa Petals", "    Setosa Sepals",
               "Versicolor Petals", "Versicolor Sepals"),
       pch = "sSvV", col = rep(c(2,4), 2))

# Example 2

a <- rnorm(100)
b <- 2*a + 3
c <- 3*a + 2
a;b;c
matplot(a, cbind(b,c), pch=1:2, col=c(2,4))
legend("bottomright", inset=.05, legend=c("b", "c"), 
       pch=1:2, col=c(2,4), horiz=F)



# Example 3
x = 1:10
A = c(15, 36, 54, 60, 68, 71, 73, 75, 78, 78)
B = c(20, 49, 58, 69, 75, 80, 83, 86, 88, 89)
C = c(24, 58, 68, 75, 83, 90, 93, 93, 95, 96)
Performance = data.frame(A,B,C)
matplot(x,Performance, type="o", pch=c(1,2,3), col=c("red","green","blue"))
legend("bottomright", inset=.05, legend=c("A", "B",'C'),
      pch=1:3, col=c("red","green","blue"), horiz=F)
