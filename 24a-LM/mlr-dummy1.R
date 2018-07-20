# Dummy Variables in Regression

value = c(84.4,77.4,75.7,85.9,79.1,70.4,75.8,85.9,78.5,79.2,86.7,79.3,74.5,83.8,76.8)
area = c(2.00,1.71,1.45,1.76,1.93,1.20,1.55,1.93,1.59,1.50,1.90,1.39,1.54,1.89,1.59)
fireplace= c('Yes','No','No','Yes','No','Yes','Yes','Yes','Yes','Yes','Yes','Yes','No','Yes','No')

fireplace = factor(fireplace)
house = data.frame(value, area, fireplace)
str(house)

mlrhouse1 = lm(value ~ area + fireplace, data=house)
summary(mlrhouse1)

#Equation : value = 50 + 16.1 * area + 3.85 * 1 : for fireplace
#Equation : value = 16.1 * area  : for no fireplace

head(house)
predict(mlrhouse1, newdata=head(house), predict='response')

(value1 = 50 + 16.1 * 2 + 1 * 1)  # Fireplace
(value2 = 50 + 16.1 * 1.71 )   #no fireplace
