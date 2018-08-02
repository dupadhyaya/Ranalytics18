# vaibhav
# 
library(ggplot2)
uniDataCateg<- read.csv("bic.csv",header = TRUE)
ggplot(uniDataCateg, aes(x = values, y = perc)) + geom_bar(stat = "identity")+ facet_wrap(~ variable, scales = "free")
str(uniDataCateg)
barplot(uniDataCateg$perc)



dat <- read.table(text = "    ONE TWO THREE
1   23  234 324
                  2   34  534 12
                  3   56  324 124
                  4   34  234 124
                  5   123 534 654",sep = "",header = TRUE)
dat
library(reshape2)
#Add an id variable for the filled regions
datm <- melt(cbind(dat, ind = rownames(dat)), id.vars = c('ind'))
datm
library(scales)
ggplot(datm,aes(x = variable, y = value,fill = ind)) + 
  geom_bar(position = "fill",stat = "identity") + 
  scale_y_continuous(labels = percent_format())



your_matrix<-( 
  rbind(
    c(10,20), 
    c(20,30), 
    c(40,50)
    )
)
your_matrix
barplot(prop.table(your_matrix, 2) )

str(uniDataCateg)
df1 = as.matrix(uniDataCateg[,c('Perc_churn','diff')])
head(df1)
barplot(prop.table(df1,1))


library(cowplot)
# Bar plot
bp <- ggplot(diamonds, aes(clarity, fill = cut)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle=70, vjust=0.5))
bp
diamonds
bp2 = ggplot(diamonds, aes(clarity, fill = cut)) + geom_bar()
bp2

str(Students)

library(Lock5Data)
data(SleepStudy)
data(student)
heart = read.table("heart-rate", header = TRUE)
students = read.csv("students.csv")


https://rpubs.com/escott8908/RGC_Ch3_Gar_Graphs
library(gcookbook)
library(ggplot2)
library(plyr) #Is this automatically loaded with ggplot2?
library(dplyr)

cabbage_exp
ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) + 
  geom_bar(stat='identity')
