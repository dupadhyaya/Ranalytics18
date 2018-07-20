# Descriptive Stats and Graphs
# http://www.sthda.com/english/wiki/descriptive-statistics-and-graphics


#Import your data into R----

# Store the data in the variable my_data
my_data <- iris

#Check your data----
# Print the first 6 rows
head(my_data, 6)

#R functions for computing descriptive statistics----

#Descriptive statistics for a single group----

#Measure of central tendency: mean, median, mode----
# Compute the mean value
mean(my_data$Sepal.Length)

# Compute the median value
median(my_data$Sepal.Length)

# Compute the mode
#install.packages("modeest")
require(modeest)
mfv(my_data$Sepal.Length)


#Measure of variablity----

#Range: minimum & maximum----
# Compute the minimum value
min(my_data$Sepal.Length)

# Compute the maximum value
max(my_data$Sepal.Length)

# Range
range(my_data$Sepal.Length)

#Interquartile range---
sort(my_data$Sepal.Length)
quantile(my_data$Sepal.Length)

#By default, the function returns the minimum, the maximum and three quartiles (the 0.25, 0.50 and 0.75 quartiles).
quantile(my_data$Sepal.Length, seq(0, 1, 0.1))
IQR(my_data$Sepal.Length)

#Variance and standard deviation----

# Compute the variance
var(my_data$Sepal.Length)
# Compute the standard deviation =
# square root of th variance
sqrt(var(my_data$Sepal.Length))
sd(my_data$Sepal.Length)

#Median absolute deviation----
# Compute the median
median(my_data$Sepal.Length)
# Compute the median absolute deviation : Dev wrt median value
mad(my_data$Sepal.Length)

#Which measure to use?----

# Range. It’s not often used because it’s very sensitive to outliers.
# Interquartile range. It’s pretty robust to outliers. It’s used a lot in combination with the median.
# Variance. It’s completely uninterpretable because it doesn’t use the same units as the data. It’s almost never used except as a mathematical tool
# Standard deviation. This is the square root of the variance. It’s expressed in the same units as the data. The standard deviation is often used in the situation where the mean is the measure of central tendency.
# Median absolute deviation. It’s a robust way to estimate the standard deviation, for data with outliers. It’s not used very often.
# In summary, the IQR and the standard deviation are the two most common measures used to report the variability of the data.




#Computing an overall summary of a variable and an entire data frame----

#summary() function----
summary(my_data$Sepal.Length)
summary(my_data, digits = 1)

# summary() is automatically applied to each column. The format of the result depends on the type of the data contained in the column. For example:
#   If the column is a numeric variable, mean, median, min, max and quartiles are returned.
# If the column is a factor variable, the number of observations in each group is returned.



#sapply() function----

# Compute the mean of each column
sapply(my_data[, -5], mean)

# Compute quartiles
sapply(my_data[, -5], quantile)


#stat.desc() function----
#install.packages("pastecs")

# Compute descriptive statistics
library(pastecs)
res <- stat.desc(my_data[, -5])
round(res, 2)

#Case of missing values----
mean(my_data$Sepal.Length, na.rm = TRUE)

#Graphical display of distributions----

#Installation and loading ggpubr----
# Install
if(!require(devtools)) install.packages("devtools")
devtools::install_github("kassambara/ggpubr")
#or install.packages("ggpubr")

library(ggpubr)

#Box plots----
ggboxplot(my_data, y = "Sepal.Length", width = 0.5)

#Histogram----
#Histograms show the number of observations that fall within specified divisions (i.e., bins).
gghistogram(my_data, x = "Sepal.Length", bins = 9, add = "mean")


#Empirical cumulative distribution function (ECDF)----
#ECDF is the fraction of data smaller than or equal to x.
ggecdf(my_data, x = "Sepal.Length")


#Q-Q plots----
ggqqplot(my_data, x = "Sepal.Length")


#Descriptive statistics by groups----

#Frequency tables----
library(dplyr)
group_by(my_data, Species) %>% 
  summarise(count = n(),   mean = mean(Sepal.Length, na.rm = TRUE),
    sd = sd(Sepal.Length, na.rm = TRUE)
  )

library("ggpubr")
# Box plot colored by groups: Species
ggboxplot(my_data, x = "Species", y = "Sepal.Length",
    color = "Species",  palette = c("#00AFBB", "#E7B800", "#FC4E07"))

# Stripchart colored by groups: Species
ggstripchart(my_data, x = "Species", y = "Sepal.Length",
             color = "Species",
             palette = c("#00AFBB", "#E7B800", "#FC4E07"),
             add = "mean_sd")

#Create some data----

# Hair/eye color data
str(HairEyeColor)
HairEyeColor
apply(HairEyeColor, c(1,2), sum)

df <- as.data.frame(HairEyeColor)
hair_eye_col <- df[rep(row.names(df), df$Freq), 1:3]
rownames(hair_eye_col) <- 1:nrow(hair_eye_col)
head(hair_eye_col)

#Simple frequency distribution: one categorical variable----
# hair/eye variables
Hair <- hair_eye_col$Hair
Eye <- hair_eye_col$Eye
# Frequency distribution of hair color
table(Hair)
table(Eye)

#Two-way contingency table: Two categorical variables----
# Compute table and convert as data frame
df <- as.data.frame(table(Hair))
df

# Visualize using bar plot
library(ggpubr)
ggbarplot(df, x = "Hair", y = "Freq")

#Multiway tables: More than two categorical variables----
tbl2 <- table(Hair , Eye)
tbl2
#function xtabs(), which will create cross tabulation of data frames with a formula interface.
xtabs(~ Hair + Eye, data = hair_eye_col)

#Compute table margins and relative frequency----

df <- as.data.frame(tbl2)
head(df)


# Visualize using bar plot
library(ggpubr)
ggbarplot(df, x = "Hair", y = "Freq",
          color = "Eye", 
          palette = c("brown", "blue", "gold", "green"))

# position dodge
ggbarplot(df, x = "Hair", y = "Freq",
          color = "Eye", position = position_dodge(),
          palette = c("brown", "blue", "gold", "green"))


#Multiway tables: More than two categorical variables
#Hair and Eye color distributions by sex using xtabs():
xtabs(~Hair + Eye + Sex, data = hair_eye_col)

#ftable when you have more than two variables:
ftable(Sex + Hair ~ Eye, data = hair_eye_col)


#Compute table margins and relative frequency
#The function margin.table() and prop.table() can be used to compute table margins and relative frequencies, respectively.
#Format of the functions: margin.table(x, margin = NULL), prop.table(x, margin = NULL)
#x: table; margin: index number (1 for rows and 2 for columns)

#compute table margins:
Hair <- hair_eye_col$Hair
Eye <- hair_eye_col$Eye
# Hair/Eye color table
he.tbl <- table(Hair, Eye)
he.tbl

# Margin of rows
margin.table(he.tbl, 1)

# Margin of columns
margin.table(he.tbl, 2)

# Frequencies relative to row total
prop.table(he.tbl, 1)

# Table of percentages
round(prop.table(he.tbl, 1), 2)*100

#express the frequencies relative to the grand total, use this:
he.tbl/sum(he.tbl)
