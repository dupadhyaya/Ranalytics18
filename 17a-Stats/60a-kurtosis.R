# kurtosis

# kurtosis describes the tail shape of the data distribution.
#Normal distribution - 0 kurtosis and thus the standard tail shape. It is said to be mesokurtic. 
#Negative kurtosis would indicate a thin-tailed data distribution, and is said to be platykurtic. 
#Positive kurtosis would indicate a fat-tailed distribution, and is said to be leptokurtic
library(e1071)                    # load e1071 
duration = faithful$eruptions     # eruption durations 
hist(duration)
plot(density(duration))
kurtosis(duration)                # apply the kurtosis function 
#[1] -1.5116

#Answer :The kurtosis of eruption duration is -1.5116, which indicates that eruption duration distribution is platykurtic. This is consistent with the fact that its histogram is not bell-shaped.

