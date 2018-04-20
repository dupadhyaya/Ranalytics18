# Financial Statements
#Not working through Google Financee

library(quantmod)
getFin("LNKD")
head(viewFin(LNKD.f, type= 'BS', period = 'Q' ))
fin <- c('GOOGL','AAPL','AMZN','EBAY','CRM','FB','LNKD','ALBIY')
