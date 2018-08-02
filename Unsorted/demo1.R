# Demos
# http://r-pkgs.had.co.nz/demo.html

#Show all available demos: demo()
demo()

library(graphics)
demo()

library(base)
demo()

library(grDevices)
demo()

library(stats)
demo()

demo(package = .packages(all.available = TRUE))

#Show all demos in a package: demo(package = "httr")

demo(package = "httr")

#Run a specific demo: demo("oauth1-twitter", package = "httr").
demo("oauth1-twitter", package = "httr")

#Find a demo: system.file("demo", "oauth1-twitter.R", package = "httr")
system.file("demo", "oauth1-twitter.R", package = "httr").

#https://cran.r-project.org/web/packages/TeachingDemos/TeachingDemos.pdf
library(TeachingDemos)
ci.examp()
plot.dice( expand.grid(1:6,1:6), layout=c(6,6) )


cal(2011)
