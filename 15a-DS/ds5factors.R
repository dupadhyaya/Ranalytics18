# Factors
# 
#nominal
diabetes = c('Type1','Type2','Type1','Type1')
gender = c( 1,2,1,1,2) # 1-M, 2-F
#ordinal
clsposn = c(1 , 2 , 3 , 1)
status = c('Poor','Improved', 'Excellent', 'Improved')

diabetes ; gender ; clsposn ; status
class(diabetes) ; class(gender) ; class(clsposn) ; class(status)

# order of values don't matter
fdiabetes = factor(diabetes)
class(fdiabetes)
fdiabetes
summary(fdiabetes)
summary(diabetes)

# add another Type; converts into character
fdiabetes = c(fdiabetes, 'Type3')
fdiabetes
class(fdiabetes)

# Add another Level Properly
fdiabetes = factor(diabetes)
levels(fdiabetes)
fdiabetes = factor(fdiabetes, levels = c(levels(fdiabetes), 'Type3'))
fdiabetes
levels(fdiabetes) = c(levels(fdiabetes),'Type4')
fdiabetes
levels(fdiabetes)[5] = 'Type5'
fdiabetes
summary(fdiabetes)
fdiabetes[4] = c('Type3')
fdiabetes
fdiabetes[5] = c('Type6')  # Invalid as Type6 is not a level
fdiabetes
fdiabetes[1] = c('Type6') # Invalid changing an existing value to non existent level
fdiabetes
#NA created
#
sum (is.na (fdiabetes))  
table (fdiabetes, exclude=NULL)
table (fdiabetes, exclude=NA)

is.na(fdiabetes)
# Remove Null Values
fdiabetes = na.omit(fdiabetes)
fdiabetes
fdiabetes[1] = c('Type4')
summary(fdiabetes)

#Drop unused Levels
droplevels.factor(fdiabetes)
fdiabetes

levels(fdiabetes) = factor(fdiabetes)
fdiabetes


table(fdiabetes)
droplevels(table(fdiabetes))
# 1-M, 2-F
gender = c( 1,2,1,1,2)
fgender = factor(gender, levels=c(1,2),
           labels=c('M', 'F') )
gender ; fgender

head(airquality)
aq <- transform(airquality, Month = factor(Month, labels = month.abb[5:9]))
aq
summary(airquality$Month)
summary(aq$Month)
aq <- subset(aq, Month != "Jul")
summary(aq$Month)
table(           aq $Month)
table(droplevels(aq)$Month)
droplevels(aq)$Month


# Nominal - Integer Values
gender = c( 1,2,1,1,2) # 1-M, 2-F
fgender = factor(gender)
fgender
summary(fgender)

fgender2 = factor(gender, levels=c(1,2), labels=c('M','F'))
fgender2
summary(fgender2)



#ordinal
clsposn = c(1 , 2 , 3 , 1)
class(clsposn)
summary(clsposn)
mode(clsposn)
fclsposn = factor(clsposn)
fclsposn

summary(fclsposn)
levels(fclsposn)

fclsposn2 = factor(clsposn, levels=c(1,2,3,4,5), ordered=T, 
        labels=c('First','Second','Third','Fourth', 'Fifth'))
fclsposn2
summary(fclsposn2)
levels(fclsposn2)


fclsposn3 = factor(fclsposn2,levels(fclsposn2)[c(5,3,4,2,1)])
fclsposn3
print(levels(fclsposn3))

fclsposn2
fclsposn4 <- factor(fclsposn2, levels=rev(levels(fclsposn2)))
fclsposn4

class(fclsposn4)


status = c('Poor','Improved', 'Excellent', 'Improved')

fstatus = factor(status)
fstatus
# unordered Factors can be releveled - Making Poor first
fstatus2 = relevel(fstatus, 'Poor')
fstatus2

fstatus3 = factor(status, ordered=T, 
        levels=c('Poor', 'Improved', 'Excellent') )
fstatus3
summary(fstatus3)
plot(fstatus3)
plot(status)
plot(table(status))


library(gdata)
f <- factor(c("A", "B", "C", "D"))[1:3]
f
drop.levels(f)

l <- list(f=f, i=1:3, c=c("A", "B", "D"))
l
drop.levels(l)

df <- as.data.frame(l)
df
str(df)
str(drop.levels(df, reorder = F))
