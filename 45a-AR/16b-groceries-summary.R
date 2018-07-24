#Association Rule - Analysis

library(arules)
library(datasets)
data(Groceries)

summary(Groceries)
#there were 9,835 transactions altogether
#169 different items were bought during the month
#the most frequently bought item was “whole milk”: 2’513 purchases
#there were 2159 single item baskets, the biggest basket included 32 items 
#median basket included 3 items; mean had 4.4 items.

inspect(Groceries[1:5])
itemLabels(Groceries)[1:10] # [1:10] can be dropped to show all items

par(mfrow=c(1,2))

#Plot - Most Frequent
itemFrequencyPlot(Groceries,
                  type="relative",
                  topN=10, # can be changed to the number of interest
                  horiz=TRUE,
                  col='steelblue3',
                  xlab='',
                  main='Item frequency, relative')

itemFrequencyPlot(Groceries,
                  type="absolute",
                  topN=10,
                  horiz=TRUE,
                  col='steelblue3',
                  xlab='',
                  main='Item frequency, absolute')


#Plot - Least Frequent
par(mar=c(2,10,2,2), mfrow=c(1,2))
table(unlist(LIST(Groceries)))
sort(table(unlist(LIST(Groceries))))

barplot(sort(table(unlist(LIST(Groceries))))[1:10]/9835,
        horiz=TRUE,
        las=1,
        col='steelblue3',
        xlab='',
        main='Frequency, relative')

barplot(sort(table(unlist(LIST(Groceries))))[1:10],
        horiz=TRUE,
        las=1,
        col='steelblue3',
        xlab='',
        main='Frequency, absolute')
crossTable(Groceries, measure='lift',sort=T)[1:5,1:5]


#Contingency Table
tbl <- crossTable(Groceries)
#tbl  #too big list
tbl[1:5,1:5]

tbl['whole milk','whole milk']  #count of milk
tbl['whole milk','flour']  #milk with flour
#number of occasions when these two items were purchased together.

tbl <- crossTable(Groceries, sort=TRUE)
tbl[1:5,1:5]


#Xtable with lift
crossTable(Groceries, measure='lift',sort=T)[1:5,1:5]
#whole milk” goes well with all products, but “soda”.
#judged by lift, we are on the way to claim that soda is a substitute for “whole milk” for some people: they tend to buy either one or the other, but buying them together is a relatively rare event
crossTable(Groceries, measure='chi')['whole milk', 'soda']
#low p-value excludes possibility that lift less than 1 is due to chance.