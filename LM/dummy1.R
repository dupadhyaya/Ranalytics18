# Dummy Variables

df = mtcars
summary(df)
df$cyl = factor(df$cyl)
df$am = factor(df$am)

M1 = lm(mpg ~ wt + cyl , data=df)
summary(M1)
summary(df$cyl)
data.frame(wt=c(2,3), cyl=factor(c(4,6)))
predict(M1, newdata = data.frame(wt=c(2,3), cyl=factor(c(4,6))) )


summary(df)
y4 = 33.99 + -3.2 * wt + 0
y6 = 33.99 + -3.2 * wt + -4.2 * cyl6(=1)
y8 = 33.99 + -3.2 * wt + -6.07 * cyl8(=1)

head(df)
y4 = 