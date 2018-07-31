# cbind rbind

cbind()  # easier than matrix command
# retain row and column names 
marks1 = ceiling(runif(11, 4, 10))
marks2 = ceiling(runif(11, 4, 10))

cbind(marks1, marks2)
(m1 = matrix(c(marks1, marks2), ncol=2))
# rownames gone

(m2 = as.matrix(cbind(marks1, marks2)))
str(m2)  #??
m2[[1]]
m2[1]
m2[,1]
m2$marks

#(m3 = cbind(marks1, marks2))
#(m3 = as.numeric(cbind(marks1, marks2))


#(m3 = as.matrix(as.numeric(cbind(marks1, marks2))   , ncol=2))

#str(m3)

# DF from cbind and rbind
# 
(df1= cbind.data.frame(marks1, marks2))
str(df1)

(df2=rbind.data.frame(marks1,marks2))
