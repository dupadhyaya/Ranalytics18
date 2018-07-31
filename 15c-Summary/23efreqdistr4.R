# FD with DF
library(fdth)

mdf <- data.frame(X1=rep(LETTERS[1:4], 25), X2=as.factor(rep(1:10, 10)),Y1=c(NA, NA, rnorm(96, 10, 1), NA, NA), Y2=rnorm(100, 60, 4), Y3=rnorm(100, 50, 4), Y4=rnorm(100, 40, 4))
mdf
(tb <- fdt(mdf))
# Histograms
plot(tb, v=TRUE)
plot(tb, col=rainbow(8))
plot(tb, type='fh')
dev.off()
par(mar=c(1,1,1,1))
#graphics.off()
plot(tb, type='rfh')
plot(tb,type='rfph')
plot(tb,
     type='cdh')
plot(tb,
     type='cfh')
plot(tb,
     type='cfph')
# Poligons
plot(tb,
     v=TRUE,
     type='fp')
plot(tb,
     type='rfp')
plot(tb,
     type='rfpp')
plot(tb,
     type='cdp')
plot(tb,
     type='cfp')
plot(tb,
     type='cfpp')
