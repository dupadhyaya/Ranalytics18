# CHAID - Own eg

set.seed(1234)
gender = sample(c('Male', 'Female'), 200, replace=T,prob = c(0.7,0.3))
gender
set.seed(1234)
play = sample(c('Play', 'NoPlay'), 200, replace=T,prob = c(0.4,0.6))
play
df = data.frame(gender, play)
table(df)
#CART - classification
fit1 = rpart(play ~ gender, data=df)
fit1
# not a good plot
plot(fit1)
text(fit1)
rpart.plot(fit1)
prop.table(table(df))
addmargins(prop.table(table(df)))
predict(fit1, newdata=data.frame(gender=c('Male','Female','Male')))

?rpart::predict.rpart
predict(fit1, newdata=data.frame(gender=c('Male','Female','Male')),
  type='vector')
predict(fit1, newdata=data.frame(gender=c('Male','Female','Male')),
        type='class')
predict(fit1, newdata=data.frame(gender=c('Male','Female','Male')),
        type='vector')
predict(fit1, newdata=data.frame(gender=c('Male','Female','Male')),
        type='prob')
predict(fit1, newdata=data.frame(gender=c('Male','Female','Male')),
        type='vector')
predict(fit1, newdata=data.frame(gender=c('Male','Female','Male')),
        type='matrix')

        
printcp(fit1)
prune(fit1, cp=0.74)
prune(fit1, cp=1)
prune(fit1, cp=0)

library(rattle)
fancyRpartPlot(fit1)
rpart.plot::prp(fit1, type=3)
rpart.plot::prp(fit1, type=1)
rpart.plot::prp(fit1, extra=2)
rpart.plot::prp(fit1, extra=3)
rpart.plot::prp(fit1, extra=4, cex=2)


# Vary min split and see 
fit1a <- rpart(play ~ gender,data=df, 
    control=rpart.control(minsplit=210,minbucket=10, cp=0))
prp(fit1a)

fit1.new = prp(fit1,snip=TRUE)$obj
# some error coming


#----  Chisq
chisq.test(table(df))
#Ho reject: Not Independent : But Dependent : Only Males Play
library(CHAID)
?chaid
df.chaid= CHAID::chaid(play ~ gender, data = df)
plot(df.chaid)

df.chaid = CHAID::chaid(play ~ gender, data=df, 
        control = chaid_control(minprob = 0.001,
        minsplit=10, minbucket = 5))
plot(df.chaid, uniform=T, compress=T, margin=0.4, branch=0.5)

str(df.chaid)
summary(dt.chaid)
# prp will not work here as it is not rpart object










library(party)
ctree1 = party::ctree(play ~ gender, data=df)
plot(ctree1)

set.seed(1111)
marks = sample(c(60,70, 80,90), 200, replace=T,prob = c(0.3,0.4,.2,.1))
marks
df2 = data.frame(gender, play, marks)
ctree2 = party::ctree(marks ~ play + gender, data=df2)
plot(ctree2)
dim(df2)
head(df2)
library(rpart)
library(rpart.plot)
tree2a = rpart::rpart(marks ~ play + gender, data=df2)
tree2a
plot(tree2a)

tree2a = rpart::rpart(marks ~ play + gender, data=df2,
          control=rpart.control(minsplit=4, cp=0.001), method='anova')
tree2a
rpart.plot(tree2a)
library(rattle)
fancyRpartPlot(tree2a)
table(df2$play)
table(df2$play, df2$gender)
prp(tree2a)

tree2a = rpart::rpart(play ~ marks + gender, data=df2,
      control=rpart.control(minsplit=4, cp=0.001))
tree2a
prp(tree2a)
new.tree.1 <- prp(tree2a,snip=TRUE)$obj # interactively trim the tree
prp(new.tree.1) # display the new tree
