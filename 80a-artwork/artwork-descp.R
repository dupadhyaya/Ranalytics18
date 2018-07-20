#Artwork 2 : Descriptive Analysis

library(dplyr)
library(data.table)
options(dplyr.width = Inf)

#Numeric Data
numdata = auctiondata2[sapply(auctiondata2,is.numeric)]
numdata
(summarise_all(numdata, funs(n(),mean,median, max, min)))

?transpose
#Factor Data
facdata = auctiondata2[sapply(auctiondata2,is.factor)]
facdata
summarise_all(auctiondata2[names(facdata)], funs(nlevels(.), nmiss=sum(is.na(.))))


#Arrange Data
arrange(auctiondata2, lotstatus, desc(saleprice), awcat) %>% select(lotstatus, saleprice, awcat)
auctiondata2 %>% select(lotstatus, saleprice, awcat) %>% arrange(lotstatus, desc(saleprice), awcat)



#Select Random Rows
(dt = sample_n(select(auctiondata2, awtitle, awcat),10))
(dt = auctiondata2 %>% select(awtitle, awcat) %>% sample_n(10))

#Group By
group_by(auctiondata2, awcat)
auctiondata2 %>% group_by(awcat)  

#Summaries by Groupby
(t = summarise_at(group_by(auctiondata2, awcat), vars(lotesthigh, lotestlow, saleprice), funs(n(), max, min, mean(., na.rm = TRUE))))

#The above code can also be written like
(t = na.omit(auctiondata2) %>% group_by(awcat) %>%
  summarise_at(vars(lotesthigh, lotestlow, saleprice), funs(n(), mean(., na.rm = TRUE))))
write.csv(t, 'output2.csv')

#Compute within group : Top2 rows from each gp
(t = na.omit(auctiondata2) %>% select(awcat, auchouse, arname, saleprice, lotesthigh, lotestlow) %>% filter(awcat %in% c("PAINTINGS", "PHOTOGRAPHS")) %>% group_by(awcat, auchouse) %>%  do(head( . , 2)))
write.csv(t, 'output3.csv')

# 3rd & 4th Max Value of each cat
(t = auctiondata2 %>% select(awcat, auchouse, saleprice) %>%
filter(awcat %in% c("PAINTINGS", "PHOTOGRAPHS")) %>%
  group_by(awcat) %>%
  do(arrange(.,desc(saleprice))) %>%  slice(3:4))


# Rank for variables

mutate_at(auctiondata2, vars(lotesthigh:saleprice), funs(Rank=min_rank(.))) %>% select(recid, lotesthigh_Rank, lotestlow_Rank, saleprice, saleprice_Rank ) %>% arrange(desc(saleprice))
#min_rank() assigns 1 to the smallest value and high number to the largest value

mutate_at(auctiondata2, vars(lotesthigh:saleprice), funs(Rank=min_rank(desc(.)))) %>% select(recid, lotesthigh_Rank, lotestlow_Rank, saleprice, saleprice_Rank ) %>% arrange(desc(saleprice))

#Category which generated max saleprice and its artist name
auctiondata2 %>% group_by(awcat) %>% filter(min_rank(desc(saleprice)) == 1) %>%  select(recid, awcat, arname, saleprice)



#Select Varaibles
select(auctiondata2, starts_with("l"))
select(auctiondata2, -starts_with("a"), -starts_with("l"))
names(auctiondata2)
select(auctiondata2, contains("lot"))

select(auctiondata2, saleprice, everything()) %>% select(saleprice, awcat)

filter(auctiondata2, awcat == "PAINTINGS")  %>%  select(saleprice, awcat)
filter(auctiondata2, !awcat == "PAINTINGS")  %>%  select(saleprice, awcat)
filter(auctiondata2, awcat %in% c("PAINTINGS", "PHOTOGRAPHS") & saleprice >= 10000000 ) %>%  select(saleprice, awcat, awtitle)
filter(auctiondata2, awcat %in% c("PAINTINGS", "PHOTOGRAPHS") |saleprice >= 10000000 ) %>%  select(saleprice, awcat, awtitle)

filter(auctiondata2, grepl("Art", auctitle)) %>% select(awcat, auctitle)


auctiondata2 %>% if_else(saleprice < lotesthigh, "SP > Est High", "SP < Est High", missing = "missing value")

#if else
df <- c(-10,2, NA)
if_else(df < 0, "negative", "positive", missing = "missing value")


auctiondata2 %>% group_by(auchouse) %>%
  summarise(Pecentile_25=quantile(saleprice, probs=0.25, na.rm = TRUE),
            Pecentile_50=quantile(saleprice, probs=0.5, na.rm = TRUE),
            Pecentile_75=quantile(saleprice, probs=0.75, na.rm = TRUE),
            Pecentile_99=quantile(saleprice, probs=0.99, na.rm = TRUE))

auctiondata2 %>% filter(!is.na(saleprice)) %>% summarise(Pecentile_25=quantile(saleprice, probs=0.25))



#Max in Lot High, Low Low, SP
auctiondata2 %>%
  rowwise() %>% mutate(Max= max(lotesthigh:lotestlow)) %>%
  select(aucid, awcat, lotesthigh:lotestlow,Max)

