#81 BARPLOT WITH VARIABLE WIDTH
#library(ggplot2)

# make data
data=data.frame(group=c("A ","B ","C ","D ") , value=c(33,62,56,67) , number_of_obs=c(100,500,459,342))

# Calculate the future positions on the x axis of each bar (left border, central position, right border)
data$right=cumsum(data$number_of_obs) + 30*c(0:(nrow(data)-1))
data$left=data$right - data$number_of_obs 

# Plot
ggplot(data, aes(ymin = 0)) + 
  geom_rect(aes(xmin = left, xmax = right, ymax = value, colour = group, fill = group)) +
  xlab("number of obs") + ylab("value")
