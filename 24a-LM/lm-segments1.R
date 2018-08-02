#Segments

plot(y=mtcars$mpg, x=mtcars$wt, xlim=range(mtcars$wt), ylim=range(mtcars$mpg))
abline(fit)
segments(mtcars$wt, mtcars$mpg, mtcars$wt, fitted(fit), lty=2, lwd=2,col=1:nrow(mtcars))
text(mtcars$wt+.02, mtcars$mpg+.5, labels = round(residuals(fit)), cex=.8)



#Covariance in R
cov(mtcars$mpg,mtcars$wt)
cov(mtcars$wt,mtcars$mpg)
#Covariance manually

sum( (mtcars$wt - mean(mtcars$wt)) * (mtcars$mpg - mean(mtcars$mpg)) )/ (length(mtcars$wt) - 1)
     

#Diagnostic Plots
plot(fitted(fit), residuals(fit), pch=20, xlab='Fitted', ylab='Residual')
sdres = sd(residuals(fit))
for (j in -3:3)
  abline(h = j * sqrt(var(resid(fit))), col=abs(j) + 1)


#Plot - Residuals vs Fitted values with horz lines at 3,2,1 SDEV of residuals


ix = which(abs(resid(fit)) > 2 * sdres)
text(fitted(fit)[ix], resid(fit)[ix], ix, pos=4)
cbind(mtcars[ix, c('wt', 'mpg')], fit=round(fitted(fit)[ix],1), resid=round(residuals(fit)[ix],1) )
rm(sdres, ix)

#ND
stem(residuals(fit),scale=2)
qqnorm(residuals(fit))
qqline(residuals(fit))
?shapiro.test(residuals(fit))
#Ho data is Normal Distribution; Ha - not ND

shapiro.test(rnorm(100, mean = 5, sd = 3)) # ND : p > 0.05
shapiro.test(runif(100, min = 2, max = 4)) # not ND : p < 0.05


#hat values for Influencing Observations
h = hatvalues(fit)
head(h)
hi.lev = which( h > 3 * mean(h))
hi.lev
mtcars[hi.lev,]

plot(mtcars$wt, h)
plot(mtcars$wt, mtcars$mpg)

fit2 = lm(mtcars$mpg ~ mtcars$wt, data=mtcars, subset = - hi.lev)
summary(fit2)
round(coef(fit)); round(coef(fit2))

sqrt(sum(residuals(fit)^2)/ length(residuals(fit)))
1 - (sum(residuals(fit)^2)/ sum((mtcars$mpg - mean(mtcars$mpg))^2))
summary(fit)


(pred=predict(fit, data.frame(wt = mean(mtcars$wt)), se.fit=T))
str(pred)
pred
round(pred$fit + qt(c(.025, .975), pred$df) * pred$se.fit, 1)

pframe = data.frame(wt = seq(min(mtcars$wt), max(mtcars$wt), by=1))
pframe
pred.c = predict(fit, pframe, interval='confidence', level=.95)
str(pred.c)
pred.c

#error

#pred.p = predict(fit2,pframe, interval='prediction', level=.95)
#pred.p

#plot
plot(pframe$wt, pred.c[, 'fit'], type='n')
lines(pframe$wt, pred.c[,'fit'], col=1, lwd=2)
lines(pframe$wt, pred.c[,'lwr'], col=2, lwd=2)
lines(pframe$wt, pred.c[,'upr'], col=3, lwd=2)


zone