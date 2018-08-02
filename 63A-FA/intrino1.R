
library(quantmod)
getFinancials('GE')
viewFinancials(GE.f)
To get only the income statement, reported anually, as a data frame use this:
  
viewFinancials(GE.f, "IS", "A")


#Create variables for your usename and password, get those at intrinio.com/login
username <- "62125b9aa13fe147cd0f3477be69d602"
password <- "b00a3fc5c70b0a5c20a0049b298adfc9"

#Making an api call for roic. This puts together the different parts of the API call

base <- "https://api.intrinio.com/"
endpoint <- "financials/"
type <- "standardized"
stock <- "YUM"
statement <- "income_statement"
fiscal_period <- "Q2"
fiscal_year <- "2015"

#Pasting them together to make the API call
call1 <- paste(base,endpoint,type,"?","identifier","=", stock, "&","statement","=",statement,"&","fiscal_period",
               "=", fiscal_period, "&", "fiscal_year", "=", fiscal_year, sep="")

# call1 Looks like this "https://api.intrinio.com/financials/standardized?identifier=YUM&statement=income_statement&fiscal_period=Q2&fiscal_year=2015"

#Now we use the API call to request the data from Intrinio's database

YUM_Income <- GET(call1, authenticate(username,password, type = "basic"))

#That gives us the ROIC value, but it isn't in a good format so we parse it

test1 <- unlist(content(YUM_Income, "text"))

#Convert from JSON to flattened list

parsed_statement <- fromJSON(test1)

#Then make your data frame:

df1 <- data.frame(parsed_statement)

