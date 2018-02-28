# My Egs----------------------------------

#-------------
#----
library(boot)
a = rep(1, 6)                        # vector with 6 ones
A1 = matrix(1, nrow=6, ncol=6)       # 6x6 matrix with all ones
b1 = c(5, 7, 15, 10, 15, 9)
a;A1;b1
simplex(a=a, A1=A1, b1=b1, maxi=TRUE)

#----------
#http://stackoverflow.com/questions/32399981/r-project-simplex-method-how-to-specify-variables-in-this-case
#24h shop and we need to know how maximum employees do we need if there are six shifts (8-12,12-16 etc.) during the day, and one employee can work max. 8 hours. 
#Limits of the employees at one shift are:
#0:00-4:00 < 5 4:00-8:00 < 7 8:00-12:00< 15 
#12:00-16:00 <10 16:00-20:00 <15 20:00-24:00 <9

a=c(1,1,1,1,1,1)
w1=c(4,0,0,0,0,4)
w2=c(4,4,0,0,0,0)
w3=c(0,4,4,0,0,0)
w4=c(0,0,4,4,0,0)
w5=c(0,0,0,4,4,0)
w6=c(0,0,0,0,4,4)
b1=c(20,28,60,40,60,36)

library(boot)
simplex(a=a,A1=rbind(w1,w2,w3,w4,w5,w6),b1=b1,maxi=T)

