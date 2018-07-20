#AVE

# ave is tapply's friendly cousin. It returns results
# in a form that you can plug straight back into your data frame

(dfr <- data.frame(a=1:20, f=rep(LETTERS[1:5], each=4)))
(means <- tapply(dfr$a, dfr$f, mean))
##  A    B    C    D    E 
## 2.5  6.5 10.5 14.5 18.5 

## great, but putting it back in the data frame is another line:

(dfr$m <- means[dfr$f])
dfr

#-----------
(dfr$m2 <- ave(dfr$a, dfr$f, FUN=mean)) # NB argument name FUN is needed!
dfr

#---------
#There is nothing in the base package that works like ave
#for whole data frames (as by is like tapply for data frames). 
#But you can fudge it:
  
dfr$foo <- ave(1:nrow(dfr), dfr$f, FUN=function(x) {
    x <- dfr[x,]
    sum(x$m*x$m2)
  })
dfr
