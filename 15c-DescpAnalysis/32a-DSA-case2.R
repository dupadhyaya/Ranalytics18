# Descriptive Analysis in R

coys = c('Nestle', 'Dabur', 'Patanjali', 'Amul' )
#nestle - noodles, chocolate, coffee
nestle = c('noodles', 'chocolate', 'coffee')
#dabur - toothpaste, chyawanprash
dabur = c('toothpaste', 'chyawanprash')
#patanjali - honey, chyawanprash, coffee, toothpaste
patanjali = c('honey', 'chyawanprash', 'coffee', 'toothpaste')
#amul - butter, icecream
amul = c('butter', 'icecream')
(products = c(nestle, dabur, patanjali, amul))
length(products)
(type = c('T1','T2','T2','T3','T1','T1','T1','T2','T3','T1','T1'))
coys = rep(coys, times=c(3,2,4,2))
coys
cbind(products, coys,type)
#sales in Rs Crores
set.seed(1234)
(y2016 = sample.int(100, 11, replace = F))
set.seed(1234)
(y2017 = sample.int(120, 11, replace = F))
set.seed(1234)
(commission = round(rnorm(11,mean=.02, sd=.003),3))
(ratings=sample(c('Excellent', 'Good','Poor'), size=11, replace=T))
fmcg = data.frame(coys, products, type, y2016, y2017, commission, ratings, stringsAsFactors = F)
fmcg  
summary(fmcg)

#Category columns
fmcg$coys = factor(fmcg$coys, ordered=T)
fmcg$type = factor(fmcg$type)
fmcg$products = factor(fmcg$products)
fmcg$ratings = factor(fmcg$ratings, ordered=T, levels=c('Poor','Good','Excellent'))
summary(fmcg)

#products of each coy
table(fmcg$products)
table(fmcg$products,fmcg$coys )


#summary
#how much is each coy selling 
aggregate(fmcg$y2016, by=list(coys), FUN=sum)
aggregate(y2016 ~ coys, data=fmcg, FUN=sum)
aggregate((y2016 + y2017) ~ coys, data=fmcg, FUN=sum)
aggregate(cbind(y2016,y2017) ~ coys, data=fmcg, FUN=sum)
aggregate(cbind(y2016,y2017) ~ coys + type, data=fmcg, FUN=sum)
(yearcoywise = aggregate(cbind(y2016,y2017) ~ coys, data=fmcg, FUN=sum))
str(yearcoywise)
#margin sums: works on arrays
rownames(yearcoywise) = yearcoywise$coys
yearcoywise = yearcoywise[-1]
yearcoywise

#add.margins
addmargins(as.matrix(yearcoywise),1, FUN=sum)  #
addmargins(as.matrix(yearcoywise),2, FUN=sum)  #
addmargins(as.matrix(yearcoywise),c(1,2), FUN=sum)  
addmargins(as.matrix(yearcoywise),c(1,2), FUN=list(list(sum, mean,min), list(mean,max)))  

#margin.table
margin.table(as.matrix(yearcoywise),1)
margin.table(as.matrix(yearcoywise),2)

#prop.table : for both years : proportional sale
prop.table(as.matrix(yearcoywise)) 
#wrt to each coy
prop.table(as.matrix(yearcoywise),1) 

#wrt to each year
prop.table(as.matrix(yearcoywise),2) 
(pt2=prop.table(as.matrix(yearcoywise),2)) 

#addmargins#total column
addmargins(pt2,1, FUN=sum)

#add values data eg. Taxes in 2016,2017 were 20%, 30%
yearcoywise
#calculate taxes from each coy
(taxes= sweep(yearcoywise, MARGIN=1, STATS=c(.2, .3), FUN='*'))
taxes[which.max(taxes$y2016),]

#graphs
pie(taxes$y2016)
pie(taxes$y2016, labels=rownames(taxes))
pie(taxes$y2016, labels=rownames(taxes))
percvalues = round(taxes$y2016/sum(taxes$y2016),2) * 100
pie(taxes$y2016, labels=paste(rownames(taxes), percvalues, sep=' - '))

#barpot
barplot(height=taxes$y2016, col=1:nrow(taxes))
barplot(height=taxes$y2016, col=1:nrow(taxes), names.arg = row.names(taxes))

#Stacked Bar Graph
barplot(as.matrix(taxes), beside = F, col=rainbow(nrow(taxes))) 
legend("top", row.names(taxes), cex=1.0, bty="n",  fill=rainbow(nrow(taxes)))

#Besides
barplot(as.matrix(taxes), beside = T, col=rainbow(nrow(taxes)), ylab='Amount in Lakh Rs', xlab='Year') 
title(main='Tax Collections from FMCG Coy', sub = 'Product Wise')
legend("topleft", row.names(t(taxes)), cex=1.0, bty="n",  fill=rainbow(nrow(taxes)))

#different format
barplot(t(as.matrix(taxes)), beside = T, ylab='Amount in Lakh Rs', xlab='Year', col=2:3) 
title(main='Tax Collections from FMCG Coy', sub = 'Coy - Year')
legend("topleft", row.names(t(taxes)), cex=1.0, bty="n",  fill=2:3)

#Reshape the data to display in different format
library(reshape2)
yearcoywise2a = data.frame(cbind(yearcoywise), coys=row.names(yearcoywise))
yearcoywise2a

yearcoywise2b <- melt(yearcoywise2a, id.vars ='coys')
yearcoywise2b


#Line Chart
year = 2010:2018
nestle = ceiling(runif(9,50,100))
dabur = floor(runif(9,55,95))
yearwisesales = data.frame(year, nestle, dabur)
yearwisesales


plot(yearwisesales$year,yearwisesales$nestle, type="l", col="green", lwd=5, xlab="Year", ylab="Sales")
lines(yearwisesales$year,yearwisesales$dabur, col="red", lwd=2)
title("Change in Sales over Years - Nestle and Dabur")
legend("topright",c("Nestle","Dabur"), lwd=c(5,2), col=c("green","red"))

#End of Descriptive Analysis


