#ctree - Classification and Regression

### regression----
airq <- subset(airquality, !is.na(Ozone))
airct <- ctree(Ozone ~ ., data = airq)
airct
plot(airct)
plot(airct, type='simple')
plot(as.simpleparty(airct))

library("strucchange")
strucchange::sctest(airct, node = 1)
strucchange::sctest(airct, node = c(2,7,4,9))



predict(airct)
mean((airq$Ozone - predict(airct))^2)  #error
nodeids(airct,2)
nodeids(airct)
nodeids(airct, terminal=T)
nodeids(airct, from=2, terminal=T)
nodeids(airct,1,5)


#party
party::ctree(Ozone ~ ., data = airq)


### classification ---
irisct <- ctree(Species ~ .,data = iris)
irisct
plot(irisct, type='simple')
strucchange::sctest(irisct, node = 1)
strucchange::sctest(irisct, node = c(3,4,7))
#7 not significant


table(predict(irisct), iris$Species)
### estimated class probabilities, a list
(tr <- predict(irisct, newdata = iris[1:10,], type = "prob"))
(tr2 <- predict(irisct, newdata = iris[1:10,], type = "response"))
head(iris)
      