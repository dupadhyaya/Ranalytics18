#apply
# https://davetang.org/muse/2013/05/22/using-aggregate-and-apply-in-r/
#apply functions over array margins
#apply(X, MARGIN, FUN, ...)
#make up some dataframe
df <- data.frame(first = c(1:10), second = c(11:20))
df
apply(df , 2, mean)  #col
apply(df, 1, mean)  # row


s1 = student1[c(17:23)]
apply(student, 1, mean)  # not all are numeric
apply(s1,1,mean)
apply(s1,2,mean)


a4 = array(1:24, dim=c(4,3,2), dimnames = list( c(paste('c',1:4,sep='')), c('d1','d2','d3'),c('s1','s2')) )
a4

m1 = matrix(c(10:1, rep(5,10), rep(c(5,6),5),seq_len(length.out=10)), byrow=F, ncol =4)
colnames(m1) = c('sub1','sub2','sub3','sub4')
rownames(m1) = paste('R',1:10,sep='')

df1 = data.frame(sub1=10:1, sub2=5, sub3=rep(c(5,6),5), sub4=seq_len(length.out=10))
df1

X=m1
apply(X,1,sum)
apply(X,2,sum)
apply(X,3,sum)
apply(X,c(3,2), sum)
apply(X,c(2,3), sum)

apply(X,c(1,2), sum)
apply(X,c(1,3), sum)
apply(X,0,sum)

apply(X,sum)
apply(X,0,sum)
apply(X,4,sum)
apply(X,c(1,2),sum)
apply(X,c(1,2,3),sum)

# NA Values
m1[5] = NA
X=m1
m1
apply(X,1,mean)
apply(X,1,mean,na.rm=T)
apply(X,2,mean)
apply(X,2,mean,na.rm=T)
