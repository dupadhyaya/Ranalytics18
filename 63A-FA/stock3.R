# Getting stock Details

library(quantmod)

mdate = '2017-01-01'
amzPrices.y = getSymbols('AMZN', from=mdate, auto.assign = 0)
amzPrices.y

amzRets = ROC(amzPrices.y, type='discrete')
amzRets

amzRets2 = periodReturn(amzPrices.y, period='monthly', type='log', subset='2018')
amzRets2
amzPrices.g = getSymbols.google('AMZN', from=mdate, auto.assign = 0)
amzPrices.g

#----
getSymbols('SBIN.NS', src='yahoo', from=mdate)
SBIN.NS
getSymbols('SBIN', src='google', from=mdate)
SBIN.NS

x <- getSymbols('^GSPC', auto.assign = F)
x
from <- c("USD", "USD", "EUR", "GBP", "EUR", "EUR")
to <- c("CAD", "JPY", "USD", "CAD", "JPY", "AUD")
df <- getQuote(paste0(from, to, "=X"))
df

getSymbols(Symbols = "LIQUIDBEES", src = "google") 
getSymbols.google(Symbols = "LIQUIDBEES")

#-----
from       <- "2016-04-01"
to         <- Sys.Date()
period     <- "daily"
envir      <- globalenv()
crumb      <- "yourCrumb"
DLdir      <- "~/shares/"
assetList  <- c("AAPL", "ADBE", "AMAT")
lapply(assetList, getSymbols.yahoo, from, to, envir = globalenv(), crumb = crumb, DLdir)
