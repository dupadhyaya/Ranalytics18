#Computational Finance
#http://computationalfinance.lsi.upc.edu/?page_id=104

##Technical analysis with quantmod
library(quantmod)
##Chart a stock with MA(50), Bollinger, Volume and RSI
getSymbols("AAPL")
chartSeries(AAPL, subset='2008-06::2009-04',theme=chartTheme('white',up.col='green',dn.col='red'),TA=c(addBBands(n=20,sd=2,),addSMA(n=50,col="blue"),addSMA(n=10,col="black"),addRSI(n=14)))
#up.col, dn.col= color of up (down) candle,
#
library(quantmod)
##getFinancials retrives financials from src (default google)
##returns six individual matrices organized in a list of class ‘financials’:
# IS a list containing (Q)uarterly and (A)nnual Income Statements
# BS a list containing (Q)uarterly and (A)nnual Balance Sheets
# CF a list containing (Q)uarterly and (A)nnual Cash Flow Statements
getFinancials('AAPL',src="yahoo")  #returns AAPL.f to "env"
viewFin(AAPL.f, "CF", "A") #view Annual Cash Flows 
#above code NW
viewFin(AAPL.f, "BS", "A", "2010/2011")

applBS = viewFin(AAPL.f, "BS","A")
colnames(applBS) ##give four columns labeled by the date (yyyy-mm-dd) the statement was issued
rownames(applBS) ##give 42 rows labelled with financial indicators

applBS["Total Current Assets","2012-09-29"] ##returns the value of Total Current Assets in that year

##Compute some liquidity measures:
CurrentRat=applBS["Total Current Assets","2012-09-29"]/applBS["Total Current Liabilities","2012-09-29"]
CurrentRat