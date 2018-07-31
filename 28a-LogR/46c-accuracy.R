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
(t121= table(m1[,1],m1[,4]))  #xtable actual vs predict 1
(t221 = table(m1[,1],m1[,5]))

(ma = matrix(c('tp','fp','fn','tn'),nrow=2))
# tp – True Positive
# fp – False Positive
# fn – False Negative
# tn – True Negative
# 
# Accuracy = (tp+tn)/Total
(accuracy = sum(diag(t12))/ sum(t12))
# True Positive Rate (tpr) = tp/(tp+fn)
(tpr = t121[1,1]/sum(t121[1,1] + t121[2,2]))
(tpr = t121[1,1]/sum(diag(t121)))

# False Positive Rate (fpr) = fp/(tn+fp)

# Sensitivity (Recall) = tpr

# Specificity = tnr = tn/(fp+tn)


#library caret - easier way to do: pass table to function
library(caret)
caret::confusionMatrix(table(m1[,1],m1[,4]))
caret::confusionMatrix(table(m1[,1],m1[,5]))
caret::confusionMatrix(t121)
caret::confusionMatrix(t221)


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


#4th threshold value = 0.5


#what is the right value
