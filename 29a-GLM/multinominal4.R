#multinominal 4
#https://stats.stackexchange.com/questions/9715/how-to-set-up-and-estimate-a-multinomial-logit-model-in-r
#
library("nnet")
data("Fishing", package = "mlogit")
fishing.mu <- multinom(mode ~ income, data = Fishing)
sum.fishing <- summary(fishing.mu) # gives a table of outcomes by covariates for coef and SE
str(sum.fishing)
# now get the p values by first getting the t values
pt(abs(sum.fishing$coefficients / sum.fishing$standard.errors),
   df=nrow(Fishing)-6,lower=FALSE)
