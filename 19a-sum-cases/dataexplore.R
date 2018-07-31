# tabulations  
#  http://r-exercises.com/2016/04/20/data-exploration-with-tables-exercises/

#Exercise 1 Basic tabulation of categorical data:
#  This is the first dataset to explore:
Gender <- c("Female","Female","Male","Male")
Restaurant <- c("Yes","No","Yes","No")
Count <- c(220, 780, 400, 600)
DiningSurvey <- data.frame(Gender, Restaurant, Count)
DiningSurvey
# Using the above data, and the table() function, compare the Gender and Restaurant variables in the above dataset.
table(DiningSurvey$Gender)


# Exercise 2 The table() function modified with a logical vector:
# Use the table() function, and logical vector of “Count > 650”, to summarize the DiningSurvey data.

table(DiningSurvey$Count > 650)

# Exercise 3 : The useNA & is.na arguments find missing values:
table(DiningSurvey$Restaurant, useNA = 'always')

# First append the “DiningSurvey” dataset with missing values:
DiningSurvey$Restaurant <- c("Yes", "No", "Yes", NA)
# Apply the “useNA” argument to find missing Restaurant data.

DiningSurvey
# Next, apply the “is.na()” argument to find missing Restaurant data by Gender.
table(DiningSurvey$Gender, is.na(DiningSurvey$Restaurant))


# Exercise 4 : The “exclude =” parameter excludes columns of data:
#  Exclude one of the dataset’s Genders with the “exclude” argument.
table(DiningSurvey$Gender, exclude = 'Male')

# Exercise 5 The “margin.table()” function requires data in array form, and generates tables of marginal frequencies. The margin.table() function summarizes arrays within a given index:
# First, generate array format data:

RentalUnits <- matrix(c(45,37,34,10,15,12,24,18,19),ncol=3,byrow=TRUE)
colnames(RentalUnits) <- c("Section1","Section2","Section3")
rownames(RentalUnits) <- c("Rented","Vacant","Reserved")
RentalUnits <- as.table(RentalUnits)
RentalUnits
# Using the above dataset, and the margin.table() function, find the amount of Occupancy summed over Sections.

margin.table(RentalUnits,1)

#Next, find the amount of Units summed by Section.
margin.table(RentalUnits, 2)

# Exercise 6 : The prop.table() function creates tables of proportions within the dataset:
# With the “RentalUnits” data table, use the “prop.table()” function to create a basic table of proportions.
# Next, find row percentages, and column percentages.
prop.table(RentalUnits)
prop.table(RentalUnits, 1)
prop.table(RentalUnits, 2)


# Exercise 7 : The ftable() function generates multidimensional n-way tables, or “flat” contingency tables:
# Use the ftable() function to summarize the dataset, “RentalUnits”.
ftable(RentalUnits)

# Exercise 8 : The “summary()” function performs an independence test of factors:
# Use “summary()” to perform a Chi-Square Test of Independence, of the “RentalUnits” variables.
summary(RentalUnits)

# Exercise 9 : “as.data.frame()” summarizes frequencies of data arrays.
# Use “as.data.frame()” to list frequencies within the “RentalUnits” array.
as.data.frame(RentalUnits)

# Exercise 10 : The “addmargins()” function creates arbitrary margins on multivariate arrays:
# Use “addmargins()” to append “RentalUnits” with sums.
addmargins(RentalUnits)
# Next, summarize columns with “RentalUnits”.
addmargins(RentalUnits,1)
# Next, summarize rows with “RentalUnits”.
addmargins(RentalUnits,2)
# Finally, combine “addmargins()” and “prop.table()” to summarize proportions within “RentalUnits”. What is statistically inferred about sales of rental units by section?
addmargins(prop.table(RentalUnits, 2))
