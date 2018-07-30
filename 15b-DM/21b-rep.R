# Value generation with : repeat
#rep
?rep
#rep(x, ...)
#rep.int(x, times)
#rep_len(x, length.out)
#times -repeat each element/ vector
#length.out - length of the output vector
#each - x is repeated each times

rep(1,times=10)
rep(c(1,2,3),times=5)
rep(c(1,2,3),each=4)
rep(1:3, each=4, times=5)

(y1=rep(c(1,2,3,4,5),length.out=20, times=3))
length(y1)
rep(1:3, each=4, len=20) #len is abbreviation of length.out 

rep(1:3, times=c(4,3,2))
