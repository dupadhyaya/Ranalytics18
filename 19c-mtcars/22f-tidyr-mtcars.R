#tidyr - mtcars
#https://datascienceplus.com/data-manipulation-with-tidyr/

# gather – converts wide data to longer format. It is analogous to the melt function from reshape2.
# spread – converts long data to wider format. It is analogous to the cast function from reshape2.
# unite – combines two or more columns into a single column.
# separate – splits one column into two or more columns.


library(tidyr)
library(dplyr)
head(mtcars)

#include the names of the cars in a column called car for easier manipulation.
mtcars$car <- rownames(mtcars)
mtcars <- mtcars[, c(12, 1:11)]
head(mtcars)
names(mtcars)

#gather
mtcarsNew <- mtcars %>% gather(attribute, value, -car)
dim(mtcarsNew)
head(mtcarsNew)
tail(mtcarsNew)


mtcarsNew <- mtcars %>% gather(attribute, value, mpg:gear)
head(mtcarsNew)
tail(mtcarsNew)


#spread
head(mtcarsNew)
mtcarsSpread <- mtcarsNew %>% spread(attribute, value)
head(mtcarsSpread)

#unite -----
#test data
set.seed(1)
date<- as.Date('2016-01-01') + 0:14
hour <- sample(1:24, 15)
min <- sample(1:60, 15)
second <- sample(1:60, 15)
event <- sample(letters, 15)
data <- data.frame(date, hour, min, second, event)
data
head(data)
#
dataNew <- data %>%
  unite(datehour, date, hour, sep = ' ') %>%
  unite(datetime, datehour, min, second, sep = ':')
dataNew
head(dataNew)

#separate-----
data1 <- dataNew %>% 
  separate(datetime, c('date', 'time'), sep = ' ') %>% 
  separate(time, c('hour', 'min', 'second'), sep = ':')
head(data1)
