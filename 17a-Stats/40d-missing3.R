# NA Values

is.finite(10^(305:310))
#[1] TRUE TRUE TRUE TRUE FALSE FALSE

2 / 0
#[1] Inf

4 - Inf
#[1] -Inf

#divide any real number by infinity, you get zero.
#But what if you divide infinity by infinity?
Inf / Inf
#[1] NaN

# Removing bad values - NA, NaN infiite
#NULL, NA, or NaN values.

apply(df, 2, function(x) any(is.na(x)))

#Will test the condition by column.

#In the case that you would like to test for both conditions,
#you can add the pipe operator, |.

any(is.na(x) | is.infinite(x))

#It reads, "Does any member of the variable x have 
#the value NA or -Inf or Inf?"

#if you want to learn the names of the column with these values,
#assign the output of our apply function above to a variable, 
#and subset the column names by that new variable:
  
indx <- apply(df, 2, function(x) any(is.na(x) | is.infinite(x)))
colnames[indx]



# Missing Values Plot
v1 = ceiling(rnorm(100,60,20))
v1[sample(1:40, 10, replace=F)] = NA
v1
x=v1
library(reshape2)
library(ggplot2)
library(dplyr)

ggplot_missing <- function(x){
  x %>% is.na %>% melt %>%  ggplot(data = ., aes(x = X2, y = X1)) +
    geom_raster(aes(fill = value)) + scale_fill_grey(name = "",
    labels = c("Present","Missing")) + theme_minimal() + 
    theme(axis.text.x = element_text(angle=45, vjust=0.5)) + 
    labs(x = "Variables in Dataset",  y = "Rows / observations")
}
#Let’s test it out
ggplot_missing(x)


#Function	    Inf	  –Inf	NaN	  NA
#is.finite()	FALSE	FALSE	FALSE	FALSE
#is.infinite()TRUE	TRUE	FALSE	FALSE
#is.nan()	    FALSE	FALSE	TRUE	FALSE
#is.na()	    FALSE	FALSE	TRUE	TRUE
#R actually considers NaN to be numeric, 
#so you can use NaN in calculations. The outcome of those calculations is always NaN,

NaN + 4
#[1] NaN