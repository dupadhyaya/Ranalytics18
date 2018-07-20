
library(highfrequency)
#load sample price data
data("sample_tdata");
head(sample_tdata)
ts = sample_tdata$PRICE;

#Previous tick aggregation to the 5-minute sampling frequency:
tsagg5min = aggregatets(ts,on="minutes",k=5);
head(tsagg5min);

#Previous tick aggregation to the 30-second sampling frequency:
tsagg30sec = aggregatets(ts,on="seconds",k=30);
tail(tsagg30sec);
