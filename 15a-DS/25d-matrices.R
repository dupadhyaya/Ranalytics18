# Matrix
#col or rownames, sweep, addmargins
(m1 = matrix(1:12, nrow=4))

class(m1)
attributes(m1)

#names of cols and rows
m1
(colnames(m1) = paste('C',1:3, sep=''))
(rownames(m1) = paste('R',1:4, sep=''))
m1


#row and col wise summary
m1
colSums(m1); rowSums(m1)
colMeans(m1); rowMeans(m1)

t(m1) # transpose
m1
sweep(m1, MARGIN = 1, STATS = c(2,3,4,5), FUN="+" ) #rowise
sweep(m1, MARGIN = 2, STATS = c(2,3,4), FUN="*" ) #colwise

#addmargins
m1
addmargins(m1,1,sum) #colwise function
addmargins(m1,2,mean) #rowwise function
addmargins(m1,c(1,2),mean) #row & col wise function
addmargins(m1,c(1,2),list(list(mean,sum), list(var,sd))) #row & col wise function

