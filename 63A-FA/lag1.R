#Lag

x <- sample(c(1:9), 10, replace = T)
y <- lag(x, 1)
(ds <- cbind(x, y))
ds

y <- lag(x, 2)
(ds <- cbind(x, y))


require(zoo)
set.seed(123)
x <- zoo(sample(c(1:9), 10, replace = T))
y <- lag(x, -1, na.pad = TRUE)  #shift down
cbind(x, y)

y <- lag(x, 1, na.pad = TRUE)  #from bottom
cbind(x, y)


#diff

x
diff(x)
lag(x, k=-1)
diff(x) / lag(x, k=-1)
log(x)
diff(log(x))  #x2-x1

