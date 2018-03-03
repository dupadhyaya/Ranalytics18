###

#install.packages("party")
library(party)   #better than partykit
#install.packages("partykit")
library(partykit)

##Read the data in the file
cust_data<-read.csv("./data/NPS Data Food Order v01.csv")
str(cust_data)
dim(cust_data)
head(cust_data)

# Conditional Inference Tree for Default_On_Payment
fit <- party::ctree(  NPS_Category~
               Timely_delivery	+
               No_of_calls_in_an_Order	+
               Loyalty_Years	+
               C_Marital_Status	+
               Tier_City	+
               Mode_of_Payment	+
               No_of_Items_in_Order	+
               Gender	+
               Order_Mode	+
               Score_on_Food_Quality	+
               Score_on_Order_Logistics	+
               Menu_Presentation_Score	+
               Score_on_Recommendations	+
               Score_on_Delivery_Person_Friendliness
             , 
             data=cust_data )
fit
plot(fit)
length(fit)

# Conditional Inference Tree for Default_On_Payment by specifying the limits
fit <- ctree(  NPS_Category~
                 Timely_delivery	+
                 No_of_calls_in_an_Order	+
                 Loyalty_Years	+
                 C_Marital_Status	+
                 Tier_City	+
                 Mode_of_Payment	+
                 No_of_Items_in_Order	+
                 Gender	+
                 Order_Mode	+
                 Score_on_Food_Quality	+
                 Score_on_Order_Logistics	+
                 Menu_Presentation_Score	+
                 Score_on_Recommendations	+
                 Score_on_Delivery_Person_Friendliness
               , 
               data=cust_data,
               control = ctree_control(maxdepth = 4))

#plot(fit, main="Conditional Inference Tree for NPS ")

plot(fit, gp = gpar(fontsize = 5),     # font size changed to 6
     inner_panel=node_inner,
     ip_args=list(
       abbreviate = FALSE, 
       id = FALSE)
)

###detailed results including splits
summary(fit)


partykit:::.list.rules.party(fit)

# Method2 ------
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
fit2a <- partykit::ctree(npscat ~ .- custid - nps, data=df)
#length(fit2a)  #length of tree for partykit only
plot(fit2a, main="Conditional Inference Tree for NPS ")
plot(fit2a, gp = gpar(fontsize = 5), inner_panel=node_inner,
     ip_args=list( abbreviate = FALSE,id = FALSE))
summary(fit2a)
fit2b <- ctree(npscat ~ .- custid - nps, data=df, control = ctree_control(maxdepth = 4))
plot(fit2b, type = "simple")
print(fit2b)

#list.rules.party(fit2b)
names(df)
predict(fit2b, newdata=df[1:10,])

df$npscat[1:10]
