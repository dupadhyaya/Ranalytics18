
fit = lm(weight ~ height, data=women)
summary(fit)
range(women$height)
(ndata = data.frame(height= c(58.5, 60.7)))
(p = predict(fit, newdata = ndata))
cbind(ndata, p)
plot(fit)

sum((fitted(fit) - women$weight)^2)
