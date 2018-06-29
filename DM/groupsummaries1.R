# Group Summaries



#Case- ----
#dplyr
df = mtcars[,c('cyl','am','hp','wt','mpg')]

# Note the use of the '.' function to allow
# group and sex to be used without quoting
ddply(df, .(cyl, am), summarize,  mean = round(mean(wt), 2),sd = round(sd(hp), 2))

#Case-
# An example using a formula for .variables
ddply(df[1:15,], ~ am, nrow)

# Applying two functions; nrow and ncol
ddply(df, .(am), c("nrow", "ncol"))

base2 <- ddply(baseball, .(id), mutate,
               career_year = year - min(year) + 1
)