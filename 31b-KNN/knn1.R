# KNN algo Analytics Vidya
#https://www.analyticsvidhya.com/blog/2015/08/learning-concept-knn-algorithms-programming/
prc = read.csv(file=file.choose(), stringsAsFactors = F)
head(prc)
str(prc)
prc = prc[-1] # remove id column
str(prc)
table(prc$diagnosis_result) # table of cancer diagnosis Malignant or Benign 
prc$diagnosis = factor(prc$diagnosis_result,level=c('B','M'), labels=c('Benign','Malignant'))
str(prc)
prc[1:10,c('diagnosis_result','diagnosis')]
prc[1:10,c(1,10)]
table(prc$diagnosis)
round(prop.table(table(prc$diagnosis))*100,digits=1)

#Normalising Data

normalise <- function(x) {
  (x - min(x))/ (max(x) - min(x))
}
a = normalise(prc$radius)
prc_n = as.data.frame(lapply(prc[2:9],normalise))
head(prc_n)
summary(prc_n$radius) # data has been normalised Min is 0, Max is 1, Median 0.5, Mean may vary
summary(prc_n)

# Divide the data into Training and Test Data
prc_train = prc_n[1:65,] # all columns to be included
prc_test = prc_n[66:100,]
# Extract labels from prc
prc_train_labels = prc[1:65,1]
prc_test_labels = prc[66:100,1]
prc_train_labels;prc_test_labels

# Training the Model
library(class)
prc_test_pred = knn(train= prc_train, test=prc_test, cl = prc_train_labels, k=10) # k = sqrt(obsvn=100)
prc_test_pred
data.frame(prc_test_labels,prc_test_pred) # compare the output

# Evaluate
library(gmodels)
CrossTable(x=prc_test_labels, y = prc_test_pred, prop.chisq = F) # Confusion Matrix
# B-B : 7 ; M:M- 15 - correct prediction 7 + 15 = 22 out of 35
(accuracy = 22/35)

# Improving Algorithm
# Training the Model
prc_test_pred1 = knn(train= prc_train, test=prc_test, cl = prc_train_labels, k=5) # k = sqrt(obsvn=100)
prc_test_pred1
data.frame(prc_test_labels,prc_test_pred1) # compare the output

# Evaluate
CrossTable(x=prc_test_labels, y = prc_test_pred1, prop.chisq = F) # Confusion Matrix
# B-B : 9 ; M:M- 15 - correct prediction 9 + 15 = 24 out of 35
(accuracy1 = 24/35)

# Training the Model
#k  is therefore just the number of neighbors "voting" on the test example's class.
# if k=1, class of the training sample, k=3, mode of 3 closest samples
prc_test_pred2 = knn(train= prc_train, test=prc_test, cl = prc_train_labels, k=3) # k = sqrt(obsvn=100)
prc_test_pred2
data.frame(prc_test_labels,prc_test_pred2) # compare the output

# Evaluate
CrossTable(x=prc_test_labels, y = prc_test_pred2, prop.chisq = F ) # Confusion Matrix
# B-B : 7 ; M:M- 15 - correct prediction 7 + 15 = 22 out of 35
(accuracy2 = 22/35) # no more improvement



