# Logistic Regression - mtcars

(base = glm(am ~ 1, data=mtcars,family = binomial()))
exp(-0.3795)
(odds = exp(-0.3795))
anova(base)
(fit1 = glm(am ~ mpg + disp + hp + wt, data = mtcars, family = binomial() ))
fit1
summary(fit1)
par(mar=c(1,1,1,1))
layout(matrix(c(1,2,3,4), 2,2))
plot(fit1)


(fit2 = glm(am ~ mpg + hp + wt, data = mtcars,
            family = binomial() ))
fit2


(fit3 = glm(am ~ hp + wt, data=mtcars,  family = binomial()))

exp(8.124)
(p = exp(8.124)/ (1 + exp(8.124)))


newdata =  data.frame(wt=2.780, hp=109)
newdata =  data.frame(wt=3.845, hp=175)

predict(fit3, newdata = newdata, type='response')
newdata =  data.frame(wt=mtcars$wt, hp=mtcars$hp)
p1=predict(fit3, newdata = newdata, type='response')


(p1 = predict(fit3, newdata = mtcars[c('wt','hp')], type='response'))
(p1= round(p1,2))
(p1a =ifelse(p1 > 0.5, 1, 0))
cbind(mtcars$am, mtcars$wt, mtcars$hp, p1, p1a)
(xtab = table(mtcars$am, p1a))
caret::confusionMatrix(xtab)

df= mtcars
#Manually calc probabilities
calcp = function(df, x1, x2) {
df$y = 18.86 + (0.0362 * df[,x1]) - (8.083 * df[,x2])
df$p = exp(p)/ (1 + exp(p))
#print(p)
#return(y)
}
calcp('df', 'hp','wt')
df
cbind(p1,p2)


d <- data.frame(hp=mtcars$hp, wt=mtcars$wt)
d
testing <- function (d, x1,x2) {
  d$y = 18.86 + (0.0362 * d[[x1]]) - (8.083 * df[[x2]])
  d$p = exp(d$y)/ (1 + exp(d$y))
  #return (d[[p]])
  d$p
}

print (testing(d, 'hp','wt')) 
d
