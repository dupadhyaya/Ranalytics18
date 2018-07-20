# Distribution of Data
data2 = c(3,5,7,5,3,2,6,8,5,6,9,4,5,7,3,4)
data2
length(data2)
summary(data2)
str(data2)
table(data2)
names(table(data2))
hist(data2, labels=T, ylim=c(0,8),main='Histogram of Data'
     ,ylab='Frequency', xlab='Size of Data'
     , col='gray')
#breaks	 :the n+1 cell boundaries 
#(= breaks if that was a vector). These are the nominal breaks, not with the boundary fuzz.
hist(x, breaks = "Sturges",
     freq = NULL, probability = !freq,
     include.lowest = TRUE, right = TRUE,
     density = NULL, angle = 45, col = NULL, border = NULL,
     main = paste("Histogram of" , xname),
     xlim = range(breaks), ylim = NULL,
     xlab = xname, ylab,
     axes = TRUE, plot = TRUE, labels = FALSE,
     nclass = NULL, warn.unused = TRUE)

hist(data2, label=T, ylim=c(0,8), breaks=3)
hist(data2, label=T, ylim=c(0,8), breaks=7)
hist(data2, label=T, ylim=c(0,8), breaks=2:9) # same
hist(data2, label=T, ylim=c(0,8), breaks=c(2,3,4,5,6,7,8,9)) # same
hist(data2, label=T, ylim=c(0,8), breaks=c(2,4,5,6,9)) # different
#unequal width range; convert to density
hist(data2, label=T,breaks=c(2,4,5,6,9)) # different
?hist
hist(data2, label=T, ylim=c(0,0.3), breaks=c(2,4,5,6,9))

# Density
table(data2)
df2 = data.frame(t(table(data2)))
df2
df2$pf = round(df2$Freq/sum(df2$Freq),2)
df2$cpf = round(cumsum(df2$pf),2)
df2
dens = density(data2)
names(dens)
str(dens)
hist(data2, freq=F,      labels=T)
lines(density(data2), lty=2, col='red')
#lines(density(data2), type='rectangular')

abline(h=df2$pf,col='green')
#text(2:9,df2$pf,labels=df2$pf,col='blue', cex=.5)
#text(dens$x ,dens$y,labels=df2$pf,col='blue', cex=.5)

?lines

plot(density(data2))

plot(density(data2), main=' Density Plot', xlab=' Size of Class')

hist(data2, freq=F, ylim=c(0,0.3))
lines(density(data2), lty=2)
