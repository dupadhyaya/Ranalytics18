# ROC Characteristics

actual = c(1,1,0,1,0,1,1,0)
#Model1 and Model2 probability values
M1 = c(0.75,0.8,0.4,0.25,0.45,0.35,0.65,0.15)
M2 = c(0.9,0.85,0.15,0.45,0.05,0.45,0.7,0.2)
(m=cbind(actual,M1,M2))

#threshold values T1
T1=0.5
predictM1T1 = ifelse(M1 > T1,1,0)
predictM2T1 = ifelse(M2 > T1,1,0)
(m1 = cbind(m, predictM1T1, predictM2T1))
#crosstable of actual vs predicted for each model
(t111= table(m1[,1],m1[,4]))  #xtable actual vs predict 1
(t211 = table(m1[,1],m1[,5]))

(ma = matrix(c('tp','fp','fn','tn'),nrow=2))
# tp – True Positive
# fp – False Positive
# fn – False Negative
# tn – True Negative
# 
# Accuracy = (tp+tn)/Total
(accuracy = sum(diag(t111))/ sum(t111))
# True Positive Rate (tpr) = tp/(tp+fn)
(tpr = t111[1,1]/sum(t111[1,1] + t111[2,2]))
(tpr = t111[1,1]/sum(diag(t111)))

# False Positive Rate (fpr) = fp/(tn+fp)

# Sensitivity (Recall) = tpr

# Specificity = tnr = tn/(fp+tn)


#library caret - easier way to do: pass table to function
library(caret)
caret::confusionMatrix(table(m1[,1],m1[,4]))
caret::confusionMatrix(table(m1[,1],m1[,5]))
caret::confusionMatrix(t111)
caret::confusionMatrix(t211)


#Different threshold T2=1
#2nd Stage
T2=1
predictM1T2 = ifelse(M1 > T2,1,0)
predictM2T2 = ifelse(M2 > T2,1,0)
(m2 = cbind(m, predictM1T2, predictM2T2))
#crosstable of actual vs predicted for each model
(t122= table(m2[,1],m2[,4]))  #xtable actual vs predict 1
# no value for column 1 (predicted); actual has
(t222 = table(m2[,1],m2[,5]))
caret::confusionMatrix(t122) #does not work becos no 2nd col
caret::confusionMatrix(table(m2[,1],m2[,4]))
# this threshold values does not classify well so will be for value of T=0

#3rd threshold values = 0.8
T3=0.8
predictM1T3 = ifelse(M1 > T3,1,0)
predictM2T3 = ifelse(M2 > T3,1,0)
(m3 = cbind(m, predictM1T3, predictM2T3))
#crosstable of actual vs predicted for each model
(t133= table(m3[,1],m3[,4]))  #xtable actual vs predict 1
# no value for column 1 (predicted); actual has
(t233 = table(m3[,1],m3[,5]))
caret::confusionMatrix(t133) #does not work becos no 2nd col
caret::confusionMatrix(t233)
# this threshold values does not classify well so will be for value of T=0

#4th threshold value = 0.3
T4=0.3
predictM1T4 = ifelse(M1 > T4,1,0)
predictM2T4 = ifelse(M2 > T4,1,0)
(m4 = cbind(m, predictM1T4, predictM2T4))
#crosstable of actual vs predicted for each model
(t144= table(m4[,1],m4[,4]))  #xtable actual vs predict 1
# no value for column 1 (predicted); actual has
(t244 = table(m4[,1],m4[,5]))
caret::confusionMatrix(t144) 
caret::confusionMatrix(t244)

#what is the right value
