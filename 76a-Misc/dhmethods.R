#Various Functions on Data
#Handle objects ----
x = 1:5

#Functions/ Methods applicable to Objects
methods(class=class(x))
#helps you know which function is applicable for which type of object
methods(class=class(mtcars))

#seq
1:5
rev(x)
match(5, x)


#all combinations---
(df=expand.grid(x=c('A','B','C','D'), y=1:3))

choose(6,4)

weighted.mean(c(1,2), c(3,4))
(1*3 + 2*4)/(3+4)

df2 = data.frame(x=c(1,2), y=c(3,4), z=c(5,6))
stars(df2[,1:2])
stars(df2[,1:3])

filled.contour((df2))
?image
image(df2)

df2 = mtcars[1:5,1:8]
