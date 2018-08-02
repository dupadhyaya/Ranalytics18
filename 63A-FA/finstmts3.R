# Financial Statements


library(quantmod)
chooseCRANmirror(0)
getFin("LNKD")
getFin("SBIN.NS")

head(viewFin(LNKD.f, type= 'BS', period = 'Q' ))
fin <- c('GOOGL','AAPL','AMZN','EBAY','CRM','FB','LNKD','ALBIY')

getFin_HANDLED <- function (symb) {
  return(tryCatch(getFin(symb, auto.assign = "FALSE"), error=function(e) NULL)) 
}

fin.f <- lapply(fin, getFin_HANDLED) 
head(fin.f)


myData <- new.env()
class(myData)
ls(myData)
NVS <- getFinancials('NVS',  env = myData, src = "yahoo", auto.assign=TRUE)
getFinancials('APPL', env = .GlobalEnv, src = "yahoo", 
              auto.assign = TRUE)


viewFinancials(x, type=c('BS','IS','CF'), period=c('A','Q'),
               subset = NULL)

JAVA <- getFinancials('JAVA')
AAPL <- getFin('AAPL')

JAVA$IS$Q   # Quarterly Income Statement
AAPL$CF$A   # Annual Cash Flows

str(AAPL)