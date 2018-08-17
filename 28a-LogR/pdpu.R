#logisitic regression

library(ISLR)
?Default
data(Default)
head(Default,n=30)
str(Default)
head(Default[Default$default=='Yes',])

table(Default$student)
table(Default$default)
t1=table(Default$default, Default$student)
addmargins(t1)
addmargins(t1, FUN = mean)


library(dplyr)
Default %>% group_by(student, default) %>% summarise(n())
Default %>% group_by(student, default) %>% summarise(mean(income), mean(balance))

?glm

#logistic model
logit1 = glm(default ~ income + balance + student, family='binomial', data=Default)

#output is different from linear regression
#predict prob from 0 to 1
summary(logit1)

#are all IV signicant - No (income)
logit2 = glm(default ~ balance + student, family='binomial', data=Default)
summary(logit2)

(ndata1 = data.frame(balance = mean(Default$balance), student="Yes"))
(p1=predict(logit2, newdata = ndata1, type='response') )

(ndata1 = data.frame(balance = 1486, student="Yes"))
(p1=predict(logit2, newdata = ndata1, type='response') )
