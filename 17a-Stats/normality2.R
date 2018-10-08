#Normality Test

qqnorm(CO2$uptake)
qqline(CO2$uptake)


ggplot2::qplot(sample=CO2$uptake,
                data=CO2)
ggplot2::qplot(sample=CO2$uptake,
               data=CO2, color=factor(Treatment))

library(car)
car::qqPlot(lm(prestige ~ income + education + type,
               data=Duncan), envelope=.99)


shapiro.test(CO2$uptake)

nortest::ad.test(CO2$uptake)

mvoutlier::aq.plot(CO2[ c('uptake', 'conc')])
mvoutlier::aq.plot(CO2[ c('uptake')])
