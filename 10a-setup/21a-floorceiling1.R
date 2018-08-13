# R Tips1

#round----
round(14.5378, digits=2) # 14.54
round(14.5378, digits=1) # 14.5
round(14.5378) #15

#Significant----
signif(pi, digits=3) #3.14
signif(pi, digits=5) #3.14

#floor----
floor(3.14) #3
floor(3.56) #3

#ceiling----
ceiling(3.14) #4
ceiling(3.56) #3

pi
#truncate----
trunc(3.141593) #integer
trunc(314.1) #integer


#log----
logb(8, base=2) #3
logb(100, base=10) #3
log(100,base=2)
log(1000,2)

log2(100)
2^log2(100)

log(100,base=10)
log(1000,base=10)
log10(1000)
10^log(1000, base=10)  #antilog

#natural log -----
#to the base e=2.71
log(5)  #without base is natural log
log(5, base=2.71)
log(5, base=exp(1))

#antilog of natural log
exp(1.614)
2.71^log(5)
2.71^1.614
