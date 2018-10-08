
?pastecs::stat.desc(mtcars)
?fivenum
library(DescTools)
data("iris")
Desc(iris, plotit = T)

tabplot::tableplot(iris, sortCol=Species)
tabplot::tableplot(mtcars, sortCol=am)


f_summary <- function(data_to_plot)
{
  ## univariate data summary
  require(nortest)
  #data <- as.numeric(scan ("data.txt")) #commenting out by mike
  data <- na.omit(as.numeric(as.character(data_to_plot))) #added by mike
  dataFull <- as.numeric(as.character(data_to_plot))
  
  # first job is to save the graphics parameters currently used
  def.par <- par(no.readonly = TRUE)
  par("plt" = c(.2,.95,.2,.8))
  layout( matrix(c(1,1,2,2,1,1,2,2,4,5,8,8,6,7,9,10,3,3,9,10), 5, 4, byrow = TRUE))
  
  #histogram on the top left
  h <- hist(data, breaks = "Sturges", plot = FALSE)
  xfit<-seq(min(data),max(data),length=100)
  yfit<-yfit<-dnorm(xfit,mean=mean(data),sd=sd(data))
  yfit <- yfit*diff(h$mids[1:2])*length(data)
  plot (h, axes = TRUE, main = paste(deparse(substitute(data_to_plot))), cex.main=2, xlab=NA)
  lines(xfit, yfit, col="blue", lwd=2)
  leg1 <- paste("mean = ", round(mean(data), digits = 4))
  leg2 <- paste("sd = ", round(sd(data),digits = 4))
  count <- paste("count = ", sum(!is.na(dataFull)))
  missing <- paste("missing = ", sum(is.na(dataFull)))
  legend(x = "topright", c(leg1,leg2,count,missing), bty = "n")
  
  ## normal qq plot
  qqnorm(data, bty = "n", pch = 20)
  qqline(data)
  p <- ad.test(data)
  leg <- paste("Anderson-Darling p = ", round(as.numeric(p[2]), digits = 4))
  legend(x = "topleft", leg, bty = "n")
  
  ## boxplot (bottom left)
  boxplot(data, horizontal = TRUE)
  leg1 <- paste("median = ", round(median(data), digits = 4))
  lq <- quantile(data, 0.25)
  leg2 <- paste("25th percentile =  ", round(lq,digits = 4))
  uq <- quantile(data, 0.75)
  leg3 <- paste("75th percentile = ", round(uq,digits = 4))
  legend(x = "top", leg1, bty = "n")
  legend(x = "bottom", paste(leg2, leg3, sep = "; "), bty = "n")
  
  ## the various histograms with different bins
  h2 <- hist(data,  breaks = (0:20 * (max(data) - min (data))/20)+min(data), plot = FALSE)
  plot (h2, axes = TRUE, main = "20 bins")
  
  h3 <- hist(data,  breaks = (0:10 * (max(data) - min (data))/10)+min(data), plot = FALSE)
  plot (h3, axes = TRUE, main = "10 bins")
  
  h4 <- hist(data,  breaks = (0:8 * (max(data) - min (data))/8)+min(data), plot = FALSE)
  plot (h4, axes = TRUE, main = "8 bins")
  
  h5 <- hist(data,  breaks = (0:6 * (max(data) - min (data))/6)+min(data), plot = FALSE)
  plot (h5, axes = TRUE,main = "6 bins")
  
  ## the time series, ACF and PACF
  plot (data, main = "Time series", pch = 20, ylab = paste(deparse(substitute(data_to_plot))))
  acf(data, lag.max = 20)
  pacf(data, lag.max = 20)
  
  ## reset the graphics display to default
  par(def.par)
  
  #original code for f_summary by respiratoryclub
  
}

f_summary(mtcars$mpg)

library(PerformanceAnalytics)
chart.Correlation(iris[,1:4],col=iris$Species)

library(Hmisc)

