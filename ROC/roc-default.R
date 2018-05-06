
library(ISLR)
data("Default")
head(Default)

df = Default
#convert default to binary coded : No-0, Yes-1
df$default1 = ifelse(df$default=='No',0,1)
#or
df$default2 = factor(df$default, levels = c('No','Yes'), labels=c(0,1))
summary(df)

#plot sigmoid curve
library(tidyverse)
library(ggplot2)
df %>% ggplot(aes(balance, default1))+ geom_point(alpha=.15) + geom_smooth(method='glm', method.args=list(family='binomial')) + ylab("Prob of Default")


head(df$default1)
#train Data
set.seed(100)
index = sample(0:nrow(df), .7 * nrow(df), replace=F)
index
dfTrain = df[index,]

#test Data
dfTest = df[-index,]
nrow(dfTrain) ; nrow(dfTest)

names(df)
summary(df)
#Model on Train Data
model1 = glm(default1 ~ balance + income + student, data=dfTrain, family='binomial')
model1
caret::varImp(model1)

exp(coef(model1))

#sample case :
balance=1500 ; income= 40000 ; student=1
c= as.numeric(coef(model1))
c[1:4]
(ex = exp( c[1] + balance * c[2] + income * c[3] + student * c[4]))  #student
ex/(1+ex)
(ex = exp( c[1] + balance * c[2] + income * c[3] + 0 * c[4]))  #Non student
ex/(1+ex)
ex/(1+ex)/2


#predict 
(new1 = data.frame(balance=1500, income= 40000, student=c('Yes','No')))
predict(model1, newdata = new1, type='response')
#same values as above manual calc
#being student, prob of default decreases by 50%

p1 = predict(model1, newdata = dfTest, type='response')
head(p1)

#model fitness
pscl::pR2(model1)['McFadden']
#good fit > .3

broom::augment(model1)
library(broom)
model1_data <- augment(model1) %>% mutate(index= 1:n())
ggplot(model1_data, aes(index, .std.resid, color=default1)) + geom_point(alpha=.5) + geom_abline(h=3)
plot(model1, which=4, id.n=15)

df[c(4160,652,9539, 9874, 9523),]  #influential values top5

