# Proportion Table

(M = matrix( 1:12, ncol=3))
prop.table(M)
round(prop.table(M),2)
round(prop.table(M,1),2)
round(prop.table(M,2),2)

addmargins(prop.table(M))
addmargins(round(prop.table(M),2))
addmargins(round(prop.table(M),2),1)
addmargins(round(prop.table(M),2),2)
addmargins(round(prop.table(M),2),3)  # no 3rd dim

margin.table(round(prop.table(M),2))
margin.table(round(prop.table(M),2),1)   # summary of row - 4
margin.table(round(prop.table(M),2),2)   #summary of col  - 3



