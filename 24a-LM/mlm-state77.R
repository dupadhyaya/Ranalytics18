# Multiple Regression Part 1 - 16 Jan 16
# http://stats.stackexchange.com/questions/59250/how-to-interpret-the-output-of-the-summary-method-for-an-lm-object-in-r
# http://feliperego.github.io/blog/2015/10/23/Interpreting-Model-Output-In-R

#We will be using the dataset state.x77, which is part of the state datasets available in R. (Additional information 
#about the dataset can be obtained by running help(state.x77).)

# Ex1
# a. Load the state datasets.
# b. Convert the state.x77 dataset to a dataframe.
# c. Rename the Life Exp variable to Life.Exp, and HS Grad to HS.Grad. (This avoids problems with referring to these variables when specifying a model.)
data(state) 
state.x77
str(state.x77)
class(state.x77)
# convert to DF
state77 = data.frame(state.x77)
class(state77)
# Rename
names(state77)
names(state.x77)
names(state77)[4] = 'Life.Exp'
names(state77)[6] = 'HS.Grad'

# 
# Ex2
# Suppose we wanted to enter all the variables in a first-order 
#linear regression model with Life Expectancy as the dependent
#variable. Fit this model
# 
str(state77)
model= lm(Life.Exp ~ . , data= state77)  # . means all
summary(model)
# 
# ex3
# Suppose we wanted to remove the Income, Illiteracy, and
#Area variables from the model in Exercise 2. 
#Use the update function to fit this model.
str(state77) 
model2 = update(model, . ~ . - Income - Illiteracy - Area)
#model2 = lm(Life.Exp ~ Population + Murder, HS.Grad, Frost, data=state77)
summary(model2)

# Exercise 4
# Let’s assume that we have settled on a model that has HS.Grad and
#Murder as predictors. Fit this model.
#
model3 = lm(Life.Exp ~ Murder+ HS.Grad, data = state77)
summary(model3)

# Exercise 5
# Add an interaction term to the model in Exercise 4 
#(3 different ways).
#
head(state77[,c('Murder', 'HS.Grad')])
model4a = lm(Life.Exp ~ HS.Grad + Murder + HS.Grad:Murder, data=state77)
summary(model4a)

model4b = lm(Life.Exp ~ HS.Grad * Murder, data=state77)
summary(model4b)

model4c = lm(Life.Exp ~ (HS.Grad + Murder)^2, data=state77)
summary(model4c)


# Exercise 6
# For this and the remaining exercises in this set 
#we will use the model from Exercise 4. Obtain 95% confidence intervals for 
#the coefficients of the two predictor variables.

confint(model3, level=0.95)

# Exercise 7
# Predict the Life Expectancy for a state where 55% of the population are High School graduates, and the murder rate is 8 per 100,000.
#
predict(model3, data.frame(HS.Grad=55, Murder=8))

# Exercise 8
# 
# Obtain a 98% confidence interval for the mean Life Expectancy in a state where 55% 
#of the population are High School graduates, and the murder rate is 8 per 100,000.
#
formula(model3)
coefficients(model3)

predict(model3, data.frame(HS.Grad=55, Murder=8), interval='confidence', level=0.98)
# Ex9
# Obtain a 98% confidence interval for the Life Expectancy of a person living in a state where 55% of the population are High School graduates, and the murder rate is 8 per 100,000.
#
predict(model3, data.frame(HS.Grad=55, Murder=8), interval='confidence')

# Ex10
# Since our model only has two predictor variables, we can generate 
#a 3D plot of our data and the fitted regression plane. Create this plot.

require(rgl)
# create a DF with all combinations of factor variables of HS.Grad & Murder
plotdat = expand.grid(HS.Grad = seq(34,70,by=2), Murder=seq(1,16,by=1))
summary(plotdat)
plotdat$pred1 = predict(model3, newdata = plotdat)
plotdat$pred1

with(state77, plot3d(HS.Grad, Murder, Life.Exp, col='red', size=2
    ,xlab='High School Grad', ylab='Murder Rate', zlab=' Life Expectancy'
    ,main("3D Scatter Plot "), type='p'))
?plot3d

with(plotdat, surface3d(unique(HS.Grad), unique(Murder), pred1
    , alpha=0.5, front='line', back='line'))
?surface3d

# Misc -----------------
plot(model3)
#http://data.princeton.edu/R/linearModels.html

require(broom)
lmfit <- lm(mpg ~ wt, mtcars)
summary(lmfit)  
tidy(lmfit)
is.data.frame(tidy(lmfit))