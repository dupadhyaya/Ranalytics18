#ARIMA

set.seed(1)

# set number of observations
(my.n <- 5000)

# set model's parameters
(my.model <- list(ar = 0.5, ma = -0.1))
(my.sd <- 1)

# simulate model
(my.ts <- arima.sim(n = my.n, model = my.model , sd = my.sd))

library(ggplot2)

# set df
temp.df <- data.frame(y = unclass(my.ts), date = Sys.Date() + 1:my.n)
head(temp.df, n=10)
p <- ggplot(temp.df, aes(x = date, y = y))
p <- p + geom_line(size=0.5)
print(p)

head(temp.df)
# estimate arima model
my.arima <- arima(my.ts, order = c(1,0,1))

# print result
print(coef(my.arima))

print(summary(my.arima))


# read file
my.f <- 'data/SP500.csv'
df.SP500 <- read.csv(my.f, header=F, col.names = c('price'))
head(df.SP500)
names(df.SP500)
calc.ret <- function(P) {
  # calculates arithmetic returns from a vector of prices
  #  # Args:
  #   P - vector of prices (numeric)
  #  # Returns:  #   A vector of returns
  
  my.length <- length(P)
  ret <- c(NA, P[2:my.length]/P[1:(my.length - 1)] - 1)
  return(ret)
}
head(df.SP500)

# set return column
(df.SP500$ret <- calc.ret(df.SP500$price))

library(tseries)
print(adf.test(na.omit(df.SP500$ret)))
  
print(adf.test(df.SP500$price))

library(forecast)

# estimate arima model with automatic identification
my.autoarima <- auto.arima(x = df.SP500$ret)

# print result
print(my.autoarima)

# forecast model
print(forecast(my.autoarima, h = 5))
