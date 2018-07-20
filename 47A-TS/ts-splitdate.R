# Split Data into parts

#Split date and time seperately
#M1----
(tdatetime = Sys.time())
(splitTime <- sapply(strsplit(as.character(tdatetime), " "), "[", 2))  #time
(splitDate <- sapply(strsplit(as.character(tdatetime), " "), "[", 1))  #date

#  M2----
(df <- data.frame(datetime = c( "13:11:2013 15:39" , "13:11:2013 16:15" , "13:11:2013 17:52" ) ))
(new <- do.call( rbind , strsplit( as.character( df$datetime ) , " " ) ))

#M3----
format(as.POSIXct(tdatetime,format="%Y:%m:%d %H:%M:%S"),"%H:%M:%S")
format(as.POSIXct(tdatetime,format="%Y:%m:%d %H:%M:%S"),"%Y:%m:%d")

#Time Stamp to POSIXT
td = 1377986400
as.POSIXct(1377986400,origin="1970-01-01")
(td1 = as.POSIXct(as.numeric(td),origin="1970-01-01"))


datetime2 <- as.POSIXct('4/17/2008 16:01', format='%m/%d/%Y %H:%M') 
(datetime2split <- strsplit(format(datetime2, "%d %m %Y %H %M"), ' ') )

(x2 = as.POSIXct(td1, format='%m/%d/%Y %H:%M'))
(y2 <- strsplit(format(x2, "%d %m %Y %H %M"), ' ') )

#-----
# In R, there are two basic data types around date and time in R. One is Date, which contains only the date information like 2016–01–10. Another is POSIXct, which has both date and time information like 2016–01–10 10:45:20.

library(dplyr)
dateposix = seq(1377986400, 1377986420, by=1)
df = data.frame(dateposix)
(df$datetime = as.POSIXct(as.numeric(df$dateposix),origin="1970-01-01"))
library(lubridate)
head(df)
df$dateposix2 = format(unclass(df$datetime), scientific=F)
df <- df %>% mutate(year=year(datetime), month = month(datetime), day= day(datetime), hour=hour(datetime), min=minute(datetime))
head(format(df, scientific=F))

split1 =strsplit(format(df$datetime, "%d %m %Y %H %M"), ' ') #list form
matrix(as.numeric(unlist(split1)), ncol=5, byrow = T) 
do.call(rbind, split1)
as.Date(with(df$datetime, ISOdate(Year, Month, Day)))
  
#-----

do.call(rbind, spl) 

# using seperate in tidyr
library(dplyr)
head(df)
df1 = df['datetime']
head(df1)
df1 %>% separate(datetime, into=c('Date', 'Time'), sep=' ')
(year=as.numeric (format(df1$datetime,"%Y")))
(month=as.numeric (format(df1$datetime,"%m")))
(day=as.numeric (format(df1$datetime,"%d")))
(hour=as.numeric (format(df1$datetime,"%H")))
(min =as.numeric (format(df1$datetime,"%M")))
data.frame(df1,cbind(year, month, day, hour, min))
