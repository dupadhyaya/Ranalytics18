# Environment

#objects in memory
ls()

#create an object
x = 1:5
ls()  #check
y=100:200
ls()  #check

#remove one
rm(x)  #remove x from environ

ls() #check
#remove all
rm(list = ls())

ls()  #check

   