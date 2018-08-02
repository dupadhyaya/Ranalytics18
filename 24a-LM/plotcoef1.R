
library(car) # for the example data
data(Duncan) # example data
m1 = lm(prestige ~ income + education + type, data=Duncan)
library(arm) # for coefplot()
coefplot(m1, vertical=FALSE, mar=c(5.5,2.5,2,2))

require(rpart)
model <- lm(Petal.Width ~ ., data = iris)

plot_coeffs(model)
coefplot(model)


data("Mroz", package = "car")
fm <- glm(lfp ~ ., data = Mroz, family = binomial)
coefplot(fm)
?coefplot


library("arm")
data("Mroz", package = "car")
M1<-      glm(lfp ~ ., data = Mroz, family = binomial)
M2<- bayesglm(lfp ~ ., data = Mroz, family = binomial)
M3<-      glm(lfp ~ ., data = Mroz, family = binomial(probit))
coefplot(M2, xlim=c(-2, 6),            intercept=TRUE)
coefplot(M1, add=TRUE, col.pts="red",  intercept=TRUE)
coefplot(M3, add=TRUE, col.pts="blue", intercept=TRUE, offset=0.2)

