set.seed(5)

N  = 500; b0 = 3 ; b1 = 0.4
s2 = 5 ; g1 = 1.5 ; g2 = 0.015

x        = runif(N, min=0, max=100)
y_homo   = b0 + b1*x + rnorm(N, mean=0, sd=sqrt(s2            ))
y_hetero = b0 + b1*x + rnorm(N, mean=0, sd=sqrt(exp(g1 + g2*x)))

mod.homo   = lm(y_homo~x)
mod.hetero = lm(y_hetero~x)
plot(mod.homo)
plot(mod.hetero)
fit=mod.homo
# Evaluate homoscedasticity
# non-constant error variance test
ncvTest(fit)
# plot studentized residuals vs. fitted values 
spreadLevelPlot(fit)

library(gvlma)
gvmodel <- gvlma(fit) 
summary(gvmodel)
