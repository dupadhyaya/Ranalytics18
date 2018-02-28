# Date Formats
#https://www.r-bloggers.com/date-formats-in-r/
#http://www.statmethods.net/input/dates.html


# use as.Date( ) to convert strings to dates 
mydates <- as.Date(c("2007-06-22", "2004-02-13"))
# number of days between 6/22/07 and 2/13/04 
days <- mydates[1] - mydates[2]
Sys.Date() #returns today's date. 
date() #returns the current date and time.

as.Date(dates,
        format = "%m/%d/%y")