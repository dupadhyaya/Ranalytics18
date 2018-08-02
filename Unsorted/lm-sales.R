# Linear Regression 
# Area(X) - Sales(Y)
# Create Data
X = c(1.7,1.6,2.8,5.6,1.3,2.2,1.3,1.1,3.2,1.5,5.2,4.6,5.8,3 )
Y = c(3.7,3.9,6.7,9.5,3.4,5.6,3.7,2.7,5.5,2.9,10.7,7.6,11.8,4.1 )

# Summary
length(X)
sum(X); mean(X)
sum(Y); mean(Y)

par(mfrow=c(1,1))
# Covariance
cov(X,Y)

# Correlation
cor(X,Y)
plot(X,Y, main=' Plot between X and Y')
abline(lm(Y ~ X), col='red')

# Correlation Test
cor.test(X,Y)


(df  = data.frame(X,Y))
(xm = mean(X))
(ym = mean(Y))
df
# Calculate diff between X and xm and similarly for Y
(df$x = round(X - xm,2))
transform(df, y = round(Y - ym,2))
df  # only x

df= transform(df, y = round(Y - ym,2))  # save into df

(df$xy = round(df$x * df$y,2))
df
# temporarily display - does not add column permanently
plyr::mutate(df, x2 = x ^ 2)  
df
df = plyr::mutate(df, x2 = x ^ 2)  
df

colSums(df)
(SSXY = with(df, sum(xy)))
(SSX2 = sum(df$x2))

(b1 = round(SSXY/ SSX2,2))
(b0 = ym - b1 * xm)
# Predicted Values based on coefficients
(Yp = round(b0 + b1 * X,2))
(df$Yp = Yp)
df

# Errors : SST = SSE (predict ~ actual) + SSR (predict ~ meany) + 
(df$SSe = round((Y - Yp)^2,2))
df
(df$SSr = round((Yp - ym)^2,2))
df
(SSE = sum(df$SSe))  # Unexplained Variation
(SSR = sum(df$SSr)) # Regression Sum of Squares
(SST = SSE + SSR)  # Total Sum of Squares should be min

#Coeff of Determination
(r2 = round(SSR/ SST,3))

#Variability due to other factors 
(1 - r2)  # unexplained Variation

#Std Error of Estimate : Residual Std Error
n = length(X)
(Syx = round(sqrt(SSE/(n - 2)),3))
#Variability of Actual Values of Y (Yi) from Yp

#Residuals
residue = Y-Yp
summary(residue)

fit=lm(formula = Y ~ X)
summary(fit)
par(mar=c(5,4,4,2))
plot(Y, X,col = "blue",main = "Area & Sales", abline(lm(x~y)),cex = 1.3, pch =
       16,xlab = "Area in sq ft",ylab = "Sales in 1000 Rs")

layout(matrix(c(1,2,3,4),2,2))
plot(fit)

plot(fit, which=1:4)

lmtest::dwtest(fit)
car::durbinWatsonTest(fit)

aov(fit)
