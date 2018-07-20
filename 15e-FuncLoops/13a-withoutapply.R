# Before Apply
#https://csgillespie.github.io/efficientR/programming.html#the-apply-family

(m1 = matrix(1:16, nrow=4))

#mean
mean(m1[1,])
mean(m1[2,])

# mean using addmargins
addmargins(m1,1,mean)
addmargins(m1,2,mean)
addmargins(m1,c(1,2),mean)
addmargins(m1)


#using for loop
for( i in 1:4) {
  print(mean(m1[i,]))
}


nrow(m1)
ncol(m1)

for( i in 1:nrow(m1)) {
  print(paste0('Mean of row', i , ' is ', mean(m1[i,])))
}

for( i in 1:ncol(m1)) {
  print(paste0('Mean of Col', i , ' is ', mean(m1[,i])))
}

# Better way to do
apply(m1, 1, mean)  # row means
apply(m1, 2, mean)  # col means

