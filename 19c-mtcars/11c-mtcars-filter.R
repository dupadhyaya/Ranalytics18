#mtcars - filtering data, missing values, split data

mtcars # print dataset
head(mtcars)
tail(mtcars)
head(mtcars,n=3)

#filter data----
#selected columns
mtcars$mpg[1:10]  #vector
head(mtcars[1:3]) #DF
head(mtcars[,1:3]) #DF
head(mtcars[c('mpg','cyl','disp')])
head(mtcars[,c(1,5,6,7)])
head(mtcars[,-1])  #mpg excluded
head(mtcars[,-c(1:5)]) #excluded 1st to 5th

#selected rows----
head(mtcars)
mtcars[1:5,]
mtcars['Mazda RX4',]
mtcars[mtcars$mpg > 25,]
mtcars[mtcars$mpg <= 25,]

mtcars[mtcars$mpg > 25 & mtcars$gear==4,1:5]
mtcars[grep("Mazda", rownames(mtcars)),] #match name in rownames or a column
head(mtcars)
?grep
rownames(mtcars)
?toupper
grep("^Merc",rownames(mtcars))
mtcars[c(8,9,10,11,12,13,14,15),1:5]
#rows with names starting with Merc

mtcars[grep("^Merc",rownames(mtcars)),]
mtcars[-1,1:5]
mtcars[-c(1:20),-c(1:5)]

#combine rows and columns-----
mtcars[1:5, 1:3]
mtcars[mtcars$mpg > 25 & mtcars$gear==4,1:3]


#subset----
#	 am	 Transmission (0 = automatic, 1 = manual)
subset(mtcars, am==1)
subset(mtcars, am==1 & hp > 66, select=1:4)
names(mtcars)
subset(mtcars, cyl==4 | cyl==8, select=-c(mpg:disp))


#filter----
vars1= c('mpg', 'disp', 'hp','drat','wt','qsec')
mtcars[vars1]


#which----
mtcars[which(mtcars$cyl==4),1:5]

#unique----
length(unique(mtcars$mpg))
unique(mtcars$mpg)
unique(mtcars$cyl)
duplicated(mtcars[,c('cyl')])

#missing values----
#complete cases- rows which are complete

(x1=c(1,2,3,4,5,6,1,2,3,4,5))
duplicated(x1)

(xna=c(1,NA,5,NA,10,5,NA))
mean(xna)
mean(xna, na.rm=T)
is.na(xna)
sum(is.na(xna))


complete.cases(mtcars)

anyNA(mtcars)

df_mtcars = mtcars
head(df_mtcars)

df_mtcars$disp
#put missing values in DF for a condition
df_mtcars[df_mtcars$mpg > 25, c('disp') ] = NA

df_mtcars$disp

anyNA(df_mtcars)

colSums(is.na(df_mtcars)) #disp has 6
complete.cases(df_mtcars)
sum(complete.cases(df_mtcars)) # 26 row complete
sum(!complete.cases(df_mtcars)) # 6 row incomplete


#replace missing values with mean of the column
mean(df_mtcars$disp, na.rm=T) #mean of disp column
df_mtcars[is.na(df_mtcars$disp),]  #display rows with missing values in disp column       
df_mtcars[is.na(df_mtcars$disp),c('disp')] = mean(df_mtcars$disp, na.rm=T)       
anyNA(df_mtcars)


#split data----
head(mtcars)
(vars1=c('mpg','cyl','gear','wt','disp','am'))
(names(mtcars))

split(mtcars[vars1], mtcars$am) #split on am 0 or 1

(df_split_am= split(mtcars[vars1], mtcars$am)) #split on am

df_split_am[[1]]
df_split_am[[2]]


(df_split_cyl= split(mtcars[vars1], mtcars$cyl)) #split on cyl
unique(mtcars$cyl)

df_split_cyl[[1]]
df_split_cyl[[2]]
df_split_cyl[[3]]
dfs22 = as.data.frame(df_split_am[[2]])
str(dfs22)
dfs22

df2 = mtcars[vars1]
head(df2)
df2$am = as.character(df2$am)
head(df2)
str(df2)
split(df2, df2$am)
