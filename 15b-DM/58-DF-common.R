#find common between DF
#http://www.cookbook-r.com/Manipulating_data/Comparing_data_frames/

dfA <- data.frame(Subject=c(1,1,2,2), Response=c("X","X","X","X"))
dfA

dfB <- data.frame(Subject=c(1,2,3), Response=c("X","Y","X"))
dfB

dfC <- data.frame(Subject=c(1,2,3), Response=c("Z","Y","Z"))
dfC

dfA$Coder <- "A"
dfB$Coder <- "B"
dfC$Coder <- "C"
dfA
df <- rbind(dfA, dfB, dfC)                    # Stick them together
df
df <- df[,c("Coder", "Subject", "Response")]  # Reorder the columns to look nice
df

# Find the rows which have duplicates in a different group.
dupRows <- dupsBetweenGroups(df, "Coder")
dupRows
cbind(df, dup=dupRows)
#find the rows that are unique within each group:
cbind(df, unique=!dupRows)
#Store the results in df
dfDup <- cbind(df, dup=dupRows)
dfDup
dfA1 <- subset(dfDup, Coder=="A", select=-Coder)
dfA1


#2 df 
# 1 with few unique rows
# 2 table with multiple rows of same data
# common column is not same but part of it is same

a <-c('a','b','c','d','e')
b <-c('a','b','d','e', NA)
a[!(a %in% b)]
a[(a %in% b)]

ab <- data.frame(a,b)
ab$a[!(ab$a %in% ab$b)]
ab$a[(ab$a %in% ab$b)]

#

set.seed(111)       # so can replicate results
x <- matrix(runif(500), ncol=2)
x
y <- matrix(runif(2000), ncol=2)
y
library(Hmisc)
w <- find.matches(x, y, maxmatch=5, tol=c(.02,.03))
?find.matches
head(x)
head(y)
w
w$matches[1:5,]
w$distance[1:5,]
# Find first x with 3 or more y-matches
num.match <- apply(w$matches, 1, function(x)sum(x > 0))
j <- ((1:length(num.match))[num.match > 2])[1]
x[j,]
y[w$matches[j,],]


summary(w)


#
library(plyr)
# count the occurrences of each id in the baseball dataframe, then get the subset with a freq >25
head(baseball)
longterm <- subset(count(baseball, "id"), freq > 25)
longterm
# Select only rows from these longterm players from the baseball dataframe
# (match would default to match on shared column names, but here was explicitly set "id")
bb_longterm <- match_df(baseball, longterm, on="id")
bb_longterm[1:5,]

#-------------

dupsbetween
#https://rdrr.io/github/vapniks/mergeutils/man/dupsBetweenGroups.html

install.packages("remotes")
remotes::install_github("vapniks/mergeutils", force=T)
library(mergeutils)
dupsBetweenDFs(dfs, by = NULL, matchall = FALSE)
dupsBetweenDFs(mtcars, mtcars, by=wt)

