#Multinominal 2

#https://www.princeton.edu/~otorres/LogitR101.pdf
#
# Loading the required packages
library(foreign)
library(nnet)
library(stargazer)

# Getting the sample data from UCLA
#mydata = read.dta("http://www.ats.ucla.edu/stat/data/hsb2.dta")
mydata <- read.dta("https://stats.idre.ucla.edu/stat/data/hsbdemo.dta")

# Checking the output (dependent) variable
table(mydata$ses)


# By default the first category is the reference.
# To change it so ‘middle’ is the reference type
mydata$ses2 = relevel(mydata$ses, ref = "middle")
unique(mydata$ses2)

# Running the multinomial logit model using the multinom() function
multi1 = multinom(ses2 ~ science + socst + female, data=mydata)

summary(multi1)

library(stargazer)
stargazer(multi1, type="html", out="multi1.htm")
stargazer(multi1, type="text",out="multi1.txt")
multi1.rrr = exp(coef(multi1))
multi1.rrr


library(stargazer)
stargazer(multi1, type="html", coef=list(multi1.rrr), p.auto=FALSE, out="multi1rrr.htm")


allmean <- data.frame(science=rep(mean(mydata$science),2),
                      socst=rep(mean(mydata$socst),2),
                      female = c("male","female"))
allmean

allmean[, c("pred.prob")] <- predict(multi1, newdata=allmean, type="probs")

allmean

allmean[, c("pred.prob")] <- predict(multi1, newdata=allmean, type="class")
allmean
