help(DateTimeClasses)
t <- Sys.time()
typeof(t)
t
print(t)
cat(t,"\n")
1390505301
c <- as.POSIXct(t)
c
typeof(c)
print(c)
[1] "2014-01-23 14:28:21 EST"
> cat(c,"\n")
1390505301
>
  >
  > l <- as.POSIXlt(t)
> l
[1] "2014-01-23 14:28:21 EST"
> typeof(l)
[1] "list"
> print(l)
[1] "2014-01-23 14:28:21 EST"
> cat(l,"\n")
Error in cat(list(...), file, sep, fill, labels, append) :
  argument 1 (type 'list') cannot be handled by 'cat'
> names(l)
NULL
> l[[1]]
[1] 21.01023
> l[[2]]
[1] 28
> l[[3]]
[1] 14
> l[[4]]
[1] 23
> l[[5]]
[1] 0
> l[[6]]
[1] 114
> l[[7]]
[1] 4
> l[[8]]
[1] 22
> l[[9]]
[1] 0
>
  > b <- as.POSIXct(l)
> cat(b,"\n")
1390505301

library(bReeze)
data(winddata)
head(winddata)
# format time stamp
head(timestamp(timestamp=winddata[,1]))


#time stamp
x <- 15103
as_date(x, origin = lubridate::origin) #"2011-05-09"

y <- 1442866615
as_datetime(y, origin = lubridate::origin)
#"2015-09-21 20:16:55 UTC"

x=axis.Date(1, as.Date(15103, origin = "1960-10-01"))
x


#----
now <- Sys.time()
now
as.numeric(now)
now + 10  # adds 10 seconds
as.POSIXlt(now)
str(as.POSIXlt(now))
unclass(as.POSIXlt(now))


#----
Jan1 <- strptime("2018-01-01 00:00:00", "%Y-%m-%d %H:%M:%S")
difftime(now, Jan1, unit="week")


#----
help(strftime)
t <- Sys.time()
cat(t,"\n")
(timeStamp <-  strftime(t,"%Y-%m-%d %H:%M:%S"))
typeof(timeStamp)

#----
myData <- data.frame(time=c("2014-01-23 14:28:21","2014-01-23 14:28:55",
                            "2014-01-23 14:29:02","2014-01-23 14:31:18"),
                     speed=c(2.0,2.2,3.4,5.5))
myData
summary(myData)
myData$time[1]
myData$time <- strptime(myData$time,"%Y-%m-%d %H:%M:%S")
typeof(myData$time)
myData$time[1]
myData$time[1][[2]]

N = length(myData$time)
N
myData$time[2:N] - myData$time[1:(N-1)]
