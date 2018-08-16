#Scatter Plot

#The basic function is plot(x, y), where x and y are numeric vectors denoting the (x,y) points to plot.

# Simple Scatterplot
attach(mtcars)
plot(wt, mpg, main="Scatterplot Example", 
     xlab="Car Weight ", ylab="Miles Per Gallon ", pch=19)
# Add fit lines
abline(lm(mpg~wt), col="red") # regression line (y~x) 
lines(lowess(wt,mpg), col="blue") # lowess line (x,y)

# Enhanced Scatterplot of MPG vs. Weight 
# by Number of Car Cylinders 
library(car) 
scatterplot(mpg ~ wt | cyl, data=mtcars, 
            xlab="Weight of Car", ylab="Miles Per Gallon", 
            main="Enhanced Scatter Plot", 
            labels=row.names(mtcars))


# Basic Scatterplot Matrix
pairs(~mpg+disp+drat+wt,data=mtcars, 
      main="Simple Scatterplot Matrix")

# Scatterplot Matrices from the lattice Package 
library(lattice)
splom(mtcars[c(1,3,5,6)], groups=cyl, data=mtcars,
      panel=panel.superpose, 
      key=list(title="Three Cylinder Options",
               columns=3,
               points=list(pch=super.sym$pch[1:3],
                           col=super.sym$col[1:3]),
               text=list(c("4 Cylinder","6 Cylinder","8 Cylinder"))))


# Scatterplot Matrices from the car Package
library(car)
scatterplot.matrix(~mpg+disp+drat+wt|cyl, data=mtcars,
                   main="Three Cylinder Options")


# Scatterplot Matrices from the glus Package 
library(gclus)
dta <- mtcars[c(1,3,5,6)] # get data 
dta.r <- abs(cor(dta)) # get correlations
dta.col <- dmat.color(dta.r) # get colors
# reorder variables so those with highest correlation
# are closest to the diagonal
dta.o <- order.single(dta.r) 
cpairs(dta, dta.o, panel.colors=dta.col, gap=.5,
       main="Variables Ordered and Colored by Correlation" )

# High Density Scatterplot with Binning
library(hexbin)
x <- rnorm(1000)
y <- rnorm(1000)
bin<-hexbin(x, y, xbins=50) 
plot(bin, main="Hexagonal Binning")

# High Density Scatterplot with Color Transparency 
pdf("c:/scatterplot.pdf") 
x <- rnorm(1000)
y <- rnorm(1000) 
plot(x,y, main="PDF Scatterplot Example", col=rgb(0,100,0,50,maxColorValue=255), pch=16)
dev.off()


# 3D Scatterplot
library(scatterplot3d)
attach(mtcars)
scatterplot3d(wt,disp,mpg, main="3D Scatterplot")


# 3D Scatterplot with Coloring and Vertical Drop Lines
library(scatterplot3d) 
attach(mtcars) 
scatterplot3d(wt,disp,mpg, pch=16, highlight.3d=TRUE,
              type="h", main="3D Scatterplot")


# 3D Scatterplot with Coloring and Vertical Lines
# and Regression Plane 
library(scatterplot3d) 
attach(mtcars) 
s3d <-scatterplot3d(wt,disp,mpg, pch=16, highlight.3d=TRUE,
                    type="h", main="3D Scatterplot")
fit <- lm(mpg ~ wt+disp) 
s3d$plane3d(fit)

# Spinning 3d Scatterplot
library(rgl)

plot3d(wt, disp, mpg, col="red", size=3)

# Another Spinning 3d Scatterplot
library(Rcmdr)
attach(mtcars)
scatter3d(wt, disp, mpg)

