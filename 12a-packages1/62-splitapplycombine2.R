#split apply combine

df = mtcars
baseball
library(plyr)
baseball.1 <- ddply(baseball, .(id), transform, cyear = year - min(year) +1)
head(baseball.1)

ddply(df, .(cyl), filter, mpg > mean(mpg))              
ddply(.data = df,.variables = c('cyl'), .fun = function(p){ summarize(p, m1 = mean(mpg))} )
df %>% dplyr::group_by(cyl) %>% dplyr::summarize(meanMPG = mean(mpg))
ddply(df, .(cyl), filter, mpg > mean(mpg))
