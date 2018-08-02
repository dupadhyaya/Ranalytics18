#Multinominal Regression

require(foreign)
require(nnet)
require(ggplot2)
require(reshape2)
#Eg1
ml <- read.dta("https://stats.idre.ucla.edu/stat/data/hsbdemo.dta")
str(ml)
with(ml, table(ses, prog))
with(ml, do.call(rbind, tapply(write, prog, function(x) c(M = mean(x), SD = sd(x)))))
tapply(ml$write, ml$prog, function(x) c(M = mean(x), SD = sd(x)))

ml$prog2 <- relevel(ml$prog, ref = "academic")
unique(ml$prog2)
test <- multinom(prog2 ~ ses + write, data = ml)       

summary(test)       

z <- summary(test)$coefficients/summary(test)$standard.errors
z

# 2-tailed z test
p <- (1 - pnorm(abs(z), 0, 1)) * 2
p

## extract the coefficients from the model and exponentiate
exp(coef(test))

head(pp <- fitted(test))

dses <- data.frame(ses = c("low", "middle", "high"), write = mean(ml$write))
predict(test, newdata = dses, "probs")

dwrite <- data.frame(ses = rep(c("low", "middle", "high"), each = 41), write = rep(c(30:70),
                                                                                   3))
head(dwrite)

## store the predicted probabilities for each value of ses and write
pp.write <- cbind(dwrite, predict(test, newdata = dwrite, type = "probs", se = TRUE))

## calculate the mean probabilities within each level of ses
by(pp.write[, 3:5], pp.write$ses, colMeans)


## melt data set to long for ggplot2
lpp <- melt(pp.write, id.vars = c("ses", "write"), value.name = "probability")
head(lpp)  # view first few rows


## plot predicted probabilities across write values for each level of ses
## facetted by program type
ggplot(lpp, aes(x = write, y = probability, colour = ses)) + geom_line() + facet_grid(variable ~
                                                                                        ., scales = "free")
