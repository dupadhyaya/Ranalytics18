#CHAID
#
gender = c(rep('Female',10),rep('Male',20))
gender
play = c(rep('Yes',2),rep('No',8),rep('Yes',13),rep('No',7) )
play
df1 = data.frame(gender, play)
df1
table(df1)
?chisq.test(table(df1))
chisq.test(gender,play)


((-1)^2 / 7) ^ 0.5
((1)^2 / 8) ^ 0.5
((-2)^2 / 8) ^ 0.5
