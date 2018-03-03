#Classification - Decision Trees - Distances

play = read.csv('./data/clsplay.csv', row.names=1)
credit = read.csv('./data/clscredit.csv')
play
str(play)
credit
names(play)
# Case-1 : Play
library(party) 
ctc = ctree_control(minsplit = 1, minbucket = 1)
treeplay <- ctree(play ~ outlook + temperature + humidity + wind, data = play,controls = ctc )

?ctree
treeplay
plot(treeplay)
predict(treeplay, )

table(predict(treeplay), play$play)
table(predict(iris_tree), trainData$Species)

#working Example
ls <- data.frame(y = gl(3, 50, labels = c("A", "B", "C")),
      x1 = rnorm(150) + rep(c(1, 0, 0), c(50, 50, 50)),
       x2 = runif(150))
ls
names(ls)
ct= ctree(y ~ x1 + x2, data = ls)
plot(ct)
predict(ct, ls)  #predict for training data
predict(ct, newdata = ls[c(1, 51, 101),], type = "prob")
predict(ct, newdata = ls[c(1, 51, 101),], type = "response")
predict(ct, newdata = ls[c(1, 51, 101),], type = "node")


data("airquality", package = "datasets")
airq <- subset(airquality, !is.na(Ozone))
(airctparty <- party::ctree(Ozone ~ ., data = airq,
   controls = party::ctree_control(maxsurrogate = 3)))
plot(airctparty)
mean((airq$Ozone - predict(airctparty))^2)
?ctree
