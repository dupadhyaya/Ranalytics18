

df <- data.frame(State = LETTERS[1:3],
                Y = sample(1:10, 30, replace = TRUE),
                X = rep(1:10, 3))
df
library(ggplot2)

# You can plot geom_histogram or bar (pre-counted stats)
ggplot(df, aes(X, Y)) +
  geom_bar(stat = "identity", position = "dodge") +
  facet_grid(State ~ .)
# Or you can plot similar figure with geom_rect
ggplot(df)  +
  geom_rect(aes(xmin = X - 0.4, xmax = X + 0.4, ymin = 0, ymax = Y)) +
  facet_grid(State ~ .)

ggplot(df)  +
  geom_rect(aes(xmin = 0, xmax = Y, ymin = X - 0.4, ymax = X + 0.4)) +
  geom_boxplot(aes(X, Y)) +
  coord_flip() +
  facet_grid(State ~ .)

ggplot(df)  +
  geom_rect(aes(xmin = 0, xmax = Y, ymin = X - 0.4, ymax = X + 0.4),
            fill = "blue", color = "black") +
  geom_boxplot(aes(X, Y), alpha = 0.7, fill = "salmon2") +
  coord_flip() +
  facet_grid(State ~ .) +
  theme_classic() +
  scale_y_continuous(breaks = 1:max(df$X))


ggplot(iris, aes(x = Sepal.Width)) + 
  geom_histogram(binwidth = 0.05) +
  geom_boxplot(aes(x = 3, y = Sepal.Width))

library(gridExtra)

a <- ggplot(iris, aes(x = Sepal.Width)) + 
  geom_histogram(binwidth = 0.05) 

b <- ggplot(iris, aes(x = "", y = Sepal.Width)) + 
  geom_boxplot() + 
  coord_flip()

grid.arrange(a,b,nrow=2)

a <- ggplot(mtcars, aes(x = mpg)) + geom_histogram(binwidth = 0.1) 

b <- ggplot(mtcars, aes(x = "", y = mpg)) + geom_boxplot() +  coord_flip()

grid.arrange(a,b,nrow=2)
