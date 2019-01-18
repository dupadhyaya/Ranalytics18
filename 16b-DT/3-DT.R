#data.table - subset data

library(data.table)
DTmtcars = data.table(mtcars)

DTmtcars

DTmtcars[  , .SD, mpg > 25]

#sum groupwise for mpg > 25

#first row
DTmtcars[  , .SD[1], mpg > 25]
DTmtcars[  , .SD[.N], mpg > 25]
#last row

#condition based
DTmtcars[ mpg > 20 & am == 1,  ]

DTmtcars[ mpg > 20, .(sumHP=sum(hp)), by='gear']

#nested groups
DTmtcars[ mpg > 20, .(sumHP=sum(hp)), by=c('gear', 'cyl')]
DTmtcars[ mpg > 20, .(sumHP=sum(hp), meanMPG = mean(mpg)), by=c('gear', 'cyl')]

#group and sort
DTmtcars[ mpg > 20, .(sumHP=sum(hp)), by=gear]
DTmtcars[ mpg > 20, .(sumHP=sum(hp)), keyby= .(gear)]

DTmtcars[order(-rank(gear), mpg)]

DTmtcars[order(-rank(gear), cyl), .(sumHP=sum(hp)), by=c('gear','cyl')]

DTmtcars[am == 0, tx :='Auto']
DTmtcars
DTmtcars[am == 1, tx1 := 'Manual']

