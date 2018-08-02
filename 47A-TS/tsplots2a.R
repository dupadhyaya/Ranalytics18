# Plot 2 TS together
graphics.off()
plot(AirPassengers)
plot(guinearice)
ts.plot(..., gpars = list())
set.seed(1)
x = ts(rnorm(20), frequency = 4, start = c(1959, 2))
y = ts(rnorm(20), frequency = 4, start = c(1959, 2))
ts.plot(x, y, gpars = list(col = c("black", "red")))


#Eg2
set.seed(1)
xz = zoo(ts(rnorm(20), frequency = 4, start = c(1959, 2)))
yz = zoo(ts(rnorm(20), frequency = 4, start = c(1959, 2)))
# Basic approach
plot(xz)
lines(yz, col = "red")
# Panels
plot.zoo(cbind(xz, yz))
# Overplotted
plot.zoo(cbind(xz, yz),
         plot.type = "single", col = c("red", "blue"))


#GGPLOT
library(ggplot2)

dta <- data.frame(year = 2012,
                  month = rep(seq(1,9),each=10),
                  day = sample(seq(1,20),90,replace=T),
                  Group = sample(c('A','B'),90,replace=T),
                  Value = seq(1,90)
)

dta$Date <- apply(dta[,c('year','month','day')],1,paste,sep='',collapse='-')
dta$Date <- as.Date(dta$Date)

qplot(Date,Value,data=dta,geom='line',color=Group)



#Eg4
temp<- rnorm(365, 5, 10)
mort<- rnorm(365, 300, 45)
poll<- rpois(365,  lambda=76)
date<-seq(as.Date('2011-01-01'),as.Date('2011-12-31'),by = 1)
df<-data.frame(date,mort,poll,temp)
df
library(ggplot2)
library(reshape2)

df_melt = reshape2::melt(df, id.vars = 'date')
ggplot(df_melt, aes(x = date, y = value)) + 
  geom_line() + 
  facet_wrap(~ variable, scales = 'free_y', ncol = 1)

ggplot(df_melt, aes(x = date, y = value)) + 
  geom_line() + 
  facet_wrap(~ variable, nrow=1, scales = 'free_y')


df = within(df, {
  temp[61:90] = temp[61:90] + runif(30, 30, 50)
  mort[61:90] = mort[61:90] + runif(30, 300, 500)
})
df_melt = reshape2::melt(df, id.vars = 'date')
ggplot(df_melt, aes(x = date, y = value)) + 
  geom_line() + 
  facet_wrap(~ variable, scales = 'free_y', ncol = 1)



#Eg5
library(zoo)
z <- read.zoo(df)
# classic graphics in separate and single plots
plot(z)
plot(z, screen = 1)
# lattice graphics in separate and single plots
library(lattice)
xyplot(z)
xyplot(z, screen = 1)
# ggplot2 graphics in separate and single plots
library(ggplot2)
autoplot(z) + facet_free()
autoplot(z, facet = NULL)

# Eg6
tseries::seqplot.ts(AirPassengers, guinearice)
data(USeconomic)
x <- ts.union(log(M1), log(GNP), rs, rl)
head(x)
m.ar <- ar(x, method = "ols", order.max = 5)
y <- predict(m.ar, x, n.ahead = 200, se.fit = FALSE)
seqplot.ts(x, y)

#Eg7
components_airp <- decompose(AirPassengers)
components_airp
plot(components_airp)
ts.plot(components_airp$seasonal,y=NULL,
        gpars = list(col = c("red", "blue"), ylab = "Seasonality",
                     main = "Seasonality in Search Term Popularity"))
