# Dummy Variables
# How categorical Values are handled in Linear Regression

df = mtcars
summary(df)
df$cyl = factor(df$cyl)
df$am = factor(df$am)

M1 = lm(mpg ~ wt + cyl , data=df)
summary(M1)

summary(df$cyl)

data.frame(wt=c(2,3), cyl=factor(c(4,6)))
predict(M1, newdata = data.frame(wt=c(2,2,2), cyl=factor(c(4,6, 8))) )
str(df)

summary(df)
#Predicting in case of Dummy Variables : Manual
y = 33.99 + -3.2 * wt + (0) * cyl4 + (-4.1) * cyl6 + (-6.071) * cyl8
wt=2 ; cyl4=1; cyl6=0; cyl8=0 #value predicted = 27.48
y4 = 33.99 + -3.2 * wt + 0  # this is for cyl=4
cyl6=1
(y6 = 33.99 + -3.2 * wt + -4.2 * cyl6)  #cyl = 6 (=1)

y8 = 33.99 + -3.2 * wt + -6.07 * cyl8 #cyl = 8(=1)

head(df)
