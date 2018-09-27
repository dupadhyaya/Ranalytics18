#Packages

#List avl packages
library()

#Total Avl Packages - CRAN Site
nrow(available.packages())

#Install Package amap
install.packages('amap')

#Load package
library(amap)
library(dplyr)

#check if loaded 
search()

#Find functions in package
library(help=amap)

#Help wrt a package
help(package='amap')  #see on right side pane

#Packages avl for loading
.packages(all.available = T)   #avl for loading


#Unload---
library(tm)  #load tm package
library(VIM)  #load VIM package
search()   #check if loaded
detach('package:tm', unload=TRUE)

search.packages("package:tm")
?search
detach(package:VIM, unload = T) 
search()



#Detach from memory all packages
rm(list = ls(all = TRUE))
search()
sessionInfo()

#Remove Packages ----- uninstall 
remove.packages("tm")
require('tm')# check if unistalled

find.package("tm")
