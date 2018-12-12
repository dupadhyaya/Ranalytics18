#Hitesh - Dec 18

data = read.csv(file.choose())
head(data)
summary(data)
head(data,100)
# Data is samples at 1 minute interval and for 2 months
# Here, below are the definition of each data point:
#   voltage >  0 means   good power,
# Voltage == 0 means  Power failure but UPS giving backup
# Voltage data missing means UPS is fully discharged 
library(dplyr)
names(data)
data2<- data %>% mutate(site1 = ifelse(is.na(Site.1), 'UPS-Discharged',(ifelse(Site.1 > 0, 'Good', (ifelse(Site.1 == 0, 'UPS', ''))))))

data3 <- data2 %>% mutate(site2 = ifelse(is.na(Site.2), 'UPS-Discharged',(ifelse(Site.2 > 0, 'Good', (ifelse(Site.2 == 0, 'UPS', ''))))))

head(data3)

# Problem Statement:
#   Summarise the instances of Power Failure on the following grounds:
#count of Power Failure and when UPS-Discharged
data3 %>% filter(site1=='UPS' | site1=='UPS-Discharged' ) %>% tally
data3 %>% filter(site2=='UPS' | site2=='UPS-Discharged') %>% tally


#   Number & Duration of Power Failures.
#Power failure is when voltage shifts from > 0 to 0 and remains in 0 till voltage comes ie > 0
lag(data3$Site.1)

# Number of times & Duration for which UPS did not provide any backup.

# Number of times & Duration for which UPS provided backup.

# Any Trends/Patterns in the Power Failure.


# Compare the UPS performance at 2 sites


# Also compare the two sites on the basis of above analysis.



# Try to summarise your observations using some self-explanatory plots.