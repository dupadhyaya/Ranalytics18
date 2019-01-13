#data.table

library(data.table)
DTmtcars = data.table(mtcars)

str(DTmtcars)

#group by

DTmtcars[ , mean(mpg), by=gear]
DTmtcars[ , .(MeanMPG = mean(mpg)), by=list(gear,cyl)]

#count of cars in the category
DTmtcars[ , .(MeanMPG = mean(mpg), n=.N), by=list(gear,cyl)]

DTmtcars[ , .SD[, mean(mpg)], by=gear]
DTmtcars[ , .SD[, mean(mpg),by=gear], by=cyl]
DTmtcars[ , .SD[, .(mean(mpg), n=.N),by=gear], by=cyl]
DTmtcars[ , .SD[, .(mean(mpg), n=.N),by=gear], by=list(cyl,am)]


#sort
DTmtcars
DTmtcars[ sort(mpg),mean(mpg) , by=cyl]



DTmtcars[,`:=`(avg_mpg_cyl=mean(mpg), Ncyl=.N), by=cyl]
DTmtcars[,.(avg_mpg_cyl=mean(mpg), Ncyl=.N), by=cyl]

DTmtcars
DTmtcars[,.(Ncylgear=.N, avg_mpg_cyl_gear=mean(mpg)), by=.(cyl, gear)]

setkey(DTmtcars, cyl, gear)  
DTmtcars


#inrease no of rows
dt <- data.table(mtcars)
dt <- dt[sample(1:.N, 100000, replace=T), ] # increase # of rows in mtcars
dt$gear <- sample(1:300, nrow(dt), replace=T) # adding in more cateogries
dt

uid <- unique(dt$gear)
system.time(dt[, dt[!gear %in% (uid[.GRP]), mean(mpg), by=cyl] , by=gear][order(cyl, gear)])
dt[, dt[!gear %in% (uid[.GRP]), mean(mpg), by=cyl] , by=gear][order(cyl, gear)]
mtcars
#????
DTmtcars[,{
  vbar = sum(hp)
  n = .N
  .SD[,.(n, .N, sum_in_gear_cyl=sum(hp), sum_in_cyl=vbar), by=gear]
} , by=cyl]
