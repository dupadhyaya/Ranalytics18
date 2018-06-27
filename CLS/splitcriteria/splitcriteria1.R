#Decision Tree - CART - Gini Index
# Gini Index

library(rpart)
library(rpart.plot)

graduate=c('Yes','No' ,'No', 'Yes','No','No', 'Yes','No','No','No')
married=c('S','M','S','M','D','M','D','S','M','S')
income=c(125,100,70, 120, 95, 60, 220, 85, 75, 90)
buy=c('No','No','No','No','Yes','No','No','Yes','No','Yes')
(train= data.frame(graduate, married, income, buy))

#uploading datat
mytrain %>%  gs_ws_new(ws_title = "sample", input = train,  trim = TRUE, verbose = FALSE)


#rpart(y~x+z, data=df, parms=list(split='gini'))
library(rpart)

fit1a = rpart(cheat ~ married + refund, data=train, parms=list(split='gini'),  minsplit=4, minbucket=2, cp=-1)
fit1a
rpart.plot(fit1a)

#Split on Married or Refund : why : Gini index
t1a=table(cheat, married)
addmargins(t1a)
#CART has only binary split, so one of labels of married has to be combined with other
(m1 = matrix(c(4,0,3,3), byrow=F, nrow=2, dimnames=list(c('No','Yes'), c('M','SD'))))
#Gini Index
#Married M
(GMM = 1 - (4/4)^2 - (0/4)^2 )
(GMSD = 1 - (3/6)^2 - (3/6)^2)
(Gmarried = (4/10) * GMM + (7/10)* GMSD)
#Refund R
(t1b = table(cheat, refund))
(GRN = 1 - (4/7)^2 - (3/4)^2)
(GRY = 1 - (3/3)^2 - (0/3)^2)
(Grefund = (7/10) * GRN + (3/10)* GRY)
(GIM = 1 - Gmarried) ; (GIR = 1 - Grefund)
#married has lower value of GI, so married columns selected

(t1b = table(cheat, income)) # not done this way
income2 = ifelse(income < 78, 'Yes', 'No')
(t1b2 = table(cheat, income2)) # this way
(GIY = 1 - (4/7)^2 - (3/4)^2)
(GIN = 1 - (3/3)^2 - (0/3)^2)
(Gincome = (7/10)*GIY + (3/10)*GIN)
(GII = 1 - Gincome)
paste(GIM, GIR, GII, sep= ' ')
min(GIM, GIR, GII)
#Gini Index married column is least


fit2a = rpart(cheat ~ ., data=train, method='class', parms=list(split='gini'),  minsplit=2, minbucket=1, cp=-1)
fit2a
rpart.plot(fit2a)



fit2b = rpart(cheat ~ ., data=train, method= 'class', parms =   list(split='information'),  minsplit=2, minbucket=1, cp=-1 )
fit2b
rpart.plot(fit2b, nn=T)

fit3a = rpart(income ~ ., data=train, method= 'anova', parms =  list(split='gini'),  minsplit=2, minbucket=1, cp=-1 )
fit3a
rpart.plot(fit3a)

fit3b = rpart(income ~ ., data=train, method= 'anova', parms =  list(split='information'),  minsplit=2, minbucket=1, cp=-1 )
fit3b
rpart.plot(fit3b, nn=T)


library(ineq)
ineq(cheat,type = c("Gini"), na.rm = TRUE)
Gini(x, corr = FALSE, na.rm = TRUE)

library(ineq)
your_data = train
coeff= NULL
for (i in colnames(your_data[])){
  coeff= c(coeff,round(ineq(your_data[,i],type = 'Gini'),4))
}
coeff
data_coeff = data.frame(cbind(coeff,colnames(your_data[,-1])))
colnames(data_coeff) = c("Coeff","Colnames")
data_coeff
If you want it by for each rows try this :
  
  your_new_data = as.data.frame(t(your_data[,-1]), row.names =T)

colnames(your_new_data) = your_data[,1]









library(lawstat)
data(popdata)
gini.index(popdata[,"pop1900"])
gini.index(popdata[,"pop1972"])
gini.index(income)
gini.index(married)
gini.index(refund)

library(DescTools)

Gini(names(t1),t1)

library(rpart)
fit1 = rpart(cheat ~ ., data=train)
fit1
library(rpart.plot)
rpart.plot(fit1)
