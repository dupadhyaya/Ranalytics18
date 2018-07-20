#Mosaic Plots
#For extended mosaic plots, use mosaic(x, condvar=, data=) where x is a table or formula, condvar= is an optional conditioning variable, and data= specifies a data frame or a table. Include shade=TRUE to color the figure, and legend=TRUE to display a legend for the Pearson residuals.

# Mosaic Plot  ----------
library(vcd)
mosaic(HairEyeColor, shade=TRUE, legend=TRUE)


#Association Plots -------------
#To produce an extended association plot use assoc(x, row_vars, col_vars)
#where x is a contingency table, row_vars is a vector of integers 
#giving the indices of the variables to be used for the rows, and 
#col_vars is a vector of integers giving the indices of the variables
#to be used for the columns of the association plot.

# Association Plot Example
library(vcd)
assoc(HairEyeColor, shade=TRUE)
