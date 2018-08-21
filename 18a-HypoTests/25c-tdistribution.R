# t distribution
#Plot of Student Distribution
?qt
#Density, distribution function, quantile function and random generation 
#for the t distribution with df degrees of freedom 

#Usage
dt(x, df, ncp, log = FALSE)
pt(q, df, ncp, lower.tail = TRUE, log.p = FALSE)
qt(p, df, ncp, lower.tail = TRUE, log.p = FALSE)
rt(n, df, ncp)

#Arguments
#x, q	 vector of quantiles.
#p	 vector of probabilities.
#n	 number of observations. If length(n) > 1, the length is taken to be the number required.
#df degrees of freedom (> 0, maybe non-integer). df = Inf is allowed.
#ncp	non-centrality parameter delta; currently except for rt(), only for abs(ncp) <= 37.62. If omitted, use the central t distribution.
#log, log.p	logical; if TRUE, probabilities p are given as log(p).
#lower.tail	logical; if TRUE (default), probabilities are P[X ≤ x], otherwise, P[X > x].

data_vector <- c(63, 75, 84, 58, 52, 96, 63, 55, 76, 83)
data_vector
(dfs <- length(data_vector)-1)   #dof
dfs
x_ <- seq(-8,8,0.1)  # x axis points
x_
y <- dt(x_,dfs)  # y axis points density (t) func
y
# sign level=0.05, p = 1 -0.05 = 0.95 : 95% of values (area) from left 
t.val <- qt(1-0.05,df=dfs)
t.val   # on x axis

plot(x_,y,type='l',lwd=3,col='blue',xlab='x',
     ylab='Density',main='Student distribution \n 9 Degree of Freedom')

abline(v=0)
text(0,0.1, labels=' Center Line', srt=90)

abline(v=t.val,lwd=2,col='red')
text(t.val,0.2, labels='Line at tval', srt=90, col='red')
dt(t.val,dfs)  # point where t.val line touches the plot
mtext(1,at=t.val,text=round(t.val,2))
points(t.val,dt(t.val,dfs),lwd=3,col='red')
text(t.val,dt(t.val,dfs), labels= ' Intersect')

