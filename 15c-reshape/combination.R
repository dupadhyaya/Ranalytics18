# Combination of Elements
#combinations of the elements of x taken m at a time
combn(x, m, FUN = NULL, simplify = TRUE, ...)

combn(letters[1:4], 2)

(m <- combn(10, 5, min))   # minimum value in each combination

mm <- combn(15, 6, function(x) matrix(x, 2, 3))

stopifnot(round(choose(10, 5)) == length(m),
          c(2,3, round(choose(15, 6))) == dim(mm))

## Different way of encoding points:
combn(c(1,1,1,1,2,2,2,3,3,4), 3, tabulate, nbins = 4)

## Compute support points and (scaled) probabilities for a
## Multivariate-Hypergeometric(n = 3, N = c(4,3,2,1)) p.f.:
# table.mat(t(combn(c(1,1,1,1,2,2,2,3,3,4), 3, tabulate, nbins = 4)))

## Assuring the identity
for(n in 1:7)
  for(m in 0:n) stopifnot(is.array(cc <- combn(n, m)),
                          dim(cc) == c(m, choose(n, m)))

#data frame from all combinations of the supplied vectors or factors.
expand.grid(..., KEEP.OUT.ATTRS = TRUE, stringsAsFactors = TRUE)

expand.grid(height = seq(60, 80, 5), 
            weight = seq(100, 300, 50),
            sex = c("Male","Female"))

x <- seq(0, 10, length.out = 100)
y <- seq(-1, 1, length.out = 20)
d1 <- expand.grid(x = x, y = y)
d1
(d2 <- expand.grid(x = x, y = y, KEEP.OUT.ATTRS = FALSE))
object.size(d1) - object.size(d2)
##-> 5992 or 8832 (on 32- / 64-bit platform)


# Unique Combinations
x = 1:10
y = letters[1:5]
(df= expand.grid(X=x, Y=y)) 
df[order(df$X), ]
