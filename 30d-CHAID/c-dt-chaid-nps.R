###
#install.packages("CHAID", repos="http://R-Forge.R-project.org")
library("CHAID")
#convert data to factors

##Read the data in the file
cust_data<-read.csv("./data/nps.csv")
str(cust_data)
dim(cust_data)
head(cust_data)
oldnames=names(cust_data)
oldnames
df= cust_data


# Changing Names
newnames = c('custid', 'nps', 'npscat', 'dely', 'calls', 'years', 'married', 'city', 'paymode', 'items', 'gender','mode', 'squality','sdely','smenu', 'srecom', 'sdperson')
length(newnames)
names(df) = newnames
apply(df,2, class)
df2 =lapply(df[,c('npscat', 'dely', 'srecom', 'years','calls')], factor)
df2= as.data.frame(df2)
table(df2$npscat)
fit <- chaid(npscat ~ dely + srecom + years + calls, data=df2)
plot(fit, main="Conditional Inference Tree for NPS ")
plot(fit, gp = gpar(fontsize = 5), inner_panel=node_inner,
     ip_args=list( abbreviate = FALSE,id = FALSE))
summary(fit)



partykit:::.list.rules.party(fit)
names(df2)
cbind(predict(fit, newdata=df2[1:10,]), df2$npscat[1:10])
nodeids(fit,1)
nodeids(fit, from=4, TERMINAL=TRUE)
?nodeids

print(fit)

df2
summary(df2$years)
summary(df2)
unique(df2$years)

