
outlook =c('Sunny', 'Sunny', 'Overcast', 'Rain','Rain', 'Rain','Overcast', 'Sunny', 'Sunny','Rain','Sunny', 'Overcast','Overcast','Rain')
temperature = c( 'Hot','Hot','Hot','Mild','Cool','Cool','Cool','Mild','Cool','Mild','Mild','Mild','Hot','Mild')
humidity = c('Weak','Strong','Weak','Weak','Weak','Strong','Strong','Weak','Weak','Weak','Strong','Strong','Weak','Strong')
wind = c( 'High','High','High','High','Normal','Normal','Normal','High','Normal','Normal','Normal','High','Normal','High')
play = c('No','No','Yes','Yes','Yes','No','Yes','No','Yes','Yes','Yes','Yes','Yes','No')

game = data.frame(outlook, temperature, humidity, wind, play)
head(game)

library(rpart)
library(rpart.plot)
dt_game1 = rpart(play ~ . , data=game) 
dt_game1
#no tree 
#cp=-1

dt_game2 = rpart(play ~ . , data=game, control=rpart.control(cp = -1, minsplit=1, minbucket = 1))
dt_game2
rpart.plot(dt_game2,cex=.8, nn=T)

#make tree smaller
dt_game3 = rpart(play ~ . , data=game, control=rpart.control(cp = -1, minsplit=3, minbucket = 2, split = "gini"))
dt_game3
rpart.plot(dt_game3,cex=.8, nn=T)

?rpart

#make tree smaller
dt_game3 = rpart(play ~ . , data=game, control=rpart.control(cp = -1, minsplit=3, minbucket = 2, split = "information"))
dt_game3
attributes(dt_game3)
rpart.plot(dt_game3,cex=.8, nn=T)
dt_game3$parms
dt_game3$variable.importance
dt_game3$method
dt_game3$cptable
dt_game3$control
dt_game3$splits
dt_game3$numresp
dt_game3$y
game$play
dt_game3$ordered




