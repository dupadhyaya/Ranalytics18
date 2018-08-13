# Workspace & Environment

# Identify the directory
getwd()

# List all the objects in directory
dir()

# How to run the code-- Press Control Key and then Press Enter

# "#" is used to comment a particular section in R
#comment
#comment with bookmarks
#topic2----
# To clear the console--- Press Control and then L Key

getwd()         # print the current working directory
setwd("E:\\rWork\\rProjects\\analytics1")  # set working directory
getwd()
setwd("E:\\rWork\\rProjects\\analytics")  # set working directory

ls()        # list the objects in the current workspace

x=1:10
ls()

# To Clear the enviornment list or unload the objects
remove(list = ls())


rm(x)                         # remove an object from workspace
rm(a,b)                       # remove multiple object from workspace
rm(list=ls(all=TRUE))         # clear workspace
ls()

#--------------------------------------------------

