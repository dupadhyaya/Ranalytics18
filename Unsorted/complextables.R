# Complex Tables
# http://r-exercises.com/2016/04/26/complex-tables-exercises/
# http://r-exercises.com/2016/04/26/complex-tables-solutions/

# Exercise 1 : In order to demonstrate the ftable() function’s capabilities, input the Titanic data from R:
data(Titanic)
Titanic
#For the first exercise, create a basic flat contingency table from the Titanic data, using the ftable() function.
ftable(Titanic)

#Exercise 2 : The row.vars argument specifies the table variables that will format as table rows. row.vars= is definable with variable numbers, or the variable names.
# Therefore, use row.vars= to specify the variable, Class, as the row variables.
ftable(Titanic, row.vars = 1)
ftable(Titanic, row.vars = "Class")
# Exercise 3 : Combine the row.vars and col.vars arguments to specify Class & Sex as the row variables, and Survived as the column variable.
#row.vars and col.vars are definable with variable numbers, or the variable names.
ftable(Titanic, row.vars = 1:2, col.vars = 4)
ftable(Titanic, row.vars = c("Class", "Sex"), col.vars = "Survived")

#Exercise 4
#With the parameters from the ftable used in Exercise 3, reverse the order of the Class and Sex columns.
ftable(Titanic, row.vars = 2:1, col.vars = 4)
ftable(Titanic, row.vars = c("Sex", "Class"), col.vars = "Survived")


#Exercise 5
#Next, using the ftable() code from Exercise 4, specify Age as the column variable.
ftable(Titanic, row.vars = 1:2, col.vars = 3)
#As you can see from this exercise, ftable() allows for the formatting of data for different areas of inquiry.
ftable(Titanic, row.vars = c("Sex", "Class"),col.vars = "Age")

#Exercise 6 : Using the data.frame() function will coerce ftable columns into rows. To demonstrate this, place the ftable() from Exercise 5, within the data.frame() function.
data.frame(ftable(Titanic, row.vars = 1:2, col.vars = 3))
data.frame(ftable(Titanic, row.vars = c("Sex", "Class"),col.vars = "Age"))

#Exercise 7 :Function ftable.formula provides a formula interface, (a data = . argument), for creating flat contingency tables.
#For example:  ftable(Survived ~ ., data = Titanic)
# Use the formula interface for ftable() to display the quantities in the Titanic data for Male/Female passengers, by Class and Age.
ftable(Sex ~ Class + Age, data = Titanic)

# Exercise 8 : The ftable() function creates an object of class ftable. In order to demonstrate this, save the results of the ftable formula from Exercise 5 as an ftable variable called titanicStats.
titanicStats <- ftable(Sex ~ Class + Age, data = Titanic)
titanicStats

# Exercise 9 : Using the write.table() function, write the ftable, titanicStats, to a file. Make sure your working directory is set to a folder where you can find the resulting file. Name the file, “table1”.
write.ftable(titanicStats, "table1")

# Exercise 10 : read.ftable() reads in a flat-like contingency table from a file.
# Using read.ftable(), read the file, “table1”, into an R language environment variable called data1
data1 <- read.ftable("table1")
data1
df = data.frame(data1)
df
