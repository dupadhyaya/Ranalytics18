# Interactive Plots
load('./data/badata.Rdata')

head(df1)
plot(x=df1$adtv, y=df1$sales)
identify(x=df1$adtv, y=df1$sales, labels=row.names(df1))
#click on the points and finish
coords = locator(type='l')
coords



#gobi
library(rggobi)
