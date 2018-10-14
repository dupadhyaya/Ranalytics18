#Outliers
#libaries - outliers,car
easypackages::libraries('outliers','car')

#Outlier
x = c(50:70,99, 150,150)
mean(x)
mean(x[x < 90])
mean(50:70)

#Box Plot
set.seed(482)
y = rnorm(100)
boxplot(y)
stripchart(y, vertical = TRUE,  method = "jitter", add = TRUE, pch = 20, col = 'blue', jitter=.05)
?stripchart
(pts = identify(rep(1, length(y)), y, labels = seq_along(y)))
#Click on outlier value and press FINISH button on Plot tab
#click on line along dashed lines
y[pts]


#Case
# Inject outliers into data.
head(cars)
cars1 <- cars[1:30, ]
cars_outliers <- data.frame(speed=c(19,19,20,20,20), dist=c(190, 186, 210, 220, 218))
cars2 <- rbind(cars1, cars_outliers)
tail(cars2)

# Plot of data with outliers.
par(mfrow=c(1, 2))
plot(cars2$speed, cars2$dist, xlim=c(0, 28), ylim=c(0, 230), main="With Outliers", xlab="speed", ylab="dist", pch="*", col="red", cex=2)
abline(lm(dist ~ speed, data=cars2), col="blue", lwd=3, lty=2)

# Plot of original data without outliers. Note the change in slope (angle) of best fit line.
plot(cars1$speed, cars1$dist, xlim=c(0, 28), ylim=c(0, 230), main="Outliers removed \n A much better fit!", xlab="speed", ylab="dist", pch="*", col="red", cex=2)
abline(lm(dist ~ speed, data=cars1), col="blue", lwd=3, lty=2)
#Notice the change in slope of the best fit line after removing the outliers. Had we used the outliers to train the model(left chart), our predictions would be exagerated (high error) for larger values of speed because of the larger slope.

#-------------------
#Now proceed with Outlier Analsis with Univariate, Bivariate, Multivariate


#Univariate Analysis

#add some extreme values to MPG variable
x = c(mtcars$mpg, c(50,55,90))
(outlier_values = boxplot.stats(x)$out)  # outlier values.
boxplot(x, main="MPG", boxwex=0.1)
mtext(paste("Outliers: ", paste(outlier_values, collapse=", ")), cex=0.6)

#outlier package
outliers::outlier(x)
outliers::scores(x,type="z", prob=0.95)

#Bivariate Analysis
#Visualize in box-plot of the X and Y, for categorical X’s
#What is the inference? The change in the level of boxes suggests that GEAR seem to have an less impact in MPG than CYL. Any outliers in respective categorical level show up as dots outside the whiskers of the boxplot.

#For continuous variable (convert to categorical if needed.)
par(mfrow=c(1,2))
boxplot(mpg ~ factor(gear), data=mtcars, main="Boxplot for MPG vs GEAR")
boxplot(mpg ~ factor(cyl), data=mtcars, main="Boxplot for MPG vs CYL")
#one outlier in CYL-8 boxplot with MPG

par(mfrow=c(1,1))
boxplot(mpg ~ factor(cyl), data=mtcars, main="Boxplot for MPG vs CYL")
#merge strip chart by add=T
stripchart(mpg ~ factor(cyl), vertical = TRUE, data = mtcars, method = "jitter", add = TRUE, pch = 20, col = 'blue')


#Multivariate Analysis (LM)
mod = lm(mpg ~ ., data=mtcars)
(cooksd = cooks.distance(mod))
cooksd[cooksd > 4 * mean(cooksd)]

#Influence measures- In general use, those observations that have a cook’s distance greater than 4 times the mean may be classified as influential. This is not a hard boundary.

plot(cooksd, pch="*", cex=2, main="Influential Obs by Cooks distance")  # plot cook's distance
abline(h = 4*mean(cooksd, na.rm=T), col="red")  # add cutoff line
text(x=1:length(cooksd)+1, y=cooksd, labels=ifelse(cooksd>4*mean(cooksd, na.rm=T),names(cooksd),""), col="red")  # add labels
#rows affected

(influential <- names(cooksd)[(cooksd > 4*mean(cooksd, na.rm=T))])
mtcars[influential, ]
colMeans(mtcars)
#disp & hp very high in Ford, qsec very high & hp very low in Merc 230

#Using Diagnostic Plot in LM
plot(mod,which=4)

#using outlier test - most extreme outlier
car::outlierTest(mod)

#outlier package-----
outliers::outlier(mtcars)
colMeans(mtcars)
#scores
#Compute the normalised scores based on “z”, “t”, “chisq” etc
#Find out observations that lie beyond a given percentile based on a given score.

outliers::scores(mtcars,type="z", prob=0.95)
#prob=.95 within 95% interval


#Methods to Resolve----
#Imputing
#Capping
x = mtcars$mpg
outliers::outlier(x)
(qnt = quantile(x, probs=c(.25, .75), na.rm = T))
(caps = quantile(x, probs=c(.05, .95), na.rm = T))
(H = 1.5 * IQR(x, na.rm = T))
boxplot(x,ylim=c(0,45))
text(1, 39,"Outlier")
#which values is more than 1.5 IQR
x[x > (qnt[2] + H)] #replace with 95% value
x[x < (qnt[1] - H)] <- caps[1]
x[x > (qnt[2] + H)] <- caps[2]
outliers::outlier(x) #next may come up
x[x > (qnt[2] + H)] # but here not it is < 1.5 IQR

#Prediction


#Advanced methods/ packages in R for outliers

