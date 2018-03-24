# Condition Tree 

# Conditional Inference Tree for Kyphosis
library(party)
str(kyphosis)
fit <- ctree(Kyphosis ~ Age + Number + Start, 
             data=kyphosis)
plot(fit, main="Conditional Inference Tree for Kyphosis")


library(partykit)
str(kyphosis)
fit <- partykit::ctree(Kyphosis ~ Age + Number + Start, 
             data=kyphosis)
plot(fit, main="Conditional Inference Tree for Kyphosis")
sctest(fit, node = c(1,2,3))





# Conditional Inference Tree for Mileage
library(party)
str(cu.summary)
fit2 <- ctree(Mileage~Price + Country + Reliability + Type, 
              data=na.omit(cu.summary))
plot(fit2, main="Conditional Inference Tree for cu.summary - DV numeric")


library("strucchange")
strucchange::sctest(fit2, node = 1)
strucchange::sctest(airct, node = c(2,7,4,9))