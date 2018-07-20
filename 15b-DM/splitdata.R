# Split data
#partitioning data(train/test) is different from split - 
mtcars
names(mtcars)
df=mtcars[,c('mpg','cyl','disp','hp','wt','gear','am')]

#Case-1----
names(df)

#1a-split by column values
split(df, df$am)

#1b- split -no of rows randomly selected rows between 1 to 5
split(df, sample(1:5, nrow(df), replace=T))
#sample() will assign equal probability to each group.


#Case-2----
#split into bins , 4 here
nrow(df)
stopifnot(nrow(df) %% 4 == 0)
df2    <- df[order(runif(nrow(df))), ]
(bins  <- rep(1:4, nrow(df2) / 4))
split(df2, bins)

#Case-3----
#library(githubinstall)
#githubinstall("minDiff")
library(minDiff)
#split into groups with criteria avg values of mpg, wt
names(df)
df3 <- create_groups(df, criteria_scale = c("mpg",'wt'), sets_n = 4, repetitions = 10)
df3
df3[order(df3$newSet),]

#now split the data and find mean values
(groups = split(df3, df3$newSet))
sapply(groups, FUN=function(i) sapply(i[, c('mpg','wt')], mean))
sapply(groups, function(x) colMeans(x[c('mpg','wt')]))

#rejoin the groups
library(dplyr)
bind_rows(groups) %>%  group_by(newSet) %>%  summarise_all(funs(mean))

#bind the splitted lists
library(data.table)
rbindlist(groups)


#Case-4----
set.seed(1234)
split(df, sample(rep(1:2, 16)))



#Case-5 ----
library(plyr)
dlply(df, "am", identity)
#spliting by multiple columns values
dlply(df,c( "am",'cyl'), identity)

dlply(df, c("cyl", "am"))


#Case-6----
#slow
df %>% group_by(am) %>% do(data = (.)) %>% select(data) %>% map(identity) 
