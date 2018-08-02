# rattle
library(rattle)
#data(weather) 
#http://rattle.togaware.com/weatherAUS.csv
#
rattle()
#http://archive.ics.uci.edu/ml/datasets/Heart+Disease
#https://eric.univ-lyon2.fr/~ricco/tanagra/fichiers/heart_for_rattle.txt
#above data link
heart = read.table('./data/heart_for_rattle.txt', header=T)
summary(heart)


fname <- "file:///E:/rWork/rDataSets/nyc.csv" 
crs$dataset <- read.csv(fname,
                        na.strings=c(".", "NA", "", "?"),
                        strip.white=TRUE, encoding="UTF-8")
str(crs$dataset)
crs$dataset$X
crs$y = data.frame(a=1:10, b=10:19)
crs$y
rattle(system.file("csv", "weather.csv", package = "rattle"))
eapply(crs,FUN=summary)


# Using Rattle
#  Generate the table data for plotting.
ds <- table(crs$dataset[crs$sample,]$sex, crs$dataset[crs$sample,]$disease)

# Sort the entries.
ord <- order(apply(ds, 1, sum), decreasing=TRUE)

mosaicplot(ds[ord,], main="Mosaic of sex (sample)
by disease", sub="Rattle 2017-Oct-16 06:51:21 dupad", color=colorspace::rainbow_hcl(3)[-1], cex=0.7, xlab="sex", ylab="disease")
