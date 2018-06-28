# Aggregate

student1 <- readRDS("student1.rds")
str(student1)
dim(student1)
names(student1)
summary(student1)
student1$br
student1submarks = student1[c("java","dbms", "dwm","vlsi","cpp","cbnst")]
str(student1submarks)

# for each gp of btechmarks, average other columns
aggregate(student1submarks, list(student1$btechmarks), mean, na.rm=T)

# Use dot notation 
# Grouping variables of java and dbms
aggregate(. ~ java + dbms, student1submarks, mean)

# Find the means of the numeric variables in airquality, with the grouping variable of Month
head(aggregate(. ~ student1$btechmarks, student1submarks, mean))

# aggregate(formula, data, FUN) # use aggregate.formula for a one-to-one aggregation of “airquality” by the mean of “Ozone” to the grouping variable “Day“.
head(aggregate(java ~ dbms, student1submarks, mean))
student1submarks$java[student1submarks$dbms==31]
student1submarks$java[student1submarks$dbms==40]
aggregate(dbms ~ java, student1submarks, mean)


aggregate(student1submarks, list(student1$btechmarks), mean, na.rm=T)
str(student1submarks)
aggregate(student1submarks[c(2,3,4)], list(student1$btechmarks), mean, na.rm=T)

aggregate(student1submarks$java, list(dbms=student1submarks$dbms), mean, na.rm=T)
aggregate(student1submarks$java, list(dbms=student1submarks$dbms), sd, na.rm=T)

aggregate(cbind(java, dbms) ~ student1$btechmarks, student1submarks, mean)

head(aggregate(student1$btechmarks ~ ., student1submarks, mean)) # bteck last
head(aggregate(. ~ student1$btechmarks, student1submarks, mean)) # btech first

lm(java ~ dbms+vlsi, data = student1submarks)




