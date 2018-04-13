#functions which allow you to specify the order in which year, month and day components appear in date


library(lubridate)
ymd("20170601")
mdy("06-01-2017")
dmy("01/06/2017")
dmy("01-06-2017")

Sys.timezone(location=T)
#282- Asia/Kolkata
('Asia/Kolkatta')

(arrive <- ymd_hms("2018-04-09 14:00:00", tz = "Asia/Calcutta"))
(leave <- ymd_hms("2018-04-14 13:00:00", tz = "Asia/Calcutta"))
(leave2 <- ymd_hms("2018-04-14 13:00:00", tz = "GMT"))
leave - arrive
leave2- arrive
#Check the seconds for arrival
second(arrive)
#change seconds in arrival data
second(arrive) <- 25
arrive

#Check which date/day/month I arrived
mday(arrive) # arrived on 9 of the month
wday(arrive) ##  in no start from Sun-1, Mon-2 ..
wday(arrive, label = TRUE)  # arrived on Mon
month(arrive)
month(arrive, label=T, abbr=T)
month(arrive, label=T, abbr=F)
year(arrive)


#practise upto here for IITG 
#Students to look up other practise exercises for Data below


meeting <- ymd_hms("2011-07-01 09:00:00", tz = "Pacific/Auckland")
## "2011-07-01 09:00:00 NZST"
with_tz(meeting, "America/Chicago")
## "2011-06-30 16:00:00 CDT"

mistake <- force_tz(meeting, "America/Chicago")
## "2011-07-01 09:00:00 CDT"
with_tz(mistake, "Pacific/Auckland")
## "2011-07-02 02:00:00 NZST"
## 
auckland <- interval(arrive, leave)
auckland
## 2011-06-04 12:00:00 NZST--2011-08-10 14:00:00 NZST
auckland <- arrive %--% leave
## 2011-06-04 12:00:00 NZST--2011-08-10 14:00:00 NZST
auckland
tdiff = arrive - leave
tdiff

jsm <- interval(ymd(20110720, tz = "Pacific/Auckland"), ymd(20110831, tz = "Pacific/Auckland"))
jsm
int_overlaps(jsm, auckland) ## TRUE
setdiff(auckland, jsm) ## 2011-06-04 12:00:00 NZST–2011-07-20 NZST

minutes(2) # period
## 2 minutes
dminutes(2) # duration
## 120s (~2 minutes)
dhours(2)
seconds(2)
dyears(2)
leap_year(2011)
## FALSE
ymd(20110101) + dyears(1)
## "2012-01-01 UTC"
ymd(20110101) + years(1)
## "2012-01-01 UTC"

leap_year(2012)
## TRUE
ymd(20120101) + dyears(1)
## "2012-12-31 UTC"
ymd(20120101) + years(1)
## "2013-01-01 UTC"

meetings <- meeting + weeks(0:5)
meetings
## [1] "2011-07-01 09:00:00 NZST" "2011-07-08 09:00:00 NZST"
## [3] "2011-07-15 09:00:00 NZST" "2011-07-22 09:00:00 NZST"
## [5] "2011-07-29 09:00:00 NZST" "2011-08-05 09:00:00 NZST"

periods = meeting + days(1:5)
periods


second(arrive)
## 0
second(arrive) <- 25
arrive
## "2017-06-01 12:00:25 IST"
second(arrive) <- 0
wday(arrive)
## 5
wday(arrive, label = TRUE)
## Thurs



meeting <- ymd_hms("2017-07-01 09:00:00", tz = "Asia/Calcutta")
meeting

with_tz(meeting, "America/Chicago")
mistake <- force_tz(meeting, "America/Chicago")
with_tz(mistake, "Asia/Calcutta")
mistake


udit <- interval(arrive, leave)
udit
nakul <- arrive %--% leave
nakul

dhiraj <- interval(ymd(20170702, tz = "Asia/Calcutta"),
                   ymd(20170704, tz = "Asia/Calcutta"))
dhiraj
udit
#Will  visit overlap with and his travels
int_overlaps(udit, dhiraj) ## TRUE

#For what part of Dhiraj's' visit will Udit will be there?
setdiff(udit, dhiraj)
setdiff(dhiraj, udit)

minutes(2) # period
## 2 minutes
dminutes(2) # duration
## 120s (~2 minutes)
eminutes(2)


leap_year(2011)
## FALSE
ymd(20110101) + dyears(1)
## "2012-01-01 UTC"
ymd(20110101) + years(1)
## "2012-01-01 UTC"

leap_year(c(2012, 2017))
## TRUE FALSE
ymd(20170101) + dyears(1)
## "2018-01-01"
ymd(20170101) + years(1)
## "2018-01-01"
## 

meeting <- ymd_hms("2017-07-01 09:00:00", tz = "Asia/Calcutta")
meetings <- meeting + weeks(0:5)
meetings

friend = interval(ymd(20170705, tz = "Asia/Calcutta"),
                ymd(20170715, tz = "Asia/Calcutta"))
friend
mypd = interval(ymd(20170702, tz = "Asia/Calcutta"),
                          ymd(20170803, tz = "Asia/Calcutta"))
mypd
int_overlaps(friend, mypd)

#For what part of Dhiraj's' visit will Udit will be there?
setdiff(friend, mypd)


?interval
mypd
meetings %within% mypd

meeting <- ymd_hms("2017-07-01 09:00:00", tz = "Asia/Calcutta")
meetings <- meeting + weeks(0:5)
meetings
meetings %within% mypd

mypd / edays(1)
mypd / ddays(1)
mypd / ddays(2)
mypd / dminutes(1)
mypd / dseconds(1)
mypd / months(1)
mypd / years(1)


as.period(mypd %% months(1))
as.period(mypd)

last_day <- function(date) {
  ceiling_date(date, "month") - days(1)
}
# try last_day(ymd(20000101) + months(0:11))

last_day(ymd(20000101))
last_day(ymd(20000101) + months(0:11))
