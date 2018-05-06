# ROC Area : 2 models
#uc-r.github.i/logistic_regression#multi

library(tidyverse) # formating output
library(ISLR)
data("Default")
head(Default)

df2 = Default
#convert default to binary coded : No-0, Yes-1
df2$default = ifelse(df2$default=='No',0,1)
head(df2$default)
#train Data
set.seed(100)
index = sample(0:nrow(df2), .6 * nrow(df2), replace=F)
index
df2Train = df2[index,]

#test Data
df2Test = df2[-index,]
nrow(df2Train) ; nrow(df2Test)

names(df2)
summary(df2)
#Models on Train Data
rocmodel1 = glm(default ~ balance, data=df2Train, family='binomial')
rocmodel2 = glm(default ~ student, data=df2Train, family='binomial')
rocmodel3 = glm(default ~ balance + income + student, data=df2Train, family='binomial')
tidy(rocmodel1)
tidy(rocmodel2)
tidy(rocmodel3)

#Model Evaluation and Comparison
#ANOVA----
anova(rocmodel1, rocmodel3, test='Chisq') #1 < 2 for variables
#M3 is better as pvalue < 0.05
#McFadden : Pseudo R2 ----
list(M1=pscl::pR2(rocmodel1)['McFadden'],
     M2=pscl::pR2(rocmodel2)['McFadden'],
     M3=pscl::pR2(rocmodel3)['McFadden'])
#M3 has highest value > -.4 


#Apply models to Test Data
test.predicted.m1 = predict(rocmodel1, newdata= df2Test, type='response')
test.predicted.m2 = predict(rocmodel2, newdata= df2Test, type='response')
test.predicted.m3 = predict(rocmodel3, newdata= df2Test, type='response')

#now compare the outputs by making confusion matrix 
list(M1 = table(df2Test$default, test.predicted.m1 > 0.5) %>% prop.table,
     M2 = table(df2Test$default, test.predicted.m2 > 0.5) %>% prop.table,
     M3 = table(df2Test$default, test.predicted.m3 > 0.5) %>% prop.table)
#M2 does not predict default cases (1) accurately
#M1 & M3 are almost same
#let us understand misclassification rate instead of accuracy
options(digits=4)
head(test.predicted.m1)
head(df2Test)
df2Test %>% 
  mutate(m1.pred = ifelse(test.predicted.m1 > 0.5, 1, 0), 
         m2.pred = ifelse(test.predicted.m2 > 0.5, 1, 0), 
         m3.pred = ifelse(test.predicted.m3 > 0.5, 1, 0)) %>%
  summarise(m1.error = mean(default != m1.pred),
            m2.error = mean(default != m2.pred),
            m3.error = mean(default != m3.pred))

head(df2Test)
table(df2Test$default, test.predicted.m1 > 0.5) %>% addmargins()
table(df2Test$default, test.predicted.m1 > 0.5) %>% prop.table  %>% addmargins()

#Plots
library(ROCR)
par(mfrow=c(1,3))
prediction(test.predicted.m1, df2Test$default) %>% performance(measure = 'tpr', x.measure = 'fpr') %>% plot()
prediction(test.predicted.m2, df2Test$default) %>% performance(measure = 'tpr', x.measure = 'fpr') %>% plot()
prediction(test.predicted.m3, df2Test$default) %>% performance(measure = 'tpr', x.measure = 'fpr') %>% plot()

#AUC
prediction(test.predicted.m1, df2Test$default) %>% performance(measure='auc') %>% .@y.values
#M1 has larger AUC : better
prediction(test.predicted.m2, df2Test$default) %>% performance(measure='auc') %>% .@y.values
prediction(test.predicted.m3, df2Test$default) %>% performance(measure='auc') %>% .@y.values
#M1 & M3 are almost same

model1 = glm(default1 ~ balance + income + student, data=dfTrain, family='binomial')
model1
caret::varImp(model1)