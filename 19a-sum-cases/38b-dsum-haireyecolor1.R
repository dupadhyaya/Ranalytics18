#Descriptive Stats - Hair/ Eye Color

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