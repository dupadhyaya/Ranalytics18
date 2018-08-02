# Linear Modeling : Sales
# 
# 
X = c(1.7,1.6,2.8,5.6,1.3,2.2, 1.3,1.1,3.2,1.5,5.2,4.6,5.8,3 )
Y = c(3.7,3.9,6.7,9.5,3.4,5.6,3.7, 2.7,5.5,2.9,10.7,7.6,11.8,4.1 )

cor.test(X,Y)
#Plot
plot(x=X,y=Y, main=' Plot between X and Y')
abline(lm(Y ~ X), col='blue')
text(x=X,y=Y,labels=paste0(X,Y),cex=.7, col='red')
?text
fit =lm(Y ~ X)
summary(fit)

df =data.frame(X,Y)
df
df$x = round(X - mean(X),2)
df$y = round(Y - mean(Y),2)
df
colMeans(df)
df$xy = round(df$x * df$y,2)
df$x2 = round(df$x^2,2)
SSxy = sum(df$xy)
SSx2 = sum(df$x2)
(b1 = SSxy / SSx2)
(b0 = mean(Y) - b1 * mean(X))
(df$Yh = round(fitted(fit),2))
df
plot(df$Yh, X)
(df$residuals = round(df$Y - df$Yh, 2))
summary(df$residuals)
summary(fit)
df$SSr = round((df$Yh - mean(Y))^2, 2)
df$SSe = round((df$Y - df$Yh) ^ 2, 2)
df
colSums(df)
(SSR = round(sum(df$SSr),2))
(SSE = round(sum(df$SSe),2))
(R2 = round(sum(df$SSr)/ (sum(df$SSe) + sum(df$SSr)),4))
df
n=length(X)
(stderror = sqrt(sum(df$SSe)/(n-2)))

p = 1 # No of IV Variables
(MSR = SSR/p)
(MSE = SSE/(n-p-1))
(Fstats = MSR/MSE)
summary(fit)






