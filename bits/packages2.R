# Install multiple Packages

#Install packages for Data Analytics Course


packages1 = c('rJava','xlsx','dplyr')
list.of.packages <- packages1
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
new.packages
if(length(new.packages)) install.packages(new.packages)
#if length is 0,all are installed, else missing packages will be installed

#another list
packages2 = c('plyr', 'psych', 'tm', 'quantmod')

#another list
packages3 = c('lubridate')

#another list
packages4 = c('dplyr','plyr','data.table','tidyr','gsheet','car','ggplot2','ISLR','amap','arules','arulesViz','forecast','rattle','CHAID','rpart','rpart.plot','ts','zoo','twitterR','ROAuth','RGtk2','partykit','strucchange','didrooRFM','curl','syuzhet','stringr','RTextTools','e10171','wordcloud','caret','catools','olsrr','xlsr','rJava')					

#amend below scripts to use packages list1 to list4
list.of.packages <- packages4
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]

new.packages

if(length(new.packages)) install.packages(new.packages)

