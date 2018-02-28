###

#install.packages("party")
library(party)
#install.packages("partykit")
library(partykit)

##Read the data in the file
cust_data<-read.csv("./data/NPS Data Food Order v01.csv")
str(cust_data)
dim(cust_data)
head(cust_data)
oldnames=names(cust_data)
oldnames
df= cust_data


# Changing Names
newnames = c('custid', 'nps', 'npscat', 'dely', 'calls', 'years', 'married', 'city',
'paymode', 'items', 'gender','mode', 'squality','sdely','smenu',
'srecom', 'sdperson')
length(newnames)
names(df) = newnames
df
table(df$npscat)
fit <- ctree(npscat ~ .- custid - nps, data=df)
plot(fit, main="Conditional Inference Tree for NPS ")
plot(fit, gp = gpar(fontsize = 5), inner_panel=node_inner,
     ip_args=list( abbreviate = FALSE,id = FALSE))
summary(fit)
partykit:::.list.rules.party(fit)
names(df)
predict(fit, newdata=df[1:10,-c(1,2)])
df$npscat[1:10]
