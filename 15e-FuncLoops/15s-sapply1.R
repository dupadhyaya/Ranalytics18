#lapply sapply

lapply(1:3, function(x) x^2)
unlist(lapply(1:3, function(x) x^2))

#Passing simplify=FALSE to sapply will also give you a list:
  
sapply(1:3, function(x) x^2, simplify=F)
sapply(1:3, function(x) x^2)

m = matrix(1:12, ncol=3)

mean(m[,c(1,2,3)])
for (i in 1:3) print(mean(m[,c(i)]))

sapply(1:3, function(x) mean(m[,x]))

sapply(c(1,2,3), function(x) mean(m[,x]))

sapply(1:3, function(x, y) mean(y[,x]), y=m)


sapply(vec, f)
#input is a vector. 
#output is a vector/matrix, where element i is f(vec[i]), giving you a matrix if f has a multi-element output
lapply(vec, f)
#: same as sapply, but output is a list?
apply(matrix, 1/2, f): 
#input is a matrix. output is a vector, 
#where element i is f(row/col i of the matrix)

tapply(vector, grouping, f)
#: output is a matrix/array, where an element in the matrix/array is the value of f at a grouping g of the vector, and g gets pushed to the row/col names

by(dataframe, grouping, f)
#: let g be a grouping. apply f to each column of the group/dataframe. pretty print the grouping and the value of f at each column.

aggregate(matrix, grouping, f)
#: similar to by, but instead of pretty printing the output, aggregate sticks everything into a dataframe.
#https://stackoverflow.com/questions/3505701/grouping-functions-tapply-by-aggregate-and-the-apply-family


?Map
Map(sum, 1:5, 1:5, 1:5)
Map(sum, 1:5, 1:5, 1:5, simplify2array=F)
Map(sum, 1:5, 11:15, 21:25, simplify=T)

