# CV - cars

plot(speed~dist, data=cars, main = "Cars" , xlab = "Stopping
Distance", ylab = "Speed")

#Step-2
glm.fit = glm(speed~dist, data=cars)
degree=1:5
cv.error5=rep(0,5)
for(d in degree){ 
  glm.fit = glm(speed~poly(dist, d), data=cars) 
  cv.error5[d] = cv.glm(cars,glm.fit,K=5)$delta[1]
}
glm.fit
par(mfrow=c(2,2))
plot(glm.fit)
cv.error5
plot(cv.error5)
lines(cv.error5)
par(mfrow=c(1,1))
plot(speed~dist, data=cars, main = "Cars" , xlab
     = "Stopping Distance", ylab = "Speed")
