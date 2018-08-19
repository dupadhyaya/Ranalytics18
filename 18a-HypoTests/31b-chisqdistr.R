# Chi Square Distribution
x <- rchisq(100, 5) 
hist(x, prob=TRUE, ylim=c(0,0.2)) 
curve( dchisq(x, df=1), col='blue', add=TRUE) 
curve( dchisq(x, df=5), col='green', add=TRUE) 
curve( dchisq(x, df=10), col='red', add=TRUE ) 

x <- rchisq(100, 5) 
hist(x, prob=TRUE, ylim=c(0,0.2)) 
for (i in 1:10) {
  curve( dchisq(x, df=i), col=sample(rainbow(10)), lwd=1, add=TRUE) 
}
?curve



# Example 2

x <- rchisq(100, 5)
hist(x, prob=TRUE, ylim=c(0,0.2))
curve( dchisq(x, df=5), col='green', add=TRUE)
curve( dchisq(x, df=10), col='red', add=TRUE )

#It may be easier to compare the therotical curve to a density estimate rather than the histogram:
lines( density(x), col='orange')


#Here is one way to dynamically change the df to see how the fit compares:
  
tmpfun <- function(x,df=1) {
    hist(x, prob=TRUE)
    curve( dchisq(x, df=df), col='blue', add=TRUE )
  }

TeachingDemos::tkexamp( tmpfun(x), list( df=list('slider', from=1, to=15)))


#Another approach that may give a better feel for the fit is the hanging rootogram:
  
library(vcd)

tmp <- hist(x, plot=FALSE)
rootogram( tmp$counts, diff(pchisq( tmp$breaks, df=5 )*length(x) ) )
rootogram( tmp$counts, diff(pchisq( tmp$breaks, df=10 )*length(x) ) )

tmpfun2 <- function(x, df=1) {
  tmp <- hist(x, plot=FALSE)
  rootogram( tmp$counts, diff(pchisq(tmp$breaks, df=df)*length(x) ) )
}

TeachingDemos::tkexamp( tmpfun2(x), list( df=list('slider', from=1, to=15)))
