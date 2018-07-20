# Workspace & Environment

getwd()         # print the current working directory
setwd("E:\\rWork\\rProjects\\analytics1")  # set working directory
getwd()
setwd("E:\\rWork\\rProjects\\analytics")  # set working directory

ls()        # list the objects in the current workspace

x=1:10
ls()

rm(x)                         # remove an object from workspace
rm(a,b)                       # remove multiple object from workspace
rm(list=ls(all=TRUE))         # clear workspace
ls()

#--------------------------------------------------