

(grades = sample(c(LETTERS[1:4]), size=30, replace=T, prob=c(.4,.2,.3,.1 )))
summary(grades)
(gradesF = factor(grades))
summary(gradesF)
table(grades)
table(gradesF)
class(gradesF)
(gradesFO = factor(grades, ordered=T))
(gradesFO1 = factor(grades, ordered=T, levels=c('B','C','A','D')))
summary(gradesFO1)

(marks = ceiling(rnorm(30, mean=60, sd=5)))
(gender = factor(sample(c('M', 'F'), size=30, replace=T)))
(student1 = data.frame(marks, gender, gradesFO1))
boxplot( marks ~ gradesFO1, data=student1)      
boxplot( marks ~ gradesFO1 + gender, data=student1)      

boxplot(marks)
summary(marks)
abline(h = summary(marks))
quantile(marks)
