#Linear Regression 
#https://msperlin.github.io/pafdR/models.html

set.seed(10)

# number of time periods
nT <- 1000

# set parameters
my.intercept <- 0.5
my.beta <- 1.5

# simulate
x <- rnorm(nT)
y <- my.intercept + my.beta*x + rnorm(nT)

# set df
df <- data.frame(y, x)

# estimate model----
my.lm <- lm(data = df, 
            formula = y ~ x )

library(car)

# set test matrix ----
test.matrix <- matrix(c(my.intercept,  # alpha test value
                        my.beta))  # beta test value

# hypothesis matrix ----
hyp.mat <- matrix(c(1,0,
                    0,1),nrow = 2)
summary(lm(y ~ x))

# do test ----
my.waldtest <- linearHypothesis(my.lm, 
                                hypothesis.matrix = hyp.mat, 
                                rhs = test.matrix)

# print result
print(my.waldtest)

#Hypothesis Tests ----
library(lmtest)

# Breush Pagan test 1 - Serial correlation
# Null Hypothesis: No serial correlation in residual
print(bgtest(my.lm, order = 5))

# Breush Pagan test 2 - Homocesdasticity of residuals
# Null Hypothesis: homocesdasticity  (constant variance of residuals)
print(ncvTest(my.lm))

# Durbin Watson test - Serial correlation
# Null Hypothesis: No serial correlation in residual
print(dwtest(my.lm))

# Shapiro test  - Normality
# Null Hypothesis: Data is normally distributed
print(shapiro.test(my.lm$residuals))


library(gvlma)

# global validation of model----
gvmodel <- gvlma(my.lm) 

# print result
summary(gvmodel)
