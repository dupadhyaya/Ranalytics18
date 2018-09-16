# Mov Average
#https://www.otexts.org/fpp/6/2

admission = c(100,110,115,130,150,145,160,125,123,134)
length(admission)
admyr = ts(admission, start=2001)
admyr
(100+110+115)/3
forecast::ma(admyr, order=3)
plot(admyr, main="Yearly Admissions", ylab="Admissions", xlab="Year")
lines(ma(admyr,3),col="red")

admyr1 <- window(admyr,start=2005)
admyr1

ma4 <- ma(admyr1, order=4, centre=FALSE)
ma4
ma2x4 <- ma(admyr1, order=4, centre=TRUE)
ma2x4




abbshares <- scan(file="")
#type the data in console windows
library(pracma)
plot(abbshares, type = "l", col = 1, ylim = c(15, 30),
     main = "Types of moving averages", sub = "Mid 2011--Mid 2012",
     xlab = "Days", ylab = "ABB Shares Price (in USD)")
y <-  pracma::movavg(abbshares, 50, "s"); lines(y, col = 2)
y <- pracma::movavg(abbshares, 50, "t"); lines(y, col = 3)
y <- pracma::movavg(abbshares, 50, "w"); lines(y, col = 4)
y <- pracma::movavg(abbshares, 50, "m"); lines(y, col = 5)
y <- pracma::movavg(abbshares, 50, "e"); lines(y, col = 6)
y <- pracma::movavg(abbshares, 50, "r"); lines(y, col = 7)
grid()
legend(120, 29, c("original data", "simple", "triangular", "weighted",
     "modified", "exponential", "running"),
     col = 1:7, lty = 1, lwd = 1, box.col = "gray", bg = "white")

#x
elecs = read.csv(file='./data/elect.csv')
elecs1 = elecs$Sales
electsales = ts(elecs1, start= 1989)
electsales

forecast::ma(elecsales, order=3)
forecast::ma(elecsales, order=5)
