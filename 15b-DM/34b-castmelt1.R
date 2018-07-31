# Data Frame

# Wide Format to Long Format 
rollno = c(17010,17045,17012,17087,17057,17056,17032,17084,17078,17018,17013)
lname  = c('Achal Kumar','Apoorva Karn','Goldie Sahni','Hitesh Mann','Kaustav Chatterjee','Meena Srisha Valavala','Rashmi Ranjan Mangaraj','Shruti Sinha','Shubham Pujan','Vijay Pal Singh','Lalit Sahni')
name  = c('Achal','Apoorva','Goldie','Hitesh','Kaustav','Meena','Rashmi','Shruti','Shubham','Vijay','Lalit')

course = c('PGDDS','PGDDS','PGDDS','PGDDS','MSCDS','PGDDS','MSCDS','PGDDS','PGDDS','PGDDS','PGDDS')
stats = ceiling(runif(11,50,100))
excel = ceiling(runif(11,50,100))
rpgm = ceiling(runif(11,50,100))

students = data.frame(rollno, name, course, stats, excel, rpgm, stringsAsFactors = F)
students
students$course = factor(students$course)
str(students)
# data ready
head(students)

library(reshape2)
students2 <- melt(students, id.vars=c("rollno",'name','course'),
          measure.vars=c("stats", "excel", "rpgm"),
         variable.name="subject", value.name="marks")
students2


# Long to Short
students3 = students2
head(students3)
students4 = dcast(students3, rollno + name + course ~ subject, value.var='marks')
students4 

students5 = dcast(students3, course ~ subject, value.var = 'marks', mean)
students5

students6 = dcast(students3, name ~ subject, value.var = 'marks', mean)
students6  # name to factor

students7 = dcast(students3, rollno + name ~ course + subject, value.var='marks')
students7 # not meaninful here

?dcast


?cast



# Examples
#Air quality example
names(airquality) <- tolower(names(airquality))
head(airquality)
aqm <- melt(airquality, id=c("month", "day"), na.rm=TRUE)
head(aqm)

acast(aqm, day ~ month ~ variable)
acast(aqm, month ~ variable, mean)
acast(aqm, month ~ variable, mean, margins = TRUE)
dcast(aqm, month ~ variable, mean, margins = c("month", "variable"))

library(plyr) # needed to access . function
acast(aqm, variable ~ month, mean, subset = .(variable == "ozone"))
acast(aqm, variable ~ month, mean, subset = .(month == 5))

#Chick weight example
names(ChickWeight) <- tolower(names(ChickWeight))
chick_m <- melt(ChickWeight, id=2:4, na.rm=TRUE)

dcast(chick_m, time ~ variable, mean) # average effect of time
dcast(chick_m, diet ~ variable, mean) # average effect of diet
acast(chick_m, diet ~ time, mean) # average effect of diet & time

# How many chicks at each time? - checking for balance
acast(chick_m, time ~ diet, length)
acast(chick_m, chick ~ time, mean)
acast(chick_m, chick ~ time, mean, subset = .(time < 10 & chick < 20))

acast(chick_m, time ~ diet, length)

dcast(chick_m, diet + chick ~ time)
acast(chick_m, diet + chick ~ time)
acast(chick_m, chick ~ time ~ diet)
acast(chick_m, diet + chick ~ time, length, margins="diet")
acast(chick_m, diet + chick ~ time, length, drop = FALSE)

#Tips example
dcast(melt(tips), sex ~ smoker, mean, subset = .(variable == "total_bill"))

ff_d <- melt(french_fries, id=1:4, na.rm=TRUE)
acast(ff_d, subject ~ time, length)
acast(ff_d, subject ~ time, length, fill=0)
dcast(ff_d, treatment ~ variable, mean, margins = TRUE)
dcast(ff_d, treatment + subject ~ variable, mean, margins="treatment")
if (require("lattice")) {
  lattice::xyplot(`1` ~ `2` | variable, dcast(ff_d, ... ~ rep), aspect="iso")
}
