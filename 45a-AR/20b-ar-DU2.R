# My Basket 

library(package = "arules")
mypurchase = read.csv("./ar/my_basket1.txt", sep=" ")


v = read.table(file = file('stdin'))
transactions = read.transactions(file = file("stdin"), format = "basket", sep = ",")
#a,b
#a,b,c
#
#
mybasket = read.csv(file='./ar/my_basket1.txt')
v = read.table(file = file('stdin'))
transactions = read.transactions(file = file("stdin"), format = "basket", sep = ",")
