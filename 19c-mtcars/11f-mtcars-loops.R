# mtcars - loops and apply

names(mtcars)
vars1= c('mpg', 'disp', 'hp','drat','wt','qsec')
vars2 = c('gear','cyl', 'vs', 'am','gear','carb')

paste('mtcars','mpg',sep='$')
noquote(paste('mtcars','mpg',sep='$'))

length(mtcars)
mean(mtcars[,1]); mean(mtcars[,2]); mean(mtcars[,3]) ;mean(mtcars[,4]); mean(mtcars[,5])

#using indices
for(i in 1:5) {
  print(mean(mtcars[,i]))
}

vars1
#using vector of names
for(i in vars1) {
  print(mean(mtcars[,i]))
}

?lapply
lapply(mtcars[vars1], mean)
lapply(mtcars[vars1],quantile)
sapply(mtcars[vars1], mean)
sapply(mtcars[vars1], quantile)
quantile(mtcars$mpg, c(.1,.3,.4,.8))

apply(mtcars,1,FUN=mean) #rowsise mean
apply(mtcars,2,FUN=mean) #colsise mean

#ifelse
ifelse(mtcars$mpg > 25,'High', 'Low')
cbind(mtcars$mpg, ifelse(mtcars$mpg > 30,'High', 'Low'))

#frequency Table
table(mtcars$cyl)
table(mtcars$gear, mtcars$cyl)
(t1= table(mtcars$gear, mtcars$cyl, dnn=list('gears','cylinder') ))
t1

#add.margin----
addmargins(t1) #sum all sides rows and columns
addmargins(t1,FUN=mean)
addmargins(t1,FUN=list(list(mean,sum), list(sd, median)))

#margin.table----
t1
margin.table(t1)
?margin.table
margin.table(t1,margin=1)
margin.table(t1,margin=2)
#prop.table
t1
prop.table(t1)
1/32
addmargins(prop.table(t1, 1))
addmargins(prop.table(t1, 2))

#freq distribution
mtcars$mpg
range(mtcars$mpg)
breaks = seq(from=floor(min(mtcars$mpg))-5,to=ceiling(max(mtcars$mpg))+ 5,by=5) #seq(5,35,5)
breaks
class(breaks)
mtcars$mpg
(mpg.cut = cut(mtcars$mpg, breaks))  #cut/place into interval
?cut
(t2a =table(mpg.cut))
mtcars$mpg
(t2b =cbind(table(mpg.cut))) #transpose
#(t2b_new = t2b[-3])

hist(mtcars$mpg)
breaks
(breaks1 = c(5,10,20,22,30,40, max(mtcars$mpg)))
hist(mtcars$mpg,breaks=breaks)
hist(mtcars$mpg,breaks=breaks1)

barplot(t2b, beside = T,col=1:6, names.arg = rownames(t2b))


#----

(mpg.cut2 = cut(mtcars$mpg, breaks, labels=LETTERS[1:6]))

(mpg.cut2 = cut(mtcars$mpg, breaks, labels=LETTERS[1:6], levels=LETTERS[1:6], ordered=T))
table(mpg.cut2)
(freqdist2= cbind(table(mpg.cut2)))  

#Creating discontinous intervals using cut command
#mridula

