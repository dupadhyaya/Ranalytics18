#String Split

(x=c('10-20','20-30','30-40','40-50'))
(x1 = strsplit(x,"-"))
(x2 = unlist(x1))
(x3 = as.numeric(x2))
(x4 = unique(x3))
?strsplit
x4
x4[-length(x4)]
diff(x4)
diff(x4)/2

(x5 = x4[-length(x4)] + diff(x4)/2)


# Mid Point
a <- seq(0,50,10)
a
a[-length(a)] + diff(a)/2
