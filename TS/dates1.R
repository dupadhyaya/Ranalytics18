#Handling and creating Dates in R

#date in yyyy-mm-dd
dates1a = c('2018-19-1', '2018-20-1')
class(dates1a)
?as.Date
as.Date(dates1a)  # error

dates1b = as.Date(dates1a, format='%Y-%d-%m')
class(dates1b)
dates1b

#default format
dates2a = c('2018-4-21')
class(dates2a)
(dates2b = as.Date(dates2a))
class(dates2b)
format(dates2b, format=('%d-%m-%Y'))

#%Y: 4-digit year (1982),%y: 2-digit year (82)
#%m: 2-digit month (01), %d: 2-digit day of the month (13)
#%A: weekday (Wednesday), %a: abbreviated weekday (Wed)
#%B: month (January), %b: abbreviated month (Jan)

format(dates2b, format="%A  %d  %m  %y")

#System Date
Sys.Date()
format(Sys.Date(), format="%A: %d %B")

#increment/ decrement dates 
dates2b
(course = dates2b + 0:11)

cat(format(course, format="%B-%d"))
months(course)
weekdays(course)
quarters(course)

#Date to character
(dtoc = as.character(dates2b))
class(dtoc)

#one more practise on date format
dates3a =as.Date('30Apr18',format("%d%b%y"))
class(dates3a)

#Difference in dates
course
min(course)
max(course)
range(course)
mean(course)
median(course)
course[c(1,5)]
(duration = course[8] - course[1])
(duration2 = max(course) - min(course))

#Sequence of Dates

#seq(from, to, by, length.out = NULL, along.with = NULL, ...)

seq(as.Date("2016/1/1"), as.Date("2018/1/1"), "years")
## by month
seq(as.Date("2017/1/1"), by = "month", length.out = 6)
## quarters
seq(as.Date("2017/1/1"), as.Date("2018/1/1"), by = "quarter")
#Find 7th of all months between two dates
(dateseqF = seq(as.Date("2017/1/7"), as.Date("2018/1/7"), by = "1 month"))  # order

(dateseq = seq(as.Date("2018/1/7"), as.Date("2017/1/7"), by = "-1 month"))  # reverse order

rev(dateseq)# correct the order
format(rev(dateseq), "%A : %d-%b")

#another Sequence
chron::seq.dates("01/01/2017", "12/31/2017", by = "months")
chron::seq.dates("01/01/2017", "12/31/2017", by = "weeks")

