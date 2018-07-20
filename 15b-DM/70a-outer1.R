# Outer

A<-c(1,3,5,7,9)
B<-c(0,3,6,9,12)
?pmax  # parallel max
#(1,0)->1 ; (3,3)-> 3 ; (5,6)->6

mapply(FUN=pmax, A, B)
#[1]  1  3  6  9 12

outer(A,B, pmax)  # every combination of every element
# only useful for linear algebra type things. 
# However, it can be used much like mapply to apply a
# function to two vectors of inputs. 
# The difference is that mapply will apply the function 
# to the first two elements and then the second two etc, 
# whereas outer will apply the function to every combination
# of one element 
# from the first vector and one from the second. For example: