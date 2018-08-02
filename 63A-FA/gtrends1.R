# Google Trends
# https://datascienceplus.com/analyzing-google-trends-data-in-r/
# 
library(gtrendsR)
library(reshape2)

google.trends = gtrends(c("pnb"), gprop = "web", time = "all")[[1]]
google.trends
google.trends = dcast(google.trends, date ~ keyword + geo, value.var = "hits")
rownames(google.trends) = google.trends$date
google.trends$date = NULL

Sys.setenv(TZ = "GMT")

google.trends = gtrends(c("skiing"), geo = c("CA", "NZ"), gprop = "web", time = "2010-06-30 2017-06-30")[[1]]
google.trends

library(gtrendsR)
geo.codes = sort(unique(countries[substr(countries$sub_code, 1, 2) == "IT", ]$sub_code))
geo.codes
