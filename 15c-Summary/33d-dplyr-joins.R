# DM - dplyr - joins

# Combine Data Sets

(a=data.frame(x1=c('A','B','C'), x2=c(1,2,3)))
(b=data.frame(x1=c('A','B','D'), x2=c('T','F','T')))

dplyr::left_join(a, b, by = "x1")
#Join matching rows from b to a.

dplyr::right_join(a, b, by = "x1")
#Join matching rows from a to b.

dplyr::inner_join(a, b, by = "x1")
#Join data. Retain only rows in both sets.

dplyr::full_join(a, b, by = "x1")
#Join data. Retain all values, all rows.

dplyr::semi_join(a, b, by = "x1")
#All rows in a that have a match in b.

cbind(a,b)

dplyr::anti_join(a, b, by = "x1")
#All rows in a that do not have a match in b.

#-----
y = data.frame(x1=c('A','B','C'), x2=c(1,2,3))
z = data.frame(x1=c('B','C','D'), x2=c(2,3,4))
cbind(y,z)

dplyr::intersect(y, z)  # B&C
#Rows that appear in both y and z.

dplyr::union(y, z)
#Rows that appear in either or both y and z.

dplyr::setdiff(y, z)
#Rows that appear in y but not z.

#Bind
dplyr::bind_rows(y, z)
#Append z to y as new rows.
dplyr::bind_cols(y, z)
#Append z to y as new columns.
#Caution: matches rows by position


