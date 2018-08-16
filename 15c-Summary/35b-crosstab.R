# Crosstab
#http://rstudio-pubs-static.s3.amazonaws.com/6975_c4943349b6174f448104a5513fed59a9.html

ID <- seq(1:177)
Age <- sample(c("0-15", "16-29", "30-44", "45-64", "65+"), 177, replace = TRUE)
Sex <- sample(c("Male", "Female"), 177, replace = TRUE)
Country <- sample(c("England", "Wales", "Scotland", "N. Ireland"), 177, replace = TRUE)
Health <- sample(c("Poor", "Average", "Good"), 177, replace = TRUE)
Survey <- data.frame(Age, Sex, Country, Health)
head(Survey)

library(catspec)
?ctab
ftable(Titanic)
str(Titanic)
ctab(Titanic)
ctab(Titanic,type='r')
ctab(Titanic,type=c('r','n'))
ctab(Titanic,type=c("n","c","t","r"),style="w")
mytab<-ftable(Titanic,row.vars=c(1,3),type="r")
mytab
ctab(mytab)
newtab = ctab(mytab, type='r')
newtab
summary(newtab)

# Data Frame ------------
# 
library(survival)
data(logan)
attach(logan)
str(logan)
class(logan) #"data.frame"
head(logan)
ctab(occupation)
ctab(occupation,addmargins=TRUE)
ctab(occupation,style="w",type="c")
ctab(occupation,style="l",type="n")
ctab(occupation,style="l",type="c")

z<-ctab(occupation,addmargins=TRUE,style="l")
z
print(z,addmargins=FALSE,dec.places=5)
summary(z)
