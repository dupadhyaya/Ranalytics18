x_mean <- c(1, 2, 3, 4)
y_mean <- c(1, 1, 1, 1)

y_max <- c(4, 4, 4, 4)
y_min <- c(-4, -4, -4, -4)


x_shade <- c(2, 3, 4)

y_max_shade <- c(4, 4, 4)
y_min_shade <- c(-4, -4, -4)

plot(x=rep(x_mean, 3), y=c(y_mean, y_max, y_min), bty='n', type="n" )
rect(2,-4,4,4,col = rgb(0.5,0.5,0.5,1/4))
arrows(x0=x_mean, y0=y_min, x1=x_mean, y1=y_max, length=0)
points( x=x_mean, y=y_mean, pch=16)




# ------------

xx <- c(1:50)
yy <- rnorm(50)
n <- 50
hline <- 0
plot (yy ~ xx, type="n", axes=FALSE, ann=FALSE)
text(x=xx,y=min(yy)+max(yy),labels='a')
polygon(c(xx[1], xx, xx[n]), c(min(yy), yy, min(yy)),    
        col=rgb(1, 0, 0,0.5), border=NA)


#------normal plot
x=seq(-4,4,length=200)
x
y=dnorm(x)
plot(x,y,type="l", lwd=2, col="blue")
x=seq(-1,1,length=100)
y=dnorm(x)
polygon(c(-1,x,1),c(0,y,0),col="gray")
abline(v=c(-1,1))


#--------------

par.default <- par(no.readonly=TRUE)
par(mar=c(5,6,4,2)+0.1)
par(pty="s")

# create data
x <- 1:100
Exp <- 50 + x*0.1
Con.High <- Exp + 5 + rnorm(100)
Con.Low <- Exp - 5 + rnorm(100)
One.Run <- Exp + rnorm(100,0,2)

# create plot
plot(Exp~x,type="l",
     xlab= "Time Step",
     ylab="Populatioh Size (N)",
     lty="dashed",
     ylim=range(One.Run,Exp,Con.High,Con.Low),
     cex.lab=1.5,las=1,cex.axis=1.5)

# add polygon and overlplot the lines
polygon(c(x,rev(x)),c(Con.Low,rev(Con.High)),col="thistle",border=NA)
lines(x,Exp,lty="solid",col="purple",lwd=1.5)
lines(x,One.Run)


par(par.default)
rm(list=ls())

#-------------

# Create data for the area to shade
cord.x <- c(-3,seq(-3,-1,0.01),-1) 
cord.y <- c(0,dnorm(seq(-3,-1,0.01)),0) 

# Make a curve
curve(dnorm(x,0,1), xlim=c(-3,3), main='Standard Normal') 

# Add the shaded area.
polygon(cord.x,cord.y,col='skyblue')
