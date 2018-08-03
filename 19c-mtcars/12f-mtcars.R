# mtcars - loops and apply


names(mtcars)
vars1= c('mpg', 'disp', 'hp','drat','wt','qsec')
vars2 = c('gear','cyl', 'vs', 'am','gear','carb')

paste('mtcars','mpg',sep='$')
noquote(paste('mtcars','mpg',sep='$'))
noquote(paste('mtcars','mpg',sep='$'))

length(mtcars)

#using indices
for(i in 1:5) {
  print(mean(mtcars[,i]))
}
#using vector of names
for(i in vars1) {
  print(mean(mtcars[,i]))
}

lapply(mtcars[vars1], mean)
lapply(mtcars[vars1],quantile)
sapply(mtcars[vars1], mean)
apply(mtcars,1,FUN=mean) #rowsise mean
apply(mtcars,2,FUN=mean) #colsise mean

#ifelse
ifelse(mtcars$mpg > 25,'High', 'Low')
cbind(mtcars$mpg, ifelse(mtcars$mpg > 25,'High', 'Low'))

#frequency Table
table(mtcars$gear, mtcars$cyl)
(t1= table(mtcars$gear, mtcars$cyl, dnn=list('gears','cylinder') ))
t1
addmargins(t1) #sum all sides rows and columns
addmargins(t1,FUN=mean)
addmargins(t1,FUN=list(list(mean,sum), list(sd, median)))

margin.table(t1)
margin.table(t1,1)
margin.table(t1,2)
prop.table(t1)


#freq distribution
mtcars$mpg
range(mtcars$mpg)
breaks = seq(from=floor(min(mtcars$mpg))-5,to=ceiling(max(mtcars$mpg))+ 5,by=5)
breaks
(mpg.cut = cut(mtcars$mpg, breaks))
(t2a =table(mpg.cut))
t2b =cbind(table(mpg.cut)) #transpose
hist(mtcars$mpg)
hist(mtcars$mpg,breaks=breaks)
barplot(t2b, beside = T,col=1:6, names.arg = rownames(t2b))


#----

(mpg.cut2 = cut(mtcars$mpg, breaks, labels=LETTERS[1:6]))

(mpg.cut2 = cut(mtcars$mpg, breaks, labels=LETTERS[1:6], levels=LETTERS[1:6], ordered=T))
table(mpg.cut2)
(freqdist2= cbind(table(mpg.cut2)))  
barplot(freqdist2, besides=T)
