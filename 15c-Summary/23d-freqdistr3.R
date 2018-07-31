#Frequency Distribution 3

marks = ceiling(runif(100,0,150))  # 0 to 150 marks
#Package----
library(fdth)
#https://cran.r-project.org/web/packages/fdth/fdth.pdf
(tb = fdt(marks))
# Histograms
plot(tb) # Absolute frequency histogram
plot(tb, main='My title')
plot(tb, x.round=3, col='darkgreen')
plot(tb, xlas=2)
plot(tb, x.round=3, xlas=2, xlab=NULL)
plot(tb, v=TRUE, cex=.8,x.round=3,xlas=2, xlab=NULL,  col=rainbow(11))
plot(tb, type='fh') # Absolute frequency histogram
plot(tb, type='rfh') # Relative frequency histogram
plot(tb, type='rfph') # Relative frequency (%) histogram
plot(tb, type='cdh') # Cumulative density histogram
plot(tb, type='cfh') # Cumulative frequency histogram
plot(tb,  type='cfph') # Cumulative frequency (%) histogram
# Polygons
plot(tb, type='fp') # Absolute frequency polygon
plot(tb, type='rfp') # Relative frequency polygon
plot(tb, type='rfpp') # Relative frequency (%) polygon
plot(tb, type='cdp') # Cumulative density polygon
plot(tb, type='cfp') # Cumulative frequency polygon
plot(tb, type='cfpp') # Cumulative frequency (%) polygon

# Density
plot(tb, type='d') # Density
# Summary
tb
summary(tb) # the same
print(tb) # the same
show(tb) # the same

summary(tb, format=TRUE) # It can not be what you want to publications!
summary(tb,  format=TRUE,
        pattern='%.2f') # Huumm ..., good, but ... Can it be better?
summary(tb,  col=c(1:2, 4, 6),format=TRUE,  pattern='%.2f') # Yes, it can!

x=marks
range(x) # To know x
summary(fdt(x,  start=1, end=9,  h=1),col=c(1:2, 4, 6),    format=TRUE,   pattern='%d') # Is it nice now?

# The fdt.object
tb[['table']] # Stores the feq. dist. table (fdt)
tb[['breaks']] # Stores the breaks of fdt
tb[['breaks']]['start'] # Stores the left value of the first class
tb[['breaks']]['end'] # Stores the right value of the last class
tb[['breaks']]['h'] # Stores the class interval
as.logical(tb[['breaks']]['right']) # Stores the right option

# Theoretical curve and fdt
y <- rnorm(1e5,  mean=5, sd=1)
tb <- fdt(y,  k=100)
plot(tb, type='d', # density
     col=heat.colors(100))
curve(dnorm(x,mean=5, sd=1),n=1e3, add=TRUE, lwd=4)



#
#