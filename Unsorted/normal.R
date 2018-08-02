#normal Distribution  
curve(dnorm, xlim = c(-3, 3), ylim = c(0, 0.5), xlab = "z", ylab="f(z)")

#Change this value if you’d like to do a graph for another value of z, where3 < z < 3.
z = -1.24
x = c(-3, seq(-3, z, by=.001), z)
y = c(0, dnorm(seq(-3, z, by=.001)), 0)
polygon(x, y, col="red")
pnorm(1.24) - pnorm(0)

curve(dnorm, xlim = c(-3, 3), ylim = c(0, 0.5), xlab = "z", ylab="f(z)")
plot.new()
#• Change these values if you’d like to do a graph for other values of zleft or
#zright, where both values are between  3 and 3.
zleft = 0
zright = 1.24
x = c(zleft, seq(zleft, zright, by=.001), zright)
y = c(0, dnorm(seq(zleft, zright, by=.001)), 0)
polygon(x, y, col="red")
#--------------

#Find P Z( ) > 1.24 #• Graph and shade for the above problem.
1 - pnorm(-1.24)
plot.new()
curve(dnorm, xlim = c(-3, 3), ylim = c(0, 0.5), xlab = "z", ylab="f(z)")
z = -1.24
x = c(z, seq(z, 3, by=.001), 3)
y = c(0, dnorm(seq(z, 3, by=.001)), 0)
polygon(x, y, col="red")

qnorm(0.85) 
plot.new()
curve(dnorm, xlim = c(-3, 3), ylim = c(0, 0.5), xlab = "z", ylab="f(z)")
#• Change this value if you’d like to do another quantile.

prob = 0.85

x = c(-3, seq(-3, qnorm(prob), by=.001), qnorm(prob))
y = c(0, dnorm(seq(-3, qnorm(prob), by=.001)), 0)
polygon(x, y, col="red")
#• 85% of the total area under the curve is shaded red. (This includes the tiny
                                                        piece to the left of z =  3; our figure cuts it off.) 
pnorm(95, mean=100, sd=15) - pnorm(80, mean=100, sd=15)
1 - pnorm(125, mean=100, sd=15)

qnorm(0.75, mean=100, sd=15) 
