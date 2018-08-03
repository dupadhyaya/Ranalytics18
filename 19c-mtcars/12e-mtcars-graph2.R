#Advance plot with ggplot2

library(ggplot2)
#use color brewer as default discrete colors
scale_colour_discrete <- function(...) scale_color_brewer(palette="Set1", ...)
scale_fill_discrete <- function(...) scale_fill_brewer(palette="Set1", ...)

data('mtcars')
df=mtcars
# create factors with value labels
df$gear <- factor(df$gear,levels=c(3,4,5),
                      labels=c("3gears","4gears","5gears"))
df$am <- factor(df$am,levels=c(0,1),
                    labels=c("Automatic","Manual"))
df$cyl <- factor(df$cyl,levels=c(4,6,8),
                     labels=c("4cyl","6cyl","8cyl"))
head(df)
str(df)


#density Plot
library(ggplot2)
qplot(mpg, data=df, geom="density", fill=gear, alpha=I(.5),
      main="Distribution of Gas Milage", xlab="Miles Per Gallon",    ylab="Density")


qplot(hp, mpg, data=df, shape=am, color=am,
      facets=gear~cyl, size=I(3),
      xlab="Horsepower", ylab="Miles per Gallon")

ggplot(df, aes(wt, mpg, color = cyl)) +
  geom_point() +  geom_smooth(method = "lm", formula = y~x) +
  labs(title = "Regression of MPG on Weight", x = "Weight", y = "Miles per Gallon")


qplot(gear, mpg, data=df, geom=c("boxplot", "jitter"),
      fill=gear, main="Mileage by Gear Number",
      xlab="", ylab="Miles per Gallon")
