#Data Format in R 
#When we import data into R, dates and times are usually stored as character or factor by default due to symbols such as “-”, “:” and “/”

cdate1='15/August/1947'
cdate1
cdate2 = c('15-Aug-1947', "26-Jan-1950", "01-Oct-2018")
cdate2

class(cdate1) ; class(cdate2)
#convert to Dates
#Default Format of Date in R
?as.Date()

#See/ Convert Date format
as.Date('2018-09-01')
#Default Format : Year-Month-Date : %Y-%m-%d
(date3= as.Date('2018-09-01',format='%Y-%m-%d'))
class(date3)

#Format Types ----
#%Y: 4-digit year (1982),%y: 2-digit year (82)
#%m: 2-digit month (01)
#%B: month (January), %b: abbreviated month (Jan) 
#%d: 2-digit day of the month (13)
#%A: weekday (Wednesday), %a: abbreviated weekday (Wed)

#convert cdate1 cdate2 to date formats
cdate1 #"15/August/1947
date1 = as.Date(cdate1, format='%d/%B/%y')
date1
#
cdate2 #"15-Aug-1947" "26-Jan-1950"
date2 = as.Date(cdate2, format='%d-%b-%Y')
date2
#

#one more practise on date format
date3 =as.Date('30Apr18',format("%d%b%y"))
class(date3)

#Date to Characters
(cdate2 = as.character(date3))
class(cdate2)


#The “Date” class means dates are stored as the number of days since January 1, 1970, with negative values for earlier dates. We can use the as.numeric function to view the raw values.

date1
as.numeric(date1)
date2
as.numeric(date2)


#Sequence of Dates
#Create Sequence of Dates

#Next day after certain date
as.Date('2018-10-01') + 1
#Sequence of Dates
as.Date('2018-09-16') + 0:14
#alternative Dates
as.Date('2018-09-16') + seq(1,10,2)


#system date
Sys.Date()
#next 15 days after todays date
Sys.Date() + 1:15

##increment/ decrement dates 
(startdt = as.Date("2018-11-30", format="%Y-%m-%d"))
(next20days = startdt + 1:20) # start : 20 days course
startdt - 1
(prev20days = startdt - c(1:20)) # before : 20 days course
rev(prev20days)



#Data Arithmetic
# date Arithmetic and subsets

#start course on 25 Oct 2018 for 30 days
(course1 = as.Date("2018-10-25") + 0:29)

#Difference in dates
course1
length(course1)  #no of days
min(course1)  # first date
max(course1)  # last date
range(course1) # start to end
mean(course1)  # center of the course period
median(course1) # middle date

sd(course1) #no meaning

#subset / select dates
course1
#1st and 5th dates
course1[c(1,5)] # 1st & 5th date 
#1st and 5th dates
course[1] ; course[5]

#duration from 8th date to first date
(duration1 = course1[8] - course1[1])
#total duration
(duration2 = max(course1) - min(course1))

#duration since independence
(independencedays = Sys.Date() - as.Date('15-08-1947', '%d-%m-%Y'))
independencedays/365  #years

as.character(Sys.Date(), format="%Y--%m--%d %A")
course1
paste(course1 , as.character(course1, format="%A"), sep=":: ")
