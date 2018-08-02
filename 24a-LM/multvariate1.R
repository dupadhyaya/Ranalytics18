# Linear Modeling http://data.princeton.edu/R/readingdata.html

fpe <- read.table("http://data.princeton.edu/wws509/datasets/effort.dat")
names(fpe)
str(fpe)
boxplot(fpe$setting,  col='lavender')
attach(fpe)
plot(effort, change,pch=21, bg='gold')
title('Scatter Plot of change vs Effort', col.main='#3366CC')
identify(effort, change, row.names(fpe), ps=9)
row.names(fpe)
fpe
pairs(fpe)

# Linear Model
lmfit = lm(change ~ setting + effort)
lmfit
(lmfit2 = lm(change ~ setting:effort))
(lmfit3 = lm(change ~ setting * effort))
summary(lmfit)
summary(lmfit, correlation = T)
anova(lmfit)
plot(lmfit)
fitted(lmfit)
coef(lmfit)
residuals(lmfit)
# Factors & Covariates
unique(effort)
(effortg = cut(effort, breaks = c(-1,4,14,100)))
effortg = cut(effort, breaks = c(-1,4,14,100), label=c('weak', 'moderate', 'strong'))
effortg # <4, 4-15, > 15 : weak, moderate, strong
covfit = lm(change ~ setting + effortg)
covfit
options(contrasts=c('contr.treatment','contr.poly'))

anova(covfit)
lm(change ~ log(setting) + effort)

lm(change ~ poly(setting,3) + effort)

library(splines)
setting.bs = bs(setting, knots = c(66,74,84))
setting.bs

setting.ns = ns(setting, df=5)
setting.ns
splinefit = lm(change ~ ns(setting, knot = median(setting)) + 
                 ns(effort, knot = median(effort)))
splinefit


# Other Options
X = cbind(1, effort, setting)
X
solve(t(X)  %*%  X ) %*% t(X) %*% change

# GLM
cuse <- read.table("http://data.princeton.edu/wws509/datasets/cuse.dat", header=TRUE)
cuse
attach(cuse)
lrfit = glm(cbind(using, notUsing) ~ age + education + wantsMore, family = binomial)
lrfit
(noMore = wantsMore== 'no')
hiEduc = education == 'high'
hiEduc

glm( cbind(using, notUsing) ~ age + hiEduc + noMore, family = binomial)
1- pchisq(29.92,10)

lrfit = glm(cbind(using, notUsing) ~ age * noMore + hiEduc, family = binomial)
lrfit
summary(lrfit)

# Updating Models
lrfit0 = update(lrfit, ~. - age:noMore)
anova(lrfit0, lrfit)

anova(lrfit, test='Chisq')

# Model Selection
drop1(lrfit, test='Chisq')

add1(lrfit, ~. ^2, test='Chisq')
search = step(lrfit, ~ . ^2)  # ???
str(cuse)
?step
