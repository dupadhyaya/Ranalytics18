# Cast and Melt
#https://www.r-statistics.com/2012/01/aggregation-and-restructuring-data-from-r-in-action/
  
(rollno = rep(c(10,11,12,13),4))
sname = rep(c('Achal','Apoorva','Goldie','Hitesh'),4)
(examunit = rep(c('U1', 'U2', 'U3', 'U4'),each= 4))
#(examunit = rep(c(1,2,3,4), each=4))
set.seed(1234)
(rpgm = ceiling(rnorm(4*4,60,10)))
set.seed(1234)
(sql  = ceiling(rnorm(4*4,65,10)))
df1 = data.frame(rollno, sname, examunit, rpgm, sql)
df1  # 16 rows, 4 students, 4 Units, 2 subjects(cols)

# Melt the data : wide to Long (more rows)

md = reshape::melt(df1, id=c('rollno', 'sname', 'examunit'))
head(md)
md
md[md$rollno==13,]
summary(md)

# Cast
# rollno + sname -> subjectwise mean
reshape::cast(md, rollno + sname ~ variable, mean)
reshape::cast(md, rollno + sname ~ variable, sum)



# unitwise mean
reshape::cast(md, examunit ~ variable)
reshape::cast(md, examunit ~ variable, sum)

head(md)
# unitwse mean per student
# cat(names(md))
# aggregate(md[-2], by=list(rollno,exam), value , FUN=mean )
# ?aggregate
df1[df1$rollno==10,]
# rollno -> subjectwise summary mean
reshape::cast(md, rollno ~ variable, mean)
# rollno -> unitwise summary (all subjects)
reshape::cast(md, rollno ~ examunit, mean)  # correct
# alongwith names
reshape::cast(md, rollno + sname ~ examunit, mean)  # correct
# rollno -> unitwise summary all subject
reshape::cast(md, rollno ~ examunit, mean, value='value') # this is also correct
# rollno - subject - units....
reshape::cast(md, rollno + variable ~ examunit, FUN=mean, value='value')

# initial data -> melt -> cast -> initial 
reshape::cast(md, rollno + sname + examunit  ~  variable, sum)
length(md); nrow(md)
head(md)
# Without aggregation  ----
reshape::cast(md, rollno + sname + examunit ~ variable)
reshape::cast(md, rollno + sname + variable ~ examunit)
reshape::cast(md, rollno + sname ~ variable ~ examunit)  # list type

library(reshape)
# Better way to do it
md2 = reshape::melt(df1, id.vars=c("rollno",'sname', 'examunit'),
           measure.vars=c("rpgm", "sql"),
           variable.name="subject", value.name="marks")
str(md2)
head(md2)  # with proper labeling

reshape::cast(md2, rollno + sname ~ subject, mean)
reshape::cast(md2, rollno + sname ~ subject, sum) # for all units
reshape::cast(md2, examunit ~ subject, mean, value='marks')  # for all students
reshape::cast(md2, examunit ~ subject, sum, value='marks')  # for all students

