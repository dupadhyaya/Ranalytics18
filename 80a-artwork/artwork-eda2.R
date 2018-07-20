# Artwork - EDA2

#Aggregations
names(auctiondata2)
auctiondata2[c('recid','lotno')]
length(unique(auctiondata2$lotno))
aggregate( recid ~ lotno, data=auctiondata2, FUN=length)

#One lot could have more than 1 recid

names(auctiondata2)
#Average Sale on each day
(ag1a = aggregate( saleprice ~ aucdate, data= auctiondata2, FUN=sum))
(ag1b = aggregate( saleprice ~ aucdate, data = auctiondata2, FUN = function(x) c(mean = mean(x), (sum= sum(x)), (max=max(x)), (min=min(x)), (numbers = length(x)) ) ))
       
#Artwork Category Total Sales in 2 days

(ag2a = aggregate(saleprice ~ awcat , data=auctiondata2, FUN=sum))
ag2a = ag2a[ order(ag2a$saleprice),]
(sp = round(ag2a$saleprice/ sum(ag2a$saleprice)*100,1))
pie(ag2a$saleprice, labels=paste0(ag2a$awcat,"\n", sp, " %"), radius=1.1) 


(ag2b = aggregate(saleprice ~ awcat + auchouse, data=auctiondata2, FUN=sum))
(ag2b = ag2b[ order(ag2a$saleprice),])


names(ag2b)


(g1  = ggplot(ag2b, aes(x=1,y=saleprice,fill=awcat)) + 
  geom_bar(stat="identity",width=2) + coord_polar(theta='y')+
  theme(axis.ticks=element_blank(), axis.title=element_blank(),axis.text.y = element_blank(),axis.text.x = element_blank(), panel.grid  = element_blank())) + facet_wrap(~ auchouse) 



#Compare via Barplots
(ag3 = aggregate(saleprice ~ awcat + auchouse, data=auctiondata2, FUN=sum))

# Stacked barplot with multiple groups
ggplot(data=ag3, aes(x=awcat, fill=auchouse, y=saleprice)) +
  geom_bar(stat="identity")
# Use position=position_dodge()
ggplot(data=ag3, aes(x=awcat, fill=auchouse, y=saleprice)) +
  geom_bar(stat="identity", position=position_dodge())


ggplot(data=ag3, aes(x=awcat, fill=auchouse, y=saleprice)) +
  geom_bar(stat="identity", position=position_dodge()) + coord_flip()

#Bubble Chart
range(auctiondata2$lotesthigh)
#ggplot(data=na.omit(auctiondata2), aes(x=lotestlow, y=lotesthigh)) + geom_point(aes(size=saleprice)) +
  scale_size_continuous(range=c(80000,20000000)) +
  theme(legend.position = "none")

na.omit(auctiondata2) %>% ggplot(aes(x=lotestlow, y=lotesthigh, size=saleprice, colour = awcat, shape = auchouse)) + geom_point(alpha = 0.7, position = position_jitter()) 

g1a = stat_smooth(method = "lm")



#Box Plot
ggplot(subset(na.omit(auctiondata2), lotstatus=='Sold'), aes(x = awcat, y = lotestlow , group=auchouse)) + geom_boxplot()

ggplot(subset(auctiondata2, !is.na(saleprice)), aes(x = awcat, y = saleprice)) +  geom_boxplot()

ggplot(subset(auctiondata2, !is.na(saleprice)), aes(x = awcat, y = saleprice)) +  geom_point(alpha=0.3, color="tomato", position = "jitter") +   geom_boxplot(alpha=0) + coord_flip()


ggplot(subset(auctiondata2, !is.na(saleprice)) , aes(x=auchouse, y=saleprice)) +   geom_point(alpha=0.3, color="tomato", position = "jitter") +   geom_boxplot(alpha=0) + coord_flip() + facet_wrap( ~ awcat, scales = "free")

# expand_limits(pred=range_act, value=range_act) 
scales = "free_x"



names(auctiondata2)


#Artists whose art fetch more value : mean
library(dplyr)  
auctiondata2 %>%
  group_by(arname) %>%
  summarize(mean_sale = mean(saleprice, na.rm = TRUE),
        max_price = max(saleprice, na.rm = TRUE), 
        nos= length(awid)) %>%
        arrange(desc(mean_sale), desc(nos), arname)


#Difference with Max and Min Lot estimate of SalePrice
auctiondata2 %>%
   filter(lotstatus == 'Sold') %>% 
   select(recid, awid, awcat, lotesthigh, lotestlow, saleprice, lotstatus ) 
diffwithSP = auctiondata2[auctiondata2$lotstatus =='Sold', c('awid', 'awcat', 'lotesthigh', 'lotestlow', 'saleprice', 'lotstatus')]
diffwithSP$diffmax = diffwithSP$saleprice - diffwithSP$lotesthigh   
diffwithSP$diffmin = diffwithSP$saleprice  - diffwithSP$lotestlow  #should b +ve
head(diffwithSP)
diffwithSP

#Items sold below LowEst
diffwithSP[ diffwithSP$diffmin < 0,][c(1,3:9)]
diffwithSP %>% select(c(1,3:9)) %>% filter(diffmin < 0) %>% arrange(diffmin)

#Items sold above High
diffwithSP[ diffwithSP$diffmax > 0,][c(1,3:9)]
diffwithSP %>% select(c(1,3:9)) %>% filter(diffmax > 0) %>% arrange(desc(diffmax))

