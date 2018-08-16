# Value generation with : repeat
#rep
?rep
#rep(x, ...)
#rep.int(x, times)
#rep_len(x, length.out)
#times -repeat each element/ vector
#length.out - length of the output vector
#each - x is repeated each times

#1, 10 times
rep(1,times=10)
#1,2,3 : 5 times
rep(c(1,2,3),times=5)
#1- 4 times, 2-4 times, 3 - 4 times
rep(c(1,2,3),each=4)
#(1-4times : 2-times...) - 5 times
rep(1:3, each=4, times=5)
#length of vector 20: 1,2,3,4,5 - 5 times 
(y1=rep(c(1,2,3,4,5),length.out=20, times=3))
length(y1)

rep(1:3, each=4, len=20) #len is abbreviation of length.out 

#1-4times, 2-3 times, 3-2 times
rep(1:3, times=c(4,3,2))
