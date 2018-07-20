# Association Rule - Online Sales

library(tidyverse)
library(readxl)
library(knitr)
library(ggplot2)
library(lubridate)
library(arules)
library(arulesViz)
library(plyr)


#retail <- read_excel('Online_retail.xlsx')
retail1 <- readxl::read_excel('E:/rWork/rDataSets/Onlineretail.xlsx')

retail <- retail[complete.cases(retail1), ]
summary(retail)
retail %>% plyr::mutate(Description = as.factor(Description))
retail %>% plyr::mutate(Country = as.factor(Country))
retail$Date <- as.Date(retail$InvoiceDate)
retail$Time <- format(retail$InvoiceDate,"%H:%M:%S")
retail$InvoiceNo <- as.numeric(as.character(retail$InvoiceNo))
dplyr::glimpse(retail)


retail$Time <- as.factor(retail$Time)
retail %>%
  ggplot(aes(x=Time)) + 
  geom_histogram(stat="count",fill="indianred")


detach("package:plyr", unload=TRUE)
retail %>% 
  group_by(InvoiceNo) %>% 
  summarize(n_items = mean(Quantity)) %>%
  ggplot(aes(x=n_items))+
  geom_histogram(fill="indianred", bins = 100000) + 
  geom_rug()+
  coord_cartesian(xlim=c(0,80))



retail %>%
  group_by(StockCode, Description) %>% 
  summarize(count = n()) %>% 
  arrange(desc(count))
#error
retail %>%
  ggplot(aes(x=reorder(Description,count), y=count))+
  geom_bar(stat="identity",fill="indian red")+
  coord_flip()


retail_sorted <- retail[order(retail$CustomerID),]
library(plyr)
itemList <- ddply(retail,c("CustomerID","Date"), 
                  function(df1)paste(df1$Description, 
                                     collapse = ","))
head(itemList)

itemList$CustomerID <- NULL
itemList$Date <- NULL
colnames(itemList) <- c("items")
head(itemList)

write.csv(itemList,"./data/market_basket.csv", quote = FALSE, row.names = TRUE)

#AR Analysis
tr <- read.transactions('./data/market_basket.csv', format = 'basket', sep=',')
head(tr)
LIST(tr[1:5])
summary(tr)

itemFrequencyPlot(tr, topN=10, type='absolute')
#graphics error
dev.off()
graphics.off()
par(mar=c(1,1,1,1))

rules <- apriori(tr, parameter = list(supp=0.001, conf=0.8))
rules <- sort(rules, by='confidence', decreasing = TRUE)
summary(rules)

inspect(rules[1:10])

topRules <- rules[1:10]
plot(topRules)

plot(topRules, method="graph")

plot(topRules, method = "grouped")


