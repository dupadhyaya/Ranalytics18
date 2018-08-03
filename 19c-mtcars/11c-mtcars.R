#mtcars - filtering data, missing values, split data

mtcars # print dataset
head(mtcars)
tail(mtcars)
head(mtcars,n=3)

#filter data----
#selected columns
mtcars[1:3]
mtcars[,1:3]
mtcars[c('mpg','cyl','disp')]
mtcars[,c(1,5,5,7)]
mtcars[,-1]
mtcars[,-c(1:5)]

#selected rows----
mtcars[1:5,]
mtcars['Mazda RX4',]
mtcars[mtcars$mpg > 25,]
mtcars[mtcars$mpg > 25 & mtcars$gear==4,]
df[grep("Mazda", rownames(mtcars)),] #match name in rownames or a column
grep("^Merc",rownames(mtcars)) #rows with names starting with Merc
mtcars[grep("^Merc",rownames(mtcars)),]
mtcars[-1,]
mtcars[-c(1:20),-c(1:5)]


#combine rows and columns-----
mtcars[1:5, 1:3]
mtcars[mtcars$mpg > 25 & mtcars$gear==4,1:3]


#subset----
subset(mtcars, am==1)
subset(mtcars, am==1 & hp > 66, select=1:4)
subset(mtcars, cyl==4 | cyl==8, select=-c(mpg:disp))


#filter----
vars1= c('mpg', 'disp', 'hp','drat','wt','qsec')
mtcars[vars1]


#which----
mtcars[which(mtcars$cyl==4),1:5]

#unique----
unique(mtcars$mpg)
unique(mtcars$cyl)

#missing values----
#complete cases- rows which are complete
complete.cases(mtcars)
anyNA(mtcars)
df_mtcars = mtcars
df_mtcars$disp
#put missing values in DF for a condition
df_mtcars[df_mtcars$mpg > 25, c('disp') ] = NA
df_mtcars$disp
anyNA(df_mtcars)
colSums(is.na(df_mtcars)) #disp has 6
complete.cases(df_mtcars)
sum(complete.cases(df_mtcars)) # 26 row complete

#replace missing values with mean of the column
mean(df_mtcars$disp, na.rm=T)
df_mtcars[is.na(df_mtcars$disp),]       
df_mtcars[is.na(df_mtcars$disp),c('disp')] = mean(df_mtcars$disp, na.rm=T)       
anyNA(df_mtcars)


#split data----
vars1=c('mpg','cyl','gear','wt','disp','am')
split(mtcars[vars1], mtcars$am) #split on am
(df_split1= split(mtcars[vars1], mtcars$am)) #split on am
df_split1[[1]]

(df_split2= split(mtcars[vars1], mtcars$cyl)) #split on cyl
df_split2[[1]]
df_split2[[2]]
df_split2[[3]]
dfs22 = as.data.frame(df_split2[[2]])
str(dfs22)
dfs22
