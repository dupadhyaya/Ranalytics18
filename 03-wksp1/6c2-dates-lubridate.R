#Package Lubridate https://data.library.virginia.edu/working-with-dates-and-time-in-r-using-the-lubridate-package/
# Date Functions - Deal with Date & Time

#lubridate provides a series of functions that are a permutation of the letters “m”, “d” and “y” to represent the ordering of month, day and year. For example, if our data has a column of dates such as May 11, 1996, our dates are ordered month-day-year. Therefore we would use the mdy function to transform the column to a date object. If our dates were in the order of, say, year-month-day, we would use the ymd function. lubridate provides functions for every permutation of “m”, “d”, “y”.
  
  
#Eg1
library(lubridate)
(date8a = lubridate::ymd("20110604"))
(date8 = ymd("20110604"))
class(date8)
date8 + 1:10
#date in different format seq
mdy("06-04-2011") #mon-date-year
dmy("04/06/2011") #date-mon-year

#Parsing functions automatically handle a wide variety of formats and separators, which simplifies the parsing process.

begin = c("May 11, 1996", "September 12, 2001", "July 1, 1988")
end = c("7/8/97","10/23/02","1/4/91")
class(begin)  ## [1] "character"
class(end) ## [1] "character"

(begin = mdy(begin))
## [1] "1996-05-11" "2001-09-12" "1988-07-01"
class(begin)

(end = mdy(end))
## [1] "1997-07-08" "2002-10-23" "1991-01-04"

class(begin) ; class(end)## [1] "Date"


#If your date includes time information, add h, m, and/or s to the name of the function. ymd_hms() is probably the most common date time format. To read the dates in with a certain time zone, supply the official name of that time zone in the tz argument.

begin1 = c("May 11, 1996 12:05", "September 12, 2001 1:00", "July 1, 1988 3:32")
end1 = c("7/8/97 8:00","10/23/02: 12:00","1/4/91 2:05")
(begin1a = mdy_hm(begin1))
(end1a = mdy_hm(end1))

class(begin1a) ; class(end1a) ## [1] "POSIXct" "POSIXt"
begin1a ; as.numeric(begin1a)
end1a ; as.numeric(end1a)

#class is now “POSIXct”. “POSIXct” represents the number of seconds since the beginning of 1970. If a date is before 1970, the number of seconds is negative. 

#Notice also the the letters “UTC” have been appended to the date-times. UTC is short for Universal Coordinated Time. it’s basically the time standard by which the world regulates clocks. If we prefer we can specify a time zone when formatting dates by using the tz argument. Here’s how we can specify the Eastern Time Zone in the United States when formatting our dates.

(begin1b = mdy_hm(begin1, tz = "US/Eastern"))
(begin1c = mdy_hm(begin1, tz = "Asia/Calcutta"))

#use the OlsonNames function to see a character vector of all time zone names
OlsonNames()
Sys.timezone()

#read in times without dates using the functions ms, hm, or hms, where again “h”, “m”, and “s” stand for “hours”, “minutes”, and “seconds”

time1 = c("1:13", "0:58", "1:01")
time2 = c("12:23:11", "09:45:31", "12:05:22")
time3 = c("2:14", "2:16", "3:35")

(time1a <- ms(time1)) ## [1] "1M 13S" "58S"    "1M 1S"
(time2a <- hms(time2)) ## [1] "12H 23M 11S" "9H 45M 31S"  "12H 5M 22S"
(time3a <- hm(time3)) ## [1] "2H 14M 0S" "2H 16M 0S" "3H 35M 0S"



arrive <- ymd_hms("2018-04-27 18:40:15", tz = "Asia/Calcutta")
arrive
leave <- ymd_hms("2018-04-29 22:00:00", tz = "Asia/Calcutta")
leave

leave - arrive  # Time Difference

#Setting and Extracting information
#Functions

#Eg
second(arrive)
second(arrive) = 25  #change
second(arrive)
arrive
minute(arrive)
hour(arrive)
day(arrive)
wday(arrive)
wday(arrive)
wday(arrive, label = TRUE)

week(arrive)

month(arrive)
year(arrive)
tz(arrive)

#Time Intervals
#save an interval of time as an Interval class object
(student1 <- interval(arrive, leave))
(student2 <- arrive %--% leave)
(student3 = interval(ymd(20180320, tz = "Asia/Calcutta"),
                     ymd(20180327, tz = "Asia/Calcutta")))

(courseperiod = interval(ymd(20180421, tz = "Asia/Calcutta"),
                         ymd(20180425, tz = "Asia/Calcutta")))

int_overlaps(student1, courseperiod)
#TRUE
int_overlaps(student3, courseperiod)

setdiff(student2, courseperiod)
setdiff(student3, courseperiod)

?setdiff
#2017-07-05 IST--2017-07-15 IST

#Other Functions
#int_start, int_end, int_flip, int_shift, int_aligns, union, intersect, and %within%.
int_start(courseperiod)
int_end(courseperiod)
int_flip(courseperiod)
int_aligns(student1, courseperiod)  #share end point

dates = now() + days(1:10)
dates
int_diff(dates)

# Years Betw ----------
ref_date <- as.Date('20/04/08',format='%d/%m/%y')
today <- as.Date(Sys.Date(), format='%d/%m/%y')
year(arrive) = 2015
arrive
arrive2 = as.Date(arrive, format='%d/%m/%y')
(yrsbetw = year(today)-year(ref_date))
(yrsbetw = year(today)-year(arrive2))

