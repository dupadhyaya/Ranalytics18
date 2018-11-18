#Gini Index
student = c('Yes', 'Yes','Yes','No','No','No','No', 'Yes','No')
length(student)
hostel = c(T,T,F,F,T,T,F,T,T)
length(hostel)
target = c('Yes','Yes','No','Yes','No','No','No', 'Yes','No')
length(target)

(df = data.frame(student, hostel, target))
str(df)
#Gini Index
table(df$target)
(gini_target = 1 - ((5/9)^2 + (4/9)^2))
#1 - 41/81 = 59/81
# 0.49

#Gini Index
table(df$student, df$target)
xtabs(~ student + target, data = df)
(gini_NonStudent_Target = 1 - ((4/5)^2 + (1/5)^2))  #8/25
(gini_Student_Target = 1 - ((1/4)^2 + (3/4)^2)) #3/8
table(df$student)
(gini_Student = gini_target - ((5/9)* gini_NonStudent_Target + (4/9) * gini_Student_Target))
#0.149

#Gini Index - hostel
table(df$hosel, df$target)
xtabs(~ hostel + target, data = df)
(gini_NonHostel_Target = 1 - ((2/3)^2 + (1/3)^2))  # 4/9
(gini_Hostel_Target = 1 - ((3/6)^2 + (3/6)^2)) # 1/2
table(df$hostel)
(gini_Hostel = gini_target - ((3/9)* gini_NonHostel_Target + (6/9) * gini_Hostel_Target))
#0.012
gini_Student > gini_Hostel
#higher Gain by Student Variable, best splitting variable

#check by rpart
library(rpart)
library(rpart.plot)
(dt_rpart1 = rpart(target ~ student + hostel, data=df))
#no splitting

(dt_rpart2 = rpart(target ~ student + hostel, data=df, cp=-1, minsplit=2))
rpart.plot(dt_rpart2)
#splitting by student
dt_rpart2$variable.importance
summary(dt_rpart2)

info.gain.rpart(dt_rpart) #
rc1 = rpart.control(cp = 0.005, minsplit=2, minbucket = 1,maxcompete = 2, maxdepth = 1)
(dt_rpart3 = rpart(target ~ student + hostel, data=df, control=rc1))
rpart.plot(dt_rpart3)


#randomForest
library(randomForest)
(dt_rf = randomForest(target ~ student + hostel, data=df))
importance(dt_rf)
varImpPlot(dt_rf,type=2)


edarf::variable_importance(dt_rf, data=df)

library(caret)
head(df)
dt_caret = train( target ~ student + hostel, data=df,method="rpart", cp=-1)
dt_caret

library(CHAID)
dt_chaid = chaid(target ~ hostel + student, data=df)
dt_chaid
plot(dt_chaid)

library(party)
dt_party = ctree(target ~ hostel + student, data=df)
dt_party
plot(dt_party)

#https://cran.r-project.org/web/packages/rpart/vignettes/longintro.pdf

df_mtcars = rpart(am ~ ., data=mtcars)
df_mtcars
df_mtcars$variable.importance

