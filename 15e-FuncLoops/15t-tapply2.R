#tapply

#Data Frame df3
newnum = c(2:5, 4:5, 6:8, 9,17)
fac1 = factor(c(rep("A", 3), rep("B", 3), rep("C", 3), rep("D",2)))
fac2 = gl(n=2, k=1, length=11, labels = month.abb[1:2])
newnum
fac2
fac1
df3 = data.frame(response = newnum, pred1 = fac1, pred2 = fac2)
df3
X = df3
tapply(X=newnum, INDEX= fac1, FUN=NULL)
tapply(X=newnum, INDEX = fac1, FUN = sum)
tapply(X=newnum, INDEX = list(fac1,fac2), FUN = sum)
tapply(X=newnum, INDEX=fac1, FUN=median)

mode(tapply(X=newnum, INDEX=fac1, FUN=median, simplify=F))

?tapply
with(df3, tapply(response, INDEX=pred1, FUN=sum) )