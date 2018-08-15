#install packages from Git Hub

#lubripack
install.packages('lubripack')  #NA for some versions
#install older version of R packages
#https://support.rstudio.com/hc/en-us/articles/219949047-Installing-older-versions-of-packages
#https://rdrr.io/github/Espanta/lubripack/

install.packages('devtools')  #install library for download from git

require(devtools) #small diff from library
#does not give error if package not avl

install_github("Espanta/lubripack")

#this package installes multiple pacakges
library(lubripack)
lubripack("plyr", "psych", "tm", "quantmod",'olsrr','lattice','caret','rpart','arules','arulesViz','Matrix','outliers')
#if already installed it will just inform TRUE

