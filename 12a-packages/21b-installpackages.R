#Install packages for Data Analytics Course


packages1 = c('rJava','xlsx','dplyr')
packages2 = c('plyr', 'psych', 'tm', 'quantmod')
packages3 = c('lubridate')
packages4 = c('dplyr','plyr','data.table','tidyr','gsheet','car','ggplot2','ISLR','amap','arules','arulesViz','forecast','rattle','CHAID','rpart','rpart.plot','ts','zoo','twitterR','ROAuth','RGtk2','partykit','strucchange','didrooRFM','curl','syuzhet','stringr','RTextTools','e10171','wordcloud','caret','catools','olsrr','xlsr','rJava')					


list.of.packages <- packages4
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
new.packages
if(length(new.packages)) install.packages(new.packages)
