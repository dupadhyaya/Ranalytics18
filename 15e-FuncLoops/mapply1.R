# Mapply

# vector
(v1 = 1:20)
(v2 = 12:15)
# array
#List ----
(list1 = list(sub1=10:1, sub2=rep(5,3), 
              sub3=rep(c(5,6),4),
              sub4=seq_len(length.out=10)))
mapply(v1,v2,sum)

# mapply -----
# mapply - function to multiple list or vector args
#mapply(a1, sum)

# one way of writing - creating a list 
#1 -1 ; 2-2,2  ; 3- 3,3,3 ; 4-4,4,4,4
mapply(rep, times=1:4, x = 1:4)  # list
rep(1:4,times=1:4)
mapply(rep,1:5,4)  # matrix 1 2 3 4
# 1 2 3 4 5
# 1 2 3 4 5
# 1 2 3 4 5

mapply(FUN=rep, each=1, x = v1, y=v1)
#list1
rep(v1,each=1)
rep(m1,each=1)
rep(list1,each=1)

e1 = 1:3
e2 = 6:8
e3 = 10:12
#function : x * y
#1st elements : a = e1 : FUN to each elements
#2nd elements : b = e2: takes this as arguments
#3rd elements : c = e3: takes this as arguments
# arguments are recycled if required
mapply(FUN=function(x,y) x+y, e1, e2 )
e1+e2
mapply(FUN=function(x,y,z) x+y+z, e1, e2 , e3)
e1+e2+e3

mapply(FUN=function(x,y,z) mean(x*y)/ z, e1, e2 , e3)



mapply(FUN=mean, x = list(a1,m1))
mean(a1) ; mean(m1)


mapply(function(x, y) x + y,
       x=c(a =  1, b = 2, c = 3),  # names from first
       y=c(A = 10, B = 0, C = -10))

mapply(function(x, y) x ^ y, USE.NAMES = F, # no names
       x=c(a =2, b = 3, c = 4), 
       y=c(A =2, B = 3, C = 4))