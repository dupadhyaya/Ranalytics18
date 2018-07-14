# Find Duplicates

x <- c(9:20, 1:5, 3:7, 0:8)
## extract unique elements
x

(xu <- x[!duplicated(x)])

## similar, same elements but different order:
(xu2 <- x[!duplicated(x, fromLast = TRUE)])

## xu == unique(x) but unique(x) is more efficient
stopifnot(identical(xu,  unique(x)),
          identical(xu2, unique(x, fromLast = TRUE)))

duplicated(iris)[140:143]

duplicated(iris3, MARGIN = c(1, 3))
anyDuplicated(iris) ## 143

anyDuplicated(x)
anyDuplicated(x, fromLast = TRUE)


subset(df, !duplicated(subset(df, select=c(allrl, RAW.PVAL))))