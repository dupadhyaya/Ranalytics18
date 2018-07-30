# Add Margins

marks = matrix(1:12, nrow=3)
marks
addmargins(marks)
addmargins(marks, FUN=sd)
addmargins(marks, FUN=list(sum, sd))
addmargins(marks, FUN=list(list(sum, sd), list(var, median)))
addmargins(marks, FUN=list(SUM=sum, StdDev = sd))  # no spaces



set.seed(1)
x <- sample( 1:7, 20, replace = TRUE)
y <- sample( 1:7, 20, replace = TRUE)
table(x,y)
tx <- addmargins( table(x, y) )
print(tx, zero.print = ".")




years <- sample(c("2015", "2016", "2017"), 177, replace = TRUE)
matches <- sample(c("test", "oneday"), 177, replace = TRUE)
teams <- sample(c("india", "pakistan", "england", "australia"), 177, replace = TRUE)
dfcricket = data.frame(years, matches, teams)
dfcricket
(A <- table(years, matches, teams))
(B = table(dfcricket))  # this also works
addmargins(A)
addmargins(B)

ftable(A)
ftable(addmargins(A))

# Non-commutative functions - note differences between resulting tables:
ftable(addmargins(A, c(1, 3),
                  FUN = list(Sum = sum, list(Min = min, Max = max))))
ftable(addmargins(A, c(3, 1),
                  FUN = list(list(Min = min, Max = max), Sum = sum)))

# Weird function needed to return the N when computing percentages
sqsm <- function(x) sum(x)^2/100  # user defd function

(C <- table(teams, matches))
apply(C, 2, sum)/100
sweep(C, 2, apply(C, 2, sum)/100, "/")
?sweep
round(sweep(C, 2, apply(C, 2, sum)/100, "/"), 1)


round(sweep(addmargins(C, 1, list(list(All = sum, N = sqsm))), 2,
            apply(C, 2, sum)/100, "/"), 1)
round(sweep(addmargins(C, 2, list(list(All = sum, N = sqsm))), 1,
            apply(C, 1, sum)/100, "/"), 1)

# A total over Bee requires formation of the Bee-margin first:
mC <-  addmargins(C, 2, FUN = list(list(Total = sum)))
round(ftable(sweep(addmargins(mC, 1, list(list(All = sum, N = sqsm))), 2,
                   apply(mC, 2, sum)/100, "/")), 1)


# Example 2


(M = matrix( 1:12, ncol=3))
addmargins(M)
addmargins(M,margin = 1)
addmargins(M, FUN=mean)
addmargins(M, FUN=list(list(mean,sum), list(sd, median)))


