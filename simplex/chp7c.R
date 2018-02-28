#LP Graphical
#https://cran.r-project.org/web/packages/intpoint/intpoint.pdf
library(intpoint)
#------
interior_point(t, c, bA = NULL, A = NULL, bm = NULL, m = NULL,
               bM = NULL, M = NULL, e = 1e-04, a1 = 1, a2 = 0.97)

##
c<-c(1,3,-2)
bA<-c(25,30)
A<-array(4,c(2,3))
A[1,2]<-8;A[1,3]<-6;A[2,1]<-7;A[2,2]<-5;A[2,3]<-9
interior_point(-1,c,bA,A)
##
c<-c(1,2)
bm<-c(4)
bM<-c(1)
m<-array(1,c(1,2))
m[1,1]<-0
M<-array(1,c(1,2))
interior_point(1,c,bm=bm,m=m,bM=bM,M=M)
##
# This example is taken from Exercise 7.5 of Gill, Murray,
# and Wright (1991).
enj <- c(200, 6000, 3000, -200)
fat <- c(800, 6000, 1000, 400)
vitx <- c(50, 3, 150, 100)
vity <- c(10, 10, 75, 100)
vitz <- c(150, 35, 75, 5)
interior_point(1,c=enj, m=fat, bm=13800, M=rbind(vitx, vity, vitz),
               bM = c(600, 300, 550))





#----------
solve2dlp(t = 1, c = NULL, bA = NULL, A = NULL, bm = NULL, m = NULL,
          bM = NULL, M = NULL, z = 1, ip = 1, e = 1e-04, a1 = 1, a2 = 0.97)


# Max Z = x2
# Subject to 2x1 - x2 = -2
# x1 + 2x2 = 8
# x1, x2 >= 0
c=c(3,2)
M1=c(2,-1)
bM1=-2
m1=c(1,2)
bm1=8
solve2dlp(t=1, m=m1, bm=bm1, M=M1, bM=bM1, c=c, z=0, ip=0)


#---
t1=1; z1=1;ip1=1
c1=c(70,50) # Objective func
m1=rbind(c(4,3),c(2,1))
bm1=c(240,100)

solve2dlp(c=c1,bm=bm1,m=m1,z=z1,ip=ip1 )
abline(h=40); abline(v=30)
locator(n=3,type='n')


#
t1=1; z1=1;ip1=1
c1=c(50,20) # Objective func
m1=rbind(c(2,4),c(100,50),c(1,0))
bm1=c(400,8000,60)
#M1=c(1,0)
#BM1=c(60)

#solve2dlp(c=c1,bm=bm1,m=m1,bM=bM1,M=M1,z=0,ip=ip1 )
solve2dlp(c=c1,bm=bm1,m=m1,z=0,ip=1 )
locator(n=1,type='n')
abline(h=40,col='red'); abline(v=60,col='red')


m1<-c(0,1)
bm1<-4
M1<-c(1,1)
bM1<-1
c<-c(1,2)
solve2dlp(t=1, m=m1, bm=bm1, M=M1, bM=bM1, c=c, z=1, ip=1)
# a problem with several constraints
m1<-rbind(c(1,0), c(1,2),c(0,1))
bm1<-c(5,10,4)
c=c(1,3)
solve2dlp(t=1, m=m1, bm=bm1, c=c, z=1, ip=1)
