# Split data

mtcars
names(mtcars)
df=mtcars[,c('mpg','cyl','disp','hp','wt','gear','am')]
names(df)
#split by column values
split(df, df$am)

#split by no of rows randomly selected rows between 1 to 5
split(df, sample(1:5, nrow(df), replace=T))
#sample() will assign equal probability to each group.


#Case-3----
nrow(df)
stopifnot(nrow(df) %% 4 == 0)
df2    <- df[order(runif(nrow(df))), ]
bins  <- rep(1:4, nrow(df2) / 4)
split(df2, bins)

#Case-5----
#library(githubinstall)
#githubinstall("minDiff")
library(minDiff)
names(df)
df3 <- create_groups(df, criteria_scale = c("mpg",'wt'), sets_n = 4, repetitions = 10)
df3
df3[order(df3$newSet),]
(groups = split(df3, df3$newSet))
sapply(groups, FUN=function(i) sapply(i[, c('mpg','wt')], mean))
sapply(groups, function(x) colMeans(x[c('mpg','wt')]))

library(dplyr)
bind_rows(df3) %>%  group_by(newSet) %>%
  summarise_each(funs(mean))

library(data.table)
rbindlist(groups)
rbindlist(df3)[, lapply(SD, mean), by = .(mpg, wt)]

library(dplyr)


library(plyr)
x <- daply(mtcars, mtcars$am, function(x)return(x))
x
?daply


#Seperate one column to multiple columns
library(dplyr)
separate(df, cyl, into, sep = "[^[:alnum:]]+", remove = TRUE,  convert = FALSE, extra = "warn", fill = "warn")

library(dplyr)
df6 <- data.frame(x = c(NA, "a.b", "a.d", "b.c"))
df6 %>% separate(x, c("A", "B"))
