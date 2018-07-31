# Missing Values with sleep data

library(VIM)
df4 = sleep 
head(df4)
dim(df4)

#row-wise delete missing values in your dataset
na.omit(df4)
na.exclude(df4) 

#will keep an object only if no missing values are present
na.fail(df4)


#na.action= is a common option in many functions, for example in a linear model where you might write model <- lm(y~x, data = data, na.action = na.omit).
lm(BodyWgt ~ NonD + Dream + Sleep, data=df4)
lm(BodyWgt ~ NonD + Dream + Sleep, data=df4, na.action= na.omit)

#logical testing of missing values
is.na(df4)
