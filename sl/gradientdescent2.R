# Multivariate Gradient Descent 
# https://www.r-bloggers.com/multivariable-gradient-descent/

x <- seq(-5,5,length=100)
x
y <- x  # similar values of x and y

fun <- function(x,y)
{
  return(x**2+y**2-2*x*y)
}
# Outer Product
#x=1:9 ; x%o%x
#outer(x,x,'*')

z <- outer(x,y,fun) # Outer Product of arrays
z

?persp  # Perspective Plots of surface over x-y plane


persp(x,y,z,theta=30,phi=30,expand=0.5,col="lightgreen",
      ltheta=100,xlab="x",ticktype="detailed",ylab="y",zlab="z")
#
#Well in this case, we need to calculate two thetas in order 
#to find the point (theta,theta1) such that f(theta,theta1) = minimum.
#