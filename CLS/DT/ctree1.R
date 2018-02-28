#ctree
#
head(airquality)
airq <- subset(airquality, !is.na(Ozone))
air.ct <- ctree(Ozone ~ ., data = airq, 
      controls = ctree_control(maxsurrogate = 3))
air.ct
plot(air.ct)
nodes(air.ct, 1)
nodes(air.ct, 5)
nodes(air.ct, 7)
?ctree

Solar.R = c(rep(0,6))
Wind = c(rep(c(5,12),3))
Temp = c(rep(70,6))
Month = Day = c(rep(0,6))

new.airq = data.frame(Solar.R, Wind, Temp, Month, Day)
new.airq
sapply(airq[,-1], class)
sapply(new.airq, class)
class(new.airq$Solar.R) = 'integer'
class(new.airq$Temp) = 'integer'
class(new.airq$Month) = 'integer'
class(new.airq$Day) = 'integer'

cbind(new.airq, predict(air.ct, newdata = new.airq))
predict(air.ct, newdata = new.airq, type = "node")
airq$node = predict(air.ct, type = "node")
head(airq)
where(air.ct)

# 2nd Example
head(iris)
table(iris$Species, predict(iris.ct), dnn = c("Actual species", "Predicted species"))
new.iris
predict(iris.ct, newdata = new.iris)
predict(iris.ct, newdata = new.iris, type = "node")
#https://www.r-bloggers.com/package-party-conditional-inference-trees/
#