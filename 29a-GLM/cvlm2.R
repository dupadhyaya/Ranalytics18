
library(caret)

data(diamonds)
?diamonds

mydata = diamonds
model <- train(
  price ~ ., mydata,
  method = "lm",
  trControl = trainControl(
    method = "cv", number = 10,
    verboseIter = TRUE
  )
)
summary(model)

fit = lm(price ~ . , data=mydata)
summary(fit)
AIC(model,fit)



library(caret)
# load the iris dataset
data(iris)
# define training control
train_control <- trainControl(method="cv", number=10)
# fix the parameters of the algorithm
grid <- expand.grid(.fL=c(0), .usekernel=c(FALSE))
grid
?expand.grid
# train the model
model <- train(Species~., data=iris, trControl=train_control, method="nb", tuneGrid=grid)
# summarize results
print(model)


library(DAAG)
houseprices
cv.lm(data = DAAG::houseprices, form.lm = formula(sale.price ~ area),
      m = 3, dots = FALSE, seed = 29, plotit = c("Observed","Residual"),
      main="Small symbols show cross-validation predicted values",
      legend.pos="topleft", printit = TRUE)
CVlm(data = DAAG::houseprices, form.lm = formula(sale.price ~ area),
    m = 3, dots = FALSE, seed = 29, plotit = c("Observed","Residual"),
    main="Small symbols show cross-validation predicted values",
    legend.pos="topleft", printit = TRUE)



CVlm(data=nihills, form.lm=formula(log(time)~log(climb)+log(dist)),
     plotit="Observed")
CVlm(data=nihills, form.lm=formula(log(time)~log(climb)+log(dist)),
     plotit="Residual")
out <- CVlm(data=nihills, form.lm=formula(log(time)~log(climb)+log(dist)),
            plotit="Observed")
out
out[c("ms","df")]

mydata=women
str(mydata)

fit = lm(weight ~ height, data=mydata)
plot( mydata$height , mydata$weight)
abline(fit)
summary(fit)

CV1 =CVlm(data=mydata, m=3, form.lm=formula(weight ~ height), plotit="Observed" )

CV2 = CVlm(data=mydata, m=4, form.lm=formula(weight ~ height), plotit="Observed" )

attributes(CV2)$ms
