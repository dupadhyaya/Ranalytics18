# Australian Beer
library(ts)

library(gsheet)
df1 = gsheet2tbl('https://docs.google.com/spreadsheets/d/1RCj6uvsu242xDf1l5Qb720DSnOmjnTUG8ety3iYBG90')
beer=df1

beer.ts <- ts(beer, frequency = 12, start = c(1956,1), end = c(1994,12))
beer.ts.qtr <- aggregate(beer.ts, nfrequency=4)
beer.ts.yr <- aggregate(beer.ts, nfrequency=1)
plot.ts(beer.ts[,2], main = "Monthly Beer Production in Australia", xlab = "Year", ylab = "ML")

plot.ts(beer.ts.qtr[,2], main = "Quarterly Beer Production in Australia", xlab = "Year", ylab = "ML")


seasonplot(beer.ts[,2], year.labels = TRUE, year.labels.left=TRUE, col=1:40, pch=19, main = "Monthly Beer Production in Australia - seasonplot", xlab = "Month", ylab = "ML")

