mtcars[1:2]
mtcars$cyl2 <- with(mtcars, cyl +1)
mtcars$variable <- with(mtcars, disp * 2)
cor(mtcars[,c("am","carb","cyl")], use="complete")
normalityTest(~mpg, test="shapiro.test", data=mtcars)
RegModel.1 <- lm(mpg~am+carb, data=mtcars)
summary(RegModel.1)
RegModel.2 <- lm(mpg~am+carb+cyl+disp+drat, data=mtcars)
summary(RegModel.2)
Boxplot( ~ mpg, data=mtcars, id.method="y")

