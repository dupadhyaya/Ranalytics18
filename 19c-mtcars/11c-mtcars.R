#mtcars - filtering data

mtcars # print dataset
head(mtcars)
tail(mtcars)
head(mtcars,n=3)

#filter data
#selected columns
mtcars[1:3]
mtcars[,1:3]
mtcars[c('mpg','cyl','disp')]
mtcars[,c(1,5,5,7)]
mtcars[,-1]
mtcars[,-c(1:5)]

#selected rows
mtcars[1:5,]
mtcars['Mazda RX4',]
mtcars[mtcars$mpg > 25,]
mtcars[mtcars$mpg > 25 & mtcars$gear==4,]
df[grep("Mazda", rownames(mtcars)),] #match name in rownames or a column
grep("^Merc",rownames(mtcars)) #rows with names starting with Merc
mtcars[grep("^Merc",rownames(mtcars)),]
mtcars[-1,]
mtcars[-c(1:20),-c(1:5)]


#combine rows and columns
mtcars[1:5, 1:3]
mtcars[mtcars$mpg > 25 & mtcars$gear==4,1:3]

