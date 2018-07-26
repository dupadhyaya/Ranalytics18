#Variance

#The presence of non-constant variance in the error terms results in heteroskedasticity. Generally, non-constant variance arises in presence of outliers or extreme leverage values. Look like, these values get too much weight, thereby disproportionately influences the model’s performance. When this phenomenon occurs, the confidence interval for out of sample prediction tends to be unrealistically wide or narrow.

#How to check
#Look at residual vs fitted values plot. If heteroskedasticity exists, the plot would exhibit a funnel shape pattern 

#Non-constant Error Variance
# Evaluate homoscedasticity
# non-constant error variance test
ncvTest(fit)
# plot studentized residuals vs. fitted values 
spreadLevelPlot(fit)

#Homoscedasticity of residuals or equal variance
#Top Left and bottom-Left Plots show how the residuals vary as the fitted values increase.

par(mfrow=c(2,2))  # set 2 rows and 2 column plot layout
fit3 <- lm(mpg ~ disp, data=mtcars)  # linear model
plot(fit3)

#first plot (top-left), as the fitted values along x increase, the residuals decrease and then increase. This pattern is indicated by the red line, which should be approximately flat if the disturbances are homoscedastic. The plot on the bottom left also checks this, and is more convenient as the disturbance term in Y axis is standardized.

#another model

fit4 = lm(dist ~ speed, data=cars[1:20, ])  #  linear model
plot(fit4) #homoscedascity present

#M3
library(car)
data(cars)
lmMod <- lm(dist ~ speed, data=cars) # initial model
lmtest::bptest(lmMod)
car::ncvTest(lmMod) 

#Box Transformation

distBCMod <- caret::BoxCoxTrans(cars$dist)
print(distBCMod)
cars <- cbind(cars, dist_new=predict(distBCMod, cars$dist)) # append the transformed variable to cars
head(cars) # view the top 6 rows
lmMod_bc <- lm(dist_new ~ speed, data=cars)
lmtest::bptest(lmMod_bc)
#With a p-value of 0.91, we fail to reject the null hypothesis (that variance of residuals is constant) and therefore infer that ther residuals are homoscedastic. Lets check this graphically as well.

plot(lmMod_bc)

#much flatter line and an evenly distributed residuals in the top-left plot. So the problem of heteroscedsticity is solved and the case is closed. If you have any question post a comment below.


# M4----
#https://cran.r-project.org/web/packages/olsrr/vignettes/heteroskedasticity.html

library(olsrr)
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_test_score(model)


#Holm’s p value Adjustment
model <- lm(mpg ~ disp + hp + wt + drat, data = mtcars)
ols_test_breusch_pagan(model, rhs = TRUE, multiple = TRUE, p.adj = 'holm')

#Bonferroni p value Adjustment
model <- lm(mpg ~ disp + hp + wt + drat, data = mtcars)
ols_test_breusch_pagan(model, rhs = TRUE, multiple = TRUE, p.adj = 'bonferroni')

#Use independent variables of the model and perform multiple tests
model <- lm(mpg ~ disp + hp + wt + drat, data = mtcars)
ols_test_breusch_pagan(model, rhs = TRUE, multiple = TRUE)

#Use independent variables of the model
model <- lm(mpg ~ disp + hp + wt + drat, data = mtcars)
ols_test_breusch_pagan(model, rhs = TRUE)

#Use fitted values of the model
model <- lm(mpg ~ disp + hp + wt + drat, data = mtcars)
ols_test_breusch_pagan(model)

#Use independent variables of the model
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_test_score(model, rhs = TRUE)

#Specify variables
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_test_score(model, vars = c('disp', 'hp'))

#F Test Use fitted values of the model
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_test_f(model)

#Use independent variables of the model
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_test_f(model, rhs = TRUE)

#Specify variables
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_test_f(model, vars = c('disp', 'hp'))
