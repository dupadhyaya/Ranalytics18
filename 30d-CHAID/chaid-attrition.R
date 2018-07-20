# CHAID - multiple splits

library(CHAID)
library(rsample)
library(plyr)
library(dplyr)

attrition %>% select_if(is.factor) %>% ncol
## [1] 15
attrition %>% select_if(is.numeric) %>% ncol
## [1] 16

attrition %>%  select_if(function(col) length(unique(col)) <= 5 & is.integer(col)) %>%   head

attrition %>%  select_if(function(col) length(unique(col)) <= 10 & is.integer(col)) %>%   head


#


















#create a data set
income = floor(runif(1000, 50, 100))
gender = sample(c('M','F'), size=1000, replace=T, prob=c(.6,.4))
married = sample(c('Married','Single', 'Divorce'), size=1000, replace=T, prob=c(.3,.4,.3))
buy = sample(c('Buy','DontBuy'), size=1000, replace=T, prob=c(.6,.4))

df = data.frame(income, gender, married, buy)
head(df)
str(df)
fcols = c('income','gender', 'married', 'buy')
df[fcols] = lapply(df[fcols], factor)
lapply(df,class)

table(df$gender, df$buy)

#Run the model
chaidmodel_1 = chaid(buy ~ gender + married + income, data=df)
#summary(chaidmodel_1)
print(chaidmodel_1)
plot(chaidmodel_1)

#no plot or tree: some control parameters to be modified

#Modify the parameters
ctrl_1 = chaid_control(minsplit = 10, minprob = 0.01)
chaidmodel_2 = chaid(buy ~ incomee + gender + married, data=df, control = ctrl_1)
plot(chaidmodel_2)
print(chaidmodel_2)

chaidmodel = chaid(buy ~ ., data=df)
?chaid


#https://www.r-bloggers.com/chaid-and-r-when-you-need-explanation-may-15-2018/
require(rsample)
data(attrition)
str(attrition)
names(attrition)
