# TS Case3


library(astsa)             # then load it (has to be done at the start of each session)
data()              # use this command to view all the loaded data 
?astsa
#Johnson & Johnson data set. It's included in astsa as jj
jj

# data properties
jj[1]       # the first element
#[1] 0.71
jj[84]      # the last element
#[1] 11.61
jj[1:4]     # the first 4 elements
#[1] 0.71 0.63 0.85 0.44
jj[-(1:80)] # everything EXCEPT the first 80 elements
#[1] 16.20 14.67 16.02 11.61
length(jj)  # the number of elements 
#[1] 84
dim(jj)     # but no dimensions ...
#NULL
nrow(jj)    # ... no rows
#NULL
ncol(jj)    # ... and no columns
#NULL
#-- if you want it to be a column vector (in R, a matrix), an easy way to go is:
jjm = as.matrix(jj)
matrix(jjm, ncol=6)
dim(jjm)   
#[1] 84  1 
jjm


#monthly model
options(digits=2)  # the default is 7, but it's more than I want now
?options           # to see your options (it's the help file)
?rnorm             # we're using it on the next line
(zardoz = ts(rnorm(48), start=c(2018,6), frequency=12))  #start from Jun 2018
(oz = window(zardoz, start=c(2018,10), end=c(2019,10)))
(oz = window(zardoz, start=2019, end=c(2019,10)))
time(jj)
time(oz)
time(zardoz)

cycle(oz)
cycle(zardoz) #position of cycle in each obsvn
?cycle

#plot
plot(jj, ylab="Earnings per Share", main="J & J")
plot(jj, type="o", col="blue", lty="dashed")
plot(diff(log(jj)), main="logged and diffed") 


x = -5:5                  # sequence of integers from -5 to 5
y = 5*cos(x)              # guess
par(mfrow=c(3,2))         # multifigure setup: 3 rows, 2 cols
#---  plot:
plot(x, main="plot(x)")
plot(x, y, main="plot(x,y)")
#---  plot.ts:
plot.ts(x, main="plot.ts(x)")
plot.ts(x, y, main="plot.ts(x,y)")
#---  ts.plot:
ts.plot(x, main="ts.plot(x)")
ts.plot(ts(x), ts(y), col=1:2, main="ts.plot(x,y)")  # note- x and y are ts objects 
#---  the help files [? and help() are the same]:
?plot.ts
help(ts.plot)
?par        # might as well skim the graphical parameters help file while you're here


par(mfrow=c(1,1))
k = c(.5,1,1,1,.5)            # k is the vector of weights
(k = k/sum(k))       
#[1] 0.125 0.250 0.250 0.250 0.125
fjj = stats::filter(jj, sides=2, k)  # ?filter for help [but you knew that already]
plot(jj)
lines(fjj, col="red")         # adds a line to the existing plot
lines(lowess(jj), col="blue", lty="dashed")

#... and the result:


dljj = diff(log(jj))        # difference the logged data
plot(dljj)                  # plot it (not shown)

shapiro.test(dljj)          # test for normality 
#Shapiro-Wilk normality test
#data:  dljj 
#W = 0.9725, p-value = 0.07211

#sanity.clause(dljj)         # test for sanity
#dljj is crazy  
#SC = 45.57, p-value = 0.0003    

# I couldn't fool you - there ain't no sanity clause  



par(mfrow=c(2,1))        # set up the graphics 
hist(dljj, prob=TRUE, 12)   # histogram    
lines(density(dljj))     # smooth it - ?density for details 
qqnorm(dljj)             # normal Q-Q plot  
qqline(dljj)             # add a line    

lag1.plot(dljj, 4)  # this is the astsa version of lag.plot in the stats package 

acf2(dljj)   # astsa gives both in one swell foop ... or use acf() and pacf() individually 

plot(dog <- stl(log(jj), "per"))   
