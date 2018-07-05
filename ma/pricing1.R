# Pricing Metrics
#https://www.analyticsvidhya.com/blog/2016/07/solving-case-study-optimize-products-price-online-vendor-level-hard/

data = read.csv(file.choose())
str(data)
names(data)
cnames = c('product','avgprice', 'unitcost', 'avgprofit', 'avgunitssold', 'incracq','incsalevol')
names(data) = cnames
summary(data)
dim(data)

library(fdth)
(tb1 = fdt(data$avgprofit))

(tb2 <- fdt(data))

# Histograms
plot(tb) # Absolute frequency histogram
plot(tb, main='My title')



#-----
dim(data)
#250*7
summary(data)
# This is the initial value of the increment vector - all zeros
increment <- array(0,250)
head(increment)
flag = 0
increment_i <- increment
#flag = 1 is a condition when the increment vector remains the same
while (flag == 0) {
  print(find_rev(increment_i))
  increment_iplus1 <- incremental_new(increment_i)
  if (min(increment_iplus1 == increment_i) == 1) {flag = 1}
  increment_i <- increment_iplus1
}
increment_i
find_rev(increment_i)
find_rev(increment)
price <- increment_i
write.csv(price,"price.csv")

#This function tries to get the next best increment vector
incremental_new <- function(initial_increments){
  initial_rev <- find_rev(initial_increments)
  intermediate_rev <- 0
  for(i in 1:250){
    increments <- initial_increments
    if(increments[i] > -0.099) {increments[i] <- increments[i] - 0.01}
    rev <- find_rev(increments)
    if (rev > initial_rev) {final_increments <- increments
    intermediate_rev <- rev
    }
    if(increments[i] < 0.19) {increments[i] <- initial_increments[i] + 0.01}
    rev <- find_rev(increments)
    if (rev > max(initial_rev,intermediate_rev)) {final_increments <- increments}
  }
  return(final_increments)
}
# This function will get us the overall revenue for the given increment vector
find_rev <- function(increment){
  price <- data$Avg_Price_per_unit*(1+increment)
  volumes <- data$Average_units_sold*(1-(data$Increase_sale_volume*increment*10))
  multiplier <- (1-(data$Incremental_acquisition*increment*10))
  total_multiplier <- prod(multiplier)
  profit_wo_multiplier <- 0.05*(sum(price*volumes) - sum(volumes*data$Cost_per_unit))
  profit_w_multiplier <- profit_wo_multiplier*total_multiplier
  net_profit <- sum(profit_w_multiplier)
  return(net_profit)}
