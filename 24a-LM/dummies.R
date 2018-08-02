
library(dummies)

# example data
df1 <- data.frame(id = 1:4, year = 1991:1994)

df1 <- cbind(df1, dummy(df1$year, sep = "_"))

df1



library(mlr)
df <- data.frame(var = sample(c("A", "B", "C"), 10, replace = TRUE))
df
createDummyFeatures(df, cols = "var")

year=sample(c(1957,1958,1959,1960),size=10,replace=T, prob=c(.4,.2,.2,.2))
(data = data.frame(year))
                  
                
data$factor_year_1 <- factor ( with ( data, ifelse ( ( year == 1957 ), 1 , 0 ) ) )
data

ifelse(year == 1957, 1, 0)

