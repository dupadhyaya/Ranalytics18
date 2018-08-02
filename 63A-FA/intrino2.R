

#rm(list=ls(())
#install.packages("httr")
require("httr")






username <- "62125b9aa13fe147cd0f3477be69d602"
password <- "b00a3fc5c70b0a5c20a0049b298adfc9"
base <- "https://api.intrinio.com/"
endpoint <- "data_point"
stock <- "AAPL"
item1 <- "close_price"
item2 <- "pricetoearnings"
call1 <- paste(base,endpoint,"?","ticker","=", stock, "&","item","=",item1, sep="")
call2 <- paste(base,endpoint,"?","ticker","=", stock, "&","item","=",item2, sep="")


apple_price <- get(call1, authenticate(username,password, type = "basic"))
apple_pricetoearnings <- get(call2, authenticate(username,password, type = "basic"))

test1 <- unlist(content(apple_price,"parsed"))
test2 <- unlist(content(apple_pricetoearnings,"parsed"))

df <- data.frame(test1,test2)






#1----2
prices <- function(ticker){
  price_base <- "https://api.intrinio.com/prices?identifier=" 
  uusername <- "62125b9aa13fe147cd0f3477be69d602"
  password <- "b00a3fc5c70b0a5c20a0049b298adfc9"
  
  price <- paste(price_base,ticker,sep="") 
  tp <- GET(price, authenticate(username, password, type = "basic")) 
  z <- unlist(content(tp,"parsed"))
  
  n=length(z)
  b=as.data.frame(matrix(z[1:(n-5)],(n-5)/13, byrow = T))
  names(b)=names(z)[1:13]
  
  return(b)
}

#If you call the function, creating an object, and using your own API keys for the "username" and "password" objects within the function, you will have your data frame:
  
t <- prices("AAPL")
t
#The really nice part about this function is that you can now create data frames quickly by swapping out AAPL for any tickers you are interested in analyzing. Graphing prices becomes very easy, but my goal is quant modeling.

#For that, I need financial metrics that I expect to be correlated with price. This second function returns daily historical data over the period of your choice for the metric of your choice.

history <- function(ticker, item, start_date, end_date){
  history_base <- "https://api.intrinio.com/historical_data?ticker=" 
  username <- "a543b029ec930ab0c7add95bfa1ea3ac" 
  password <- "991d8ca925d74ecfbe7f78b4784d88b0"
  historical <- paste(history_base, ticker, "&item=", item, "&start_date=", start_date, "&end_date=", end_date, sep="") 
  tp <- GET(historical, authenticate(username, password, type = "basic")) 
  z <- unlist(content(tp,"parsed"))
  n=length(z)
  b=as.data.frame(matrix(z[1:(n-5)],(n-5)/2, byrow = T))
  names(b)=names(z)[1:2]
  return(b)
}

#This time, the function needs a couple of inputs because we are looking at a certain period for a specific financial metric. You could, for example, call the function with these inputs to get the daily market cap for AAPL ranging from October 1, 2016 back to January 1, 2010.

app_hist <- history("AAPL","marketcap", "2010-01-01","2016-10-01")
