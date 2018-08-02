#Log Regression
#https://visualstudiomagazine.com/articles/2016/12/01/logistic-regression-using-r.aspx
#
Age <- c(1,5,3,2,6,3,7,4,2,4)
Edu <- c(4,8,7,5,7,2,5,5,3,7)
Party <- c("red","red","red","red","red", "blue","blue","blue","blue","blue")
mydf <- data.frame(Age,Edu,Party)
mydf$Party <- factor(mydf$Party, levels=c("red","blue"))
mydf

plot(mydf$Age, mydf$Edu, xlim=c(0,9), ylim=c(0,9),
     xaxs="i", yaxs="i", col=c("red","blue")[mydf$Party],pch=20, cex=2)

axis(side=1, at=c(0:9))
axis(side=2, at=c(0:9))
abline(h=0:9,v=0:9, col="gray", lty=3)

mymodel = glm(Party ~ Age + Edu, data=mydf, family="binomial")
summary(mymodel)
age=1; edu=4
(z = 3.5566 + (0.9939 * 1) + (-1.3191 * 4)) #  -0.7259
(z = 3.5566 + 0.9939 * age - 1.3191 * edu)
(p = 1 / (1 + exp(-z)))  #0.3261
contrasts(mydf$Party)  # blue=1
#If p > 0.5, the predicted value is the second possible value, "blue

predict(mymodel, mydf, type="response")


if (p <= 0.5) { 
  cat("predicted party = red \n") 
  } else {
  cat("predicted party = blue \n")
  }
#predicted party = red
#2nd way to predict
b0 = mymodel$coefficients[[1]]
b1 = mymodel$coefficients[[2]]
b2 = mymodel$coefficients[[3]]
(z = b0 + (b1 * 1) + (b2 * 4))
(p = 1 / (1 + exp(-z)))

#3rd way to predict
nd = with(mydf, data.frame(Age=1, Edu=4))
nd
nd$pred = predict(mymodel, newdata=nd, type="response")
nd
