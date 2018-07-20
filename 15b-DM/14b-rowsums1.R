# Row and Column Sums / Means

?rowSums
M = matrix(1:12, nrow=4)
M
rowSums(M)
cbind(M,rowSums(M))
addmargins(M)
addmargins(M,2)
margin.table(M,1)
cbind(M,margin.table(M,1))

colSums(M)
cbind(M,colSums(M)) # Check ?
rbind(M,colSums(M))
addmargins(M, 1)
margin.table(M,2)
rbind(M,margin.table(M,2))

# Means
rowMeans(M)
cbind(M, rowMeans(M))
addmargins(M,2,FUN=list(list(mean, sum, sd, var, median)))
addmargins(M,c(1,2),FUN=list(list(mean, sum, sd),
                             list(var, median)))

?colMeans(M)
rbind(M,colMeans(M))
addmargins(M,1, FUN=list(mean))

(hostel = matrix(rep(c(TRUE, FALSE), 12), nrow=3))
rowSums(hostel)
colSums(hostel)
rowMeans(hostel)
colMeans(hostel)

#data frame
df = as.data.frame(M)
class(df)
rowSums(df)


?addmargins

?rowsum
#rowsum - Colsum - M/ F based on gp variable
rowsum(x=mtcars, group=mtcars$cyl, reorder = T)

rowsum(x=mtcars, group=mtcars$hp, reorder = T)
# cyl - 4,6,8 ; cyl - sum 

?colsum  # NA

colSums()

colMeans()

rowMeans()

rowSums()

rownames(x, do.NULL = TRUE, prefix = "row")
rownames(x) <- value

row.names()

colnames(x) <- value
?colnames(mtcars,do.NULL = T, prefix='col')
colnames(mtcars)
x = mtcars



m0 <- matrix(NA, 4, 0)
rownames(m0)

m2 <- cbind(1, 1:4)
colnames(m2) = colnames(m2, do.NULL = FALSE, prefix='col')
colnames(m2)

colnames(m2) = NULL
colnames(m2)
# do.NULL - if F & names are empty, names are created
# if T, names are not empty, names are not created
colnames(m2) = colnames(m2, do.NULL = FALSE, prefix='sub')
colnames(m2)
m2
(m2 = cbind(m2, 1:4))
is.na(colnames(m2))
colnames(m2)[3] = NULL

colnames(m2)
colnames(m2) = colnames(m2, do.NULL = TRUE, prefix='subject')
colnames(m2)


colnames(m2) <- c("x","Y")
colnames(m2)

rownames(m2)
rownames(m2) <- rownames(m2, do.NULL = FALSE, prefix = "Obs.")
m2

?setNames
x= setNames(data.frame(matrix(ncol = 3, nrow = 0)), 
         c("name", "age", "gender"))
str(x)

