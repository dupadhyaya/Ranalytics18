# K neigbour
library(kknn)  #Weighted k-Nearest Neighbors
kknn(formula = formula(train), train, test, na.action = na.omit(),
     k = 7, distance = 2, kernel = "optimal", ykernel = NULL, scale=TRUE,
     contrasts = c('unordered' = "contr.dummy", ordered = "contr.ordinal"))
kknn.dist(learn, valid, k = 10, distance = 2)

#https://cran.r-project.org/web/packages/kknn/kknn.pdf
data(glass)
str(glass)
#A data frame with 214 observations, where the problem is to predict the type of glass in terms of
#their oxide content (i.e. Na, Fe, K, etc). The study of classification of types of glass was motivated
#by criminological investigation. At the scene of the crime, the glass left can be used as evidence...
#if it is correctly identified!

data("ionosphere")
str(ionosphere)
# This radar data was collected by a system in Goose Bay, Labrador. This system consists of a phased
# array of 16 high-frequency antennas with a total transmitted power on the order of 6.4 kilowatts.
# See the paper for more details. The targets were free electrons in the ionosphere. "Good" radar
# returns are those showing evidence of some type of structure in the ionosphere. "Bad" returns are
# those that do not; their signals pass through the ionosphere.
# Received signals were processed using an autocorrelation function whose arguments are the time of
# a pulse and the pulse number. There were 17 pulse numbers for the Goose Bay system. Instances in
# this database are described by 2 attributes per pulse number, corresponding to the complex values
# returned by the function resulting from the complex electromagnetic signal.
# A data frame with 351 observations on the following 35 variables. The first 34 continuous covariables
# are used for the prediction. The 35th attribute is either g ("good") or b ("bad") according to
# the definition summarized above. This is a binary classification task.

data(miete)
str(miete)

# Spectral Clustering
specClust(data=miete, centers=NULL, nn = 7, method = "symmetric", gmax=NULL, ...)
## S3 method for class 'specClust'
plot(x, ...)
