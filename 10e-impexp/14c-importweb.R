# read from Internet 

#read.csv(url("http://some.where.net/data/foo.csv"))
#url is optional

df2 = read.csv('http://www.stats.ox.ac.uk/pub/datasets/csb/ch11b.dat')
df2

read.csv(url("http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv"))

df3= read.csv("http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv")
df3


#using library
library(data.table)
ad <- fread("http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv")
head(ad)


#library(readr)


#Using Curl package
library(RCurl)
