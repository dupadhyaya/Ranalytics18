#Johnson Case - TS
#time series analysis
#plot, decompose, forecast, 
JohnsonJohnson

monthplot(JohnsonJohnson)
quarters.Date(Sys.Date())

stl_jj = stl(JohnsonJohnson, s.window = 'periodic')
plot(stl_jj)
plot(JohnsonJohnson)
monthplot(stl_jj, choice='seasonal')
monthplot(stl_jj, choice='trend')
monthplot(stl_jj, choice='remainder')

library(forecast)
ets_jj = ets(JohnsonJohnson, model = "MAM")
forecast(ets_jj,h=3)
plot(forecast(ets_jj,h=3))
