# Functional Programming
#http://adv-r.had.co.nz/Functional-programming.html

?Map
Map(sum, 1:5, 1:5, 1:5)
Map(sum, 1:5, 1:5, 1:5, simplify2array=F)
Map(sum, 1:5, 11:15, 21:25, simplify=T)

Reduce(f, x, init, right = FALSE, accumulate = FALSE)
Filter(f, x)
Find(f, x, right = FALSE, nomatch = NULL)
Map(f, ...)
Negate(f)
Position(f, x, right = FALSE, nomatch = NA_integer_)

x = 1:12
Position(f=Find, x)


#http://www.rmanchester.org/presentations/2013/05/ManchesterR_-_FP_in_R_-_David_Springate_-_20130502.pdf

'+'(1,2)
':'(1,10)
