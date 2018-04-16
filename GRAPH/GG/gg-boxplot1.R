# ggplot

marks1 = runif(100, 50,100)
marks2 = rnorm(100, 60,10)
marks3 = rnorm(100, 70,15)
df = data.frame(marks1, marks2, marks3)

head(stack(df))

library(ggplot2)
ggplot(stack(df[,c(1,2,3)]), aes(x = ind, y = values)) + geom_boxplot() +   theme(axis.text.x = element_text(angle = 60, hjust = 1, vjust=1)) +
  labs(title = "Boxplots of columns") + labs(x = "", y = "Values") + 
  scale_y_continuous(breaks = seq(1, 10, by = 1))

