# Packages installation

#List avl packages
library()


#Total Avl Packages
nrow(available.packages())

#Install Package amap
install.packages('amap')

#Load package
library(amap)

#Find functions in package
library(help=amap)

#Help wrt a package
help(package='amap')  #see on right side pane


#Unload---
install.packages('tm')

library(tm)
library(VIM)
search()
detach('package:tm', unload=TRUE)
detach(package:VIM, unload = T) 
search()



#Detach Multiple Packages
(detpkg = c('plyr','tm'))
library('plyr') #load lib
library('tm')  #load lib
search()  #check if loaded
Vectorize(detach)(name=paste0("package:", detpkg), unload=TRUE, character.only=TRUE)  #code to detach
search()  # confirm if removed
#specify the argument unload=TRUE; otherwise, R removes the package from the search path but doesn’t unload it.

#Detach from memory all packages
rm(list = ls(all = TRUE))
sessionInfo()


#Remove Packages ----- uninstall 
remove.packages("tm")
require('tm')# check if unistalled



#multiple packages

#Function
ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}
packagelist <- c('NLP','tm', 'lubridate')
ipak(packagelist)

#  package lists
pkg1 = c('dplyr','plyr', 'data.table','xlsx', 'Hmisc','rJava','ggplot2','lattice','gsheet','curl','stringr', 'syuzhet','e10171', 'catools','caret', 'olsrr' ,'swirl','sqldf','XML','VIM', 'outliers','car','MASS','DMwR','rvest')
pkg2 = c('forecast','rpart', 'rpart.plot', 'partykit','strucchange', 'didrooRFM')
pkg3 = c('zoo', 'astsa','lubridate','timeSeries','tseries','xts')
pkg4 = c('arules' , 'arulesViz')
pkg5 = c('twitterR','ROAuth','RGtk2','RTextTools','wordcloud')
install.packages("CHAID", repos="http://R-Forge.R-project.org")


library(lubridate)

#multiple load 
easypackages::libraries(pkg1)


#easypackages
#install.packages('easypackages')
library(easypackages)

#Install Multiple Packages
packages("plyr", "psych", "tm")
libraries("plyr", "psych", "tm")



#lubripack
install.packages('lubripack')  #NA for some versions
#install older version of R packages
#https://support.rstudio.com/hc/en-us/articles/219949047-Installing-older-versions-of-packages
#https://rdrr.io/github/Espanta/lubripack/

require(devtools)
install_github("Espanta/lubripack")
library(lubripack)
lubripack("plyr", "psych", "tm", "quantmod")



pack <- available.packages()
pack["ggplot2","Depends"]
pack["ggplot2","Imports"]
pack["data.table","Depends"]

packrat:::recursivePackageDependencies("ggplot2",lib.loc = .libPaths()[1])
tools::dependsOnPkgs('ggplot2')
tools::dependsOnPkgs('dplyr')
tools::dependsOnPkgs("ggplot2",installed=available.packages())
library(rusk)
#Remove Package
remove.packages('quantmod')
library(quantmod)



#Detach all mice package
library(mise)
search()
#mise(vars = TRUE, figs = TRUE, console = TRUE, pkgs = FALSE)
mise(pkgs=T)
search()



# list all packages where an update is available
old.packages()

# update all available packages
update.packages()

# update, without prompts for permission/clarification
update.packages(ask = FALSE)