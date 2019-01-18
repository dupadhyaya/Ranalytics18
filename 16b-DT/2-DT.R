#Data.table

#combining tables

library(data.table)
(rollno = paste('S',10:20,sep=''))
(sname = paste('Student',1:11,sep=''))
students = data.table(rollno, sname)
students

(rollno2 = paste('S',10:15,sep=''))
(sub1 = round(rnorm(6, mean=60, sd=10)))
(marks = data.table(rollno2, sub1))

#join
students[ marks, on= .(rollno = rollno2)]

#roll ?
students[ marks, on= .(rollno = rollno2), roll=T]

#cbind
cbind(students, students)
rbind(students, students)


#reshape
(rollno3 = paste('S',11:20,sep=''))
(sname3 = paste('Student',1:10,sep=''))
(sub1 =  round(rnorm(10, mean=60, sd=10)))
(sub2 =  round(rnorm(10, mean=70, sd=5)))

students3 = data.table(rollno3, sname3, sub1, sub2)
students3
#melt
DTmelt <- melt(students3, id.vars= c('rollno3', 'sname3'), measure.vars = c('sub1','sub2'), variable.name='subject', value.name = 'marks')
DTmelt

#wide/ spread
dcast(DTmelt, formula = rollno3 + sname3 ~ subject, value.var = 'marks')
