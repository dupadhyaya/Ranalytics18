# Data Sets
#https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/00Index.html

#built in datasets in base
mtcars
women
data()  # available Data Sets with loaded libraries

#package having datasets
library(datasets) # no need to install it, just load
data(package='datasets')

#Datasets in particular Package
data(package = "plyr")
data(package ="MASS")


#find the names of data sets in all installed packages, you can use the following. .packages(TRUE) gives all packages available in the library location path lib.loc. Since the data sets in the base and stats packages have been moved to the datasets package, we need to account for that by taking them out with setdiff().


## names of all packages sans base and stats
pkgs <- setdiff(.packages(TRUE), c("base", "stats"))
pkgs

## get the names of all the data sets
dsets <- data(package = pkgs)$result[, "Item"]
## look at the first few in our result
head(dsets)


#data frame containing the name, class, dimensions, and title of each data set found in a package.
vcdExtra::datasets("plyr")
vcdExtra::datasets(c("plyr", "dplyr"))
vcdExtra::datasets("datasets")


