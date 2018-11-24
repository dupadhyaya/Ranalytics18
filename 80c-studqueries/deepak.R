#####################################
#####Author Deepak Sharma###########
#####Date 15 Sep 2018###############
##### The File inlcude 
#######Data Processing (Outlier and Missing Values analysis)#####
#######Build Decison Tree, Random Forest, Logistic Regression, K-Nearest Neighbour and KMeans Clustering

#Clearing the memory
rm(list=ls(all=T))

#Setting the working directory
setwd("E:/CodeSample/MarketingCampaign")

#Load Libraries
x = c("ggplot2", "corrgram", "DMwR", "caret", "randomForest", "unbalanced", "C50", "dummies", "e1071", "Information",
      "MASS", "rpart", "gbm", "ROSE", 'sampling', 'DataCombine', 'inTrees')

#install.packages(x)
lapply(x, require, character.only = TRUE)
rm(x)

## Read the data
marketing_train = read.csv("marketing.csv", header = T, na.strings = c(" ", "", "NA"))

###########################################Explore the data##########################################
str(marketing_train)

## Univariate Analysis and Variable Consolidation
marketing_train$schooling[marketing_train$schooling %in% "illiterate"] = "unknown"
marketing_train$schooling[marketing_train$schooling %in% c("basic.4y","basic.6y","basic.9y","high.school","professional.course")] = "high.school"
marketing_train$default[marketing_train$default %in% "yes"] = "unknown"
marketing_train$default = as.factor(as.character(marketing_train$default))
marketing_train$marital[marketing_train$marital %in% "unknown"] = "married"
marketing_train$marital = as.factor(as.character(marketing_train$marital))
marketing_train$month[marketing_train$month %in% c("sep","oct","mar","dec")] = "dec"
marketing_train$month[marketing_train$month %in% c("aug","jul","jun","may","nov")] = "jun"
marketing_train$month = as.factor(as.character(marketing_train$month))
marketing_train$loan[marketing_train$loan %in% "unknown"] = "no"
marketing_train$loan = as.factor(as.character(marketing_train$loan))
marketing_train$schooling = as.factor(as.character(marketing_train$schooling))
marketing_train$profession[marketing_train$profession %in% c("management","unknown","unemployed","admin.")] = "admin."
marketing_train$profession[marketing_train$profession %in% c("blue-collar","housemaid","services","self-employed","entrepreneur","technician")] = "blue-collar"
marketing_train$profession = as.factor(as.character(marketing_train$profession))

##################################Missing Values Analysis###############################################
missing_val = data.frame(apply(marketing_train,2,function(x){sum(is.na(x))}))
missing_val$Columns = row.names(missing_val)
names(missing_val)[1] =  "Missing_percentage"
missing_val$Missing_percentage = (missing_val$Missing_percentage/nrow(marketing_train)) * 100
missing_val = missing_val[order(-missing_val$Missing_percentage),]
row.names(missing_val) = NULL
missing_val = missing_val[,c(2,1)]

#Writing the csv file at local machine
write.csv(missing_val, "Missing_perc.csv", row.names = F)

# ggplot(data = missing_val[1:3,], aes(x=reorder(Columns, -Missing_percentage),y = Missing_percentage))+
#   geom_bar(stat = "identity",fill = "grey")+xlab("Parameter")+
#   ggtitle("Missing data percentage (Train)") + theme_bw()

#Mean Method
#marketing_train$custAge[is.na(marketing_train$custAge)] = mean(marketing_train$custAge, na.rm = T)

#Median Method
#marketing_train$custAge[is.na(marketing_train$custAge)] = median(marketing_train$custAge, na.rm = T)

# Using kNN to impute missing Values 
marketing_train = knnImputation(marketing_train, k = 3)
#sum(is.na(marketing_train))

#write.csv(marketing_train, 'marketing_train_missing.csv', row.names = F)

##Data Manupulation; convert string categories into factor numeric
for(i in 1:ncol(marketing_train)){
  
  if(class(marketing_train[,i]) == 'factor'){
    
    marketing_train[,i] = factor(marketing_train[,i], labels=(1:length(levels(factor(marketing_train[,i])))))
    
  }
}


############################################Outlier Analysis#############################################
# ## BoxPlots - Distribution and Outlier Check
numeric_index = sapply(marketing_train,is.numeric) #selecting only numeric

numeric_data = marketing_train[,numeric_index]

cnames = colnames(numeric_data)
# 
# for (i in 1:length(cnames))
# {
#   assign(paste0("gn",i), ggplot(aes_string(y = (cnames[i]), x = "responded"), data = subset(marketing_train))+ 
#            stat_boxplot(geom = "errorbar", width = 0.5) +
#            geom_boxplot(outlier.colour="red", fill = "grey" ,outlier.shape=18,
#                         outlier.size=1, notch=FALSE) +
#            theme(legend.position="bottom")+
#            labs(y=cnames[i],x="responded")+
#            ggtitle(paste("Box plot of responded for",cnames[i])))
# }
# 
# ## Plotting plots together
# gridExtra::grid.arrange(gn1,gn5,gn2,ncol=3)
# gridExtra::grid.arrange(gn6,gn7,ncol=2)
# gridExtra::grid.arrange(gn8,gn9,ncol=2)
# 
# # #Remove outliers using boxplot method
# df = marketing_train
# marketing_train = df
# 
# val = marketing_train$previous[marketing_train$previous %in% boxplot.stats(marketing_train$previous)$out]
# 
# marketing_train = marketing_train[which(!marketing_train$previous %in% val),]
#                                   
# # #loop to remove from all variables
# for(i in cnames){
#   print(i)
#   val = marketing_train[,i][marketing_train[,i] %in% boxplot.stats(marketing_train[,i])$out]
#   #print(length(val))
#   marketing_train = marketing_train[which(!marketing_train[,i] %in% val),]
# }
# 
# #Replace all outliers with NA and impute
# #create NA on "custAge
# for(i in cnames){
#   val = marketing_train[,i][marketing_train[,i] %in% boxplot.stats(marketing_train[,i])$out]
#   #print(length(val))
#   marketing_train[,i][marketing_train[,i] %in% val] = NA
# }
# 
# marketing_train = knnImputation(marketing_train, k = 3)

##################################Feature Selection################################################
## Correlation Plot 
corrgram(marketing_train[,numeric_index], order = F,
         upper.panel=panel.pie, text.panel=panel.txt, main = "Correlation Plot")

## Chi-squared Test of Independence
factor_index = sapply(marketing_train,is.factor)
factor_data = marketing_train[,factor_index]

for (i in 1:10)
{
  print(names(factor_data)[i])
  print(chisq.test(table(factor_data$responded,factor_data[,i])))
}

## Dimension Reduction
marketing_train = subset(marketing_train, 
                         select = -c(pdays,emp.var.rate,day_of_week, loan, housing))

##################################Feature Scaling################################################
#Normality check
qqnorm(marketing_train$custAge)
hist(marketing_train$campaign)

#Normalisation - Bringing the scale between 0 and 1
cnames = c("custAge","campaign","previous","cons.price.idx","cons.conf.idx","euribor3m","nr.employed",
           "pmonths","pastEmail")

for(i in cnames){
  print(i)
  marketing_train[,i] = (marketing_train[,i] - min(marketing_train[,i]))/
    (max(marketing_train[,i] - min(marketing_train[,i])))
}

# #Standardisation
# for(i in cnames){
#   print(i)
#   marketing_train[,i] = (marketing_train[,i] - mean(marketing_train[,i]))/
#                                  sd(marketing_train[,i])
# }

#############################################Sampling#############################################
# ##Simple Random Sampling
# data_sample = marketing_train[sample(nrow(marketing_train), 4000, replace = F), ]
# 
# ##Stratified Sampling
# stratas = strata(marketing_train, c("profession"), size = c(100, 199, 10, 5), method = "srswor")
# stratified_data = getdata(marketing_train, stratas)
# 
# ##Systematic sampling
# #Function to generate Kth index
# sys.sample = function(N,n){
#   k = ceiling(N/n)
#   r = sample(1:k, 1)
#   sys.samp = seq(r, r + k*(n-1), k)
# }
# 
# lis = sys.sample(7414, 400) #select the repective rows
# 
# #Create index variable in the data
# marketing_train$index = 1:7414
# 
# #Extract subset from whole data
# systematic_data = marketing_train[which(marketing_train$index %in% lis),]

###################################Model Development#######################################
#Clean the environment
rmExcept("marketing_train")

#Divide data into train and test using stratified sampling method
set.seed(1234)
train.index = createDataPartition(marketing_train$responded, p = .80, list = FALSE)
train = marketing_train[ train.index,]
test  = marketing_train[-train.index,]

##Decision tree for classification
#Develop Model on training data
C50_model = C5.0(responded ~., train, trials = 100, rules = TRUE)

#Summary of DT model
summary(C50_model)

#write rules into disk
write(capture.output(summary(C50_model)), "c50Rules.txt")

#Lets predict for test cases
C50_Predictions = predict(C50_model, test[,-17], type = "class")

##Evaluate the performance of classification model
ConfMatrix_C50 = table(test$responded, C50_Predictions)
confusionMatrix(ConfMatrix_C50)

#False Negative rate
FNR = FN/FN+TP 



###Random Forest
RF_model = randomForest(responded ~ ., train, importance = TRUE, ntree = 500)

#Extract rules fromn random forest
#transform rf object to an inTrees' format
# treeList = RF2List(RF_model)  
# 
# #Extract rules
# exec = extractRules(treeList, train[,-17])  # R-executable conditions
# 
# #Visualize some rules
# exec[1:2,]
# 
# #Make rules more readable:
# readableRules = presentRules(exec, colnames(train))
# readableRules[1:2,]
# 
# #Get rule metrics
# ruleMetric = getRuleMetric(exec, train[,-17], train$responded)  # get rule metrics
# 
# #evaulate few rules
# ruleMetric[1:2,]

#Presdict test data using random forest model
RF_Predictions = predict(RF_model, test[,-17])

##Evaluate the performance of classification model
ConfMatrix_RF = table(test$responded, RF_Predictions)
confusionMatrix(ConfMatrix_RF)

#False Negative rate
FNR = FN/FN+TP 


#Logistic Regression
logit_model = glm(responded ~ ., data = train, family = "binomial")

#summary of the model
summary(logit_model)

#predict using logistic regression
logit_Predictions = predict(logit_model, newdata = test, type = "response")

#convert prob
logit_Predictions = ifelse(logit_Predictions > 0.5, 1, 0)


##Evaluate the performance of classification model
ConfMatrix_RF = table(test$responded, logit_Predictions)

#False Negative rate
FNR = FN/FN+TP 


##KNN Implementation
library(class)

#Predict test data
KNN_Predictions = knn(train[, 1:16], test[, 1:16], train$responded, k = 7)

#Confusion matrix
Conf_matrix = table(KNN_Predictions, test$responded)

#Accuracy
sum(diag(Conf_matrix))/nrow(test)

#False Negative rate
FNR = FN/FN+TP 

#naive Bayes
library(e1071)

#Develop model
NB_model = naiveBayes(responded ~ ., data = train)

#predict on test cases #raw
NB_Predictions = predict(NB_model, test[,1:16], type = 'class')

#Look at confusion matrix
Conf_matrix = table(observed = test[,17], predicted = NB_Predictions)
confusionMatrix(Conf_matrix)


#statical way
mean(NB_Predictions == test$responded)

#Kmeans implementation
irisCluster <- kmeans(train[,1:16], 2, nstart = 20)

table(irisCluster$cluster, train$responded)


