# Summary ----------


set.seed(1234)
x = ceiling(rnorm(100, 50, 10))  # 100 random nos mean-50, Sd-10
x

summary(x)

# Five Number Summary ---------
#lies in the lack of universal agreement on how the 1st and 3rd quartiles should be calculated.
#https://www.r-bloggers.com/exploratory-data-analysis-the-5-number-summary-two-different-methods-in-r/
  
fivenum(x)

x = seq(1, 9, by = 2)
x # Odd Nos
fivenum(x)
summary(x)  # same output

y = seq(1, 11, by = 2)
y  # Even Nos
fivenum(y)  # no control for digits
summary(y)  #Different for 1Q, 3Q
summary(x, digit=2)
y
(Q1 = y[1] + (length(y) - 1 ) * .25)
# This position is not a integer, so cannot extract it

#*fivenum() does not have an argument for controlling the number of decimal places in its output, while summary() has the “digits” option for doing so.  You may need to invoke this option in summary() to get more decimal places to when comparing its output with fivenum()’s output.

?fivenum
fivenum(c(rnorm(100), -1:1/0))
