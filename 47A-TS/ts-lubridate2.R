# Package Lubridate
# Date Functions - Date & Time

#Eg1
library(lubridate)
lubridate::ymd("20110604")
lubridate::mdy("06-04-2011")
lubridate::dmy("04/06/2011")
#Parsing functions automatically handle a wide variety of formats and separators, which simplifies the parsing process.

#Eg1
#If your date includes time information, add h, m, and/or s to the name of the function. ymd_hms() is probably the most common date time format. To read the dates in with a certain time zone, supply the official name of that time zone in the tz argument.
OlsonNames()
Sys.timezone()
Sys.timezone(location=F)
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
