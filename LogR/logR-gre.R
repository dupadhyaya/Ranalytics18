# ROCC AUC
#https://stats.idre.ucla.edu/r/dae/logit-regression/

mydata <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
## view the first few rows of the data
head(mydata)
summary(mydata)
sapply(mydata, sd)

## two-way contingency table of categorical outcome and predictors we want
## to make sure there are not 0 cells
xtabs(~admit + rank, data = mydata)

mydata$rank <- factor(mydata$rank)
mylogit <- glm(admit ~ gre + gpa + rank, data = mydata, family = "binomial")

summary(mylogit)

## CIs using profiled log-likelihood
confint(mylogit)

## CIs using standard errors
confint.default(mylogit)

#Rank Significance - Wald Test
library(aod)
aod::wald.test(b = coef(mylogit), Sigma = vcov(mylogit), Terms = 4:6)
l <- cbind(0, 0, 0, 1, -1, 0)
wald.test(b = coef(mylogit), Sigma = vcov(mylogit), L = l)

#----
## odds ratios only
exp(coef(mylogit))

## odds ratios and 95% CI
exp(cbind(OR = coef(mylogit), confint(mylogit)))


prob=predict(mylogit,type=c("response"))
mydata$prob=prob

#Test with new data
newdata1 <- with(mydata, data.frame(gre = mean(gre), gpa = mean(gpa), rank = factor(1:4)))
## view data frame
newdata1
newdata1$rankP <- predict(mylogit, newdata = newdata1, type = "response")
newdata1
newdata2 <- with(mydata, data.frame(gre = rep(seq(from = 200, to = 800, length.out = 100),4), gpa = mean(gpa), rank = factor(rep(1:4, each = 100))))
newdata3 <- cbind(newdata2, predict(mylogit, newdata = newdata2, type = "link", se = TRUE))
newdata3
newdata3 <- within(newdata3, {
  PredictedProb <- plogis(fit)
  LL <- plogis(fit - (1.96 * se.fit))
  UL <- plogis(fit + (1.96 * se.fit))
})
head(newdata3)
library(ggplot2)

ggplot(newdata3, aes(x = gre, y = PredictedProb)) + geom_ribbon(aes(ymin = LL,
  ymax = UL, fill = rank), alpha = 0.2) + geom_line(aes(colour = rank), size = 1)
## view first few rows of final dataset
head(newdata3)

#----
with(mylogit, null.deviance - deviance)
with(mylogit, df.null - df.residual)
with(mylogit, pchisq(null.deviance - deviance, df.null - df.residual, lower.tail = FALSE))
logLik(mylogit)

library(pROC)
g <- roc(admit ~ prob, data = mydata)
plot(g)    


#best fit point ----
coords(g, "best")
mydata$prediction=ifelse(prob>=0.3126844,1,0)
caret::confusionMatrix(mydata$prediction,mydata$admit)
with(mydata, table(admit,gre))


#ROC Curve
#C:\Program Files\Java\jre1.8.0_144
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre1.8.0_144') 
library(rJava)
library(Deducer)
modelfit <- glm(formula=admit ~ gre + gpa, family=binomial(), data=mydata, na.action=na.omit)
rocplot(modelfit)


#Another way to plot ROC
library(ROCR)
pred <- prediction(prob, mydata$admit)    
perf <- performance(pred, measure = "tpr", x.measure = "fpr")     
plot(perf, col=rainbow(7), main="ROC curve Admissions", xlab="Specificity", ylab="Sensitivity")    
abline(0, 1) #add a 45 degree line
(auc = performance(pred, "auc"))
