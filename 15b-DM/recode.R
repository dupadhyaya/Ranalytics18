# Recode
# 
#using car package : recode
(marks = ceiling(runif(10,40,100)))
#The lo keyword tells recode to start the range at the lowest value.
#The hi keyword tells recode to end the range at the highest value.

(markscode <- car::recode(marks, "lo:70=1; 71:80=2;else = 3"))


markscode = car::recode(markscode, "1=6")
# straight method
markscode[markscode==6] = 5
markscode

