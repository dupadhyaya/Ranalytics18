#Finance
#https://msperlin.github.io/pafdR/Financial-data.html#data-from-financial-markets

# set project cashflow
CF <- c(-8000, 2500, 3000, 3000, 5000)
names(CF) <- paste('Year', 0:(length(CF)-1))

# print result
print(CF)

#first element is negative. This means that, at time zero, cash will be spent. Now, we can use package FinCalc (Fan 2016) to evaluate the project using NPV and IRR.


library(FinCal)

# set discount rate
r <- 0.1

# calculate npv
my.NPV <- npv(r = r, cf = CF)
my.NPV

# calculate irr
my.IRR <- irr(cf = CF)
my.IRR

# calculate payback
my.payback <- min(which(cumsum(CF) > 0)) - 1
my.payback

# print results
cat('NPV = ', my.NPV )
## NPV =  2421.078
cat('IRR = ', my.IRR)
## IRR =  0.2183874
cat('Payback = ', my.payback, 'years')
## Payback =  3 years

#The initial investment is paid back in 3 years. From the financial side, this fictional project creates value and should be accepted.




#2----

#set seed for reproducibility
set.seed(10)

# set number of time periods
nT <- 5

# simulate prices
P.1 <- 10*(cumprod(1+rnorm(nT,mean = 0, sd = 0.1)))
P.2 <- 20*(cumprod(1+rnorm(nT,mean = 0, sd = 0.1)))
P.3 <- 30*(cumprod(1+rnorm(nT,mean = 0, sd = 0.1)))
P.1; P.2; P.3
# gather info in df
my.df <- data.frame(ref.date = Sys.Date()+1:nT,  prices = c(P.1,P.2,P.3),
ticker = paste('Stock ',c(rep('A',nT),rep('B',nT),rep('C',nT))))

# print result  
print(my.df)

# set price matrix
my.price.mat <- matrix(my.df$prices, nrow = nT)
my.price.mat

# set row and col names
colnames(my.price.mat) <- unique(my.df$ticker)
rownames(my.price.mat) <- as.character(unique(my.df$ref.date))

# print result
print(my.price.mat)

9.12/10.08-1; 8.94/9.12 -1
# apply return formula for each column
my.ret.mat <- my.price.mat[2: nrow(my.price.mat)   , ]/
  my.price.mat[1:(nrow(my.price.mat)-1), ] -1 
my.ret.mat


# set weight of portfolio (evenly weighted)
w <- matrix(rep(1/3,3), nrow = 3)
w
# calculate return of portfolio over time
ret.port <- my.ret.mat %*% w
ret.port
# print result
print(ret.port)

#Vector ret.port show the return an investor would receive if the total value of the portfolio is evenly divided between the stocks.