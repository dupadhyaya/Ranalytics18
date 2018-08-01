#Summarise with Group

library(dplyr)
head(mtcars)
mtcars %>% group_by(am) 
#nothing - just separation

mtcars %>% group_by(am) %>% summarise(mean(mpg), max(wt))

#summarise_all
mtcars %>% group_by(am, gear) %>% summarise_all(mean)
mtcars %>% group_by(am, gear)%>% summarise_all(c("min", "max"))
mtcars %>% group_by(am, gear)%>% summarise_all(funs(med = median))



#without Group
mtcars %>% summarise(mean(mpg), max(wt))
mtcars %>% summarise_all(mean)
mtcars %>% select(wt, gear)%>% summarise_all(c("min", "max"))
mtcars %>% summarise_all(funs(med = median))





mtcars %>% summarise_if(is.numeric, mean, na.rm = TRUE)
iris %>% summarise_if(is.numeric, mean, na.rm = TRUE)

#specific columns
mtcars %>% summarise_at(c("mpg", "wt"), mean, na.rm = TRUE)

