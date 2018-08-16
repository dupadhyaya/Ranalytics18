#Factor -----

(grades = sample(c('A','B','C','D'), size=30, replace=T, prob=c(.3,.2,.4,.1)))
table(grades)
(gradesFactor = factor(grades))
(gradesFactorOrdered = factor(grades, ordered=T))
(gradesFactorOrderedLevels = factor(grades, ordered=T, levels=c('D','C','B','A')))
class(grades)
class(gradesFactorOrdered)
class(gradesFactorOrderedLevels)
