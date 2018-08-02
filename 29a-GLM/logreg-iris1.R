#Logistic Regression using Iris Dataset
#06 Nov 17
#http://rstudio-pubs-static.s3.amazonaws.com/230133_fb9cb3c35ca345d0b9e5726ed3f45a21.html
library(datasets)
ir_data<- iris
head(ir_data)
str(ir_data)
levels(ir_data$Species)
sum(is.na(ir_data))

ir_data<-ir_data[1:100,]
head(ir_data)
unique(ir_data$Species)

set.seed(100)
samp<-sample(1:100,80)
ir_test<-ir_data[samp,]
ir_ctrl<-ir_data[-samp,]

library(ggplot2); library(GGally)
pairs(ir_test)
ggpairs(ir_test)

# Model Fitting
y<-ir_test$Species; x<-ir_test$Sepal.Length
glfit<-glm(y~x, family = 'binomial')

summary(glfit)

newdata<- data.frame(x=ir_ctrl$Sepal.Length)
predicted_val<-predict(glfit, newdata, type="response")
prediction<-data.frame(ir_ctrl$Sepal.Length, ir_ctrl$Species,predicted_val)
prediction

qplot(prediction[,1], round(prediction[,3]), col=prediction[,2], xlab = 'Sepal Length', ylab =
        'Prediction using Logistic Reg.')




# Other Examples on IRIS
data(iris)
fit <- lm(Petal.Width ~ Petal.Length, data=iris)
class(fit)
methods(class=class(fit))
summary(fit) # show results

coefficients(fit) # model coefficients
predict(fit) # fitted predictions
predict(fit, newdata=data.frame(Petal.Length=seq(1, 2, by=0.1)))
confint(fit, level=0.95) # CIs for model parameters 
fitted(fit) # predicted values
residuals(fit) # residuals
anova(fit) # anova table 
influence(fit) # regression diagnostics

par(mfrow=c(2,2))
par(mar=c(2,2,2,2))
plot(fit)


#Multiple Regression
fit2 <- lm(Petal.Width ~ Petal.Length + Sepal.Length + Sepal.Width, data=iris)
summary(fit2) # show results
anova(fit, fit2)

fit2int <- lm(Petal.Width ~ Petal.Length + Sepal.Length + Sepal.Width + Petal.Length:Sepal.Length, data=iris)
anova(fit2, fit2int)

tail(model.matrix(~ Species, data=iris))
(model.matrix(~ Species, data=iris))
tail(iris)

fit3 <- lm(Petal.Width ~ Petal.Length + Sepal.Length + Sepal.Width + Species, data=iris)
summary(fit3)

anova(fit2, fit3)

library(xtable)
print(xtable(fit3), type="html")


iris2 <- iris
iris2$virginica <- iris$Species == "virginica"
fit4 <- glm(virginica ~ Petal.Width + Petal.Length + Sepal.Length + Sepal.Width, data=iris2, family=binomial)

plot(fit4)


fit5 <- glm(round(Petal.Width) ~ Petal.Length + Sepal.Length + Sepal.Width, data=iris2, family=poisson)
plot(fit5)

summary(fit5)

#Plotting a linear regression with confidence and prediction intervals.

plot(Petal.Width ~ Petal.Length, col=c("black", "red", "blue")[Species], pch=(15:17)[Species], xlab="Petal Length (cm)", ylab="Petal Width (cm)", data=iris)
newx <- data.frame(Petal.Length=seq(min(iris$Petal.Length), max(iris$Petal.Length), length.out=100))
conf.interval <- predict(fit, newdata=newx, interval="confidence")
pred.interval <- predict(fit, newdata=newx, interval="prediction")
lines(conf.interval[, "fit"] ~ newx[, 1], lty=1, lw=3)
lines(conf.interval[, "lwr"] ~ newx[, 1], lty=2)
lines(conf.interval[, "upr"] ~ newx[, 1], lty=2)
lines(pred.interval[, "lwr"] ~ newx[, 1], lty=3)
lines(pred.interval[, "upr"] ~ newx[, 1], lty=3)
legend("topleft", legend=c(levels(iris$Species), "CI", "PI"), col=c("black", "red", "blue", "black", "black"), pch=c(15:17, -1, -1), lty=c(-1, -1, -1, 2, 3))



#Multi Class https://stackoverflow.com/questions/22009871/how-to-perform-multi-class-classification-using-svm-of-e1071-package-in-r
#
# install.packages( 'e1071' )
library( 'e1071' )
data( iris )
model <- svm( iris$Species~., iris )
summary(model)
res <- predict( model, newdata=iris )
res
head(cbind(res, iris))
