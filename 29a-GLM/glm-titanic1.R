# R Bloggers Site
#Log Regression 2
training.data.raw <- read.csv('./../../rDataSets/titanic/train.csv',header=T,na.strings=c(""))

sapply(training.data.raw,function(x) sum(is.na(x)))

sapply(training.data.raw, function(x) length(unique(x)))

library(Amelia)
Amelia::missmap(training.data.raw, main = "Missing values vs observed")

data <- subset(training.data.raw,select=c(2,3,5,6,7,8,10,12))

data$Age[is.na(data$Age)] <- mean(data$Age,na.rm=T)

is.factor(data$Sex)
is.factor(data$Embarked)
unique(data$Sex)
contrasts(data$Sex)

unique(data$Embarked) 
contrasts(data$Embarked)

data <- data[!is.na(data$Embarked),]
rownames(data) <- NULL

# Split the data in order
train <- data[1:800,]
test <- data[801:889,]

model <- glm(Survived ~.,family=binomial(link='logit'),data=train)
log(2e-16)
exp(5.45e-06)
summary(model)

anova(model, test="Chisq")
