
# Coding for Regression Variables
# https://stats.idre.ucla.edu/r/modules/coding-for-categorical-variables-in-regression-models/
# 
hsb2 <- read.csv("https://stats.idre.ucla.edu/stat/data/hsb2.csv")
str(hsb2)

# creating the factor variable
hsb2$race.f <- factor(hsb2$race)
is.factor(hsb2$race.f)
summary(lm(write ~ race.f, data = hsb2))

summary(lm(write ~ factor(race), data = hsb2))


hsb2 <- within(hsb2, {
  race.ct <- C(race.f, treatment)
  print(attributes(race.ct))
})

hsb2 <- within(hsb2, {
  race.ch <- C(race.f, helmert)
  print(attributes(race.ch))
})

summary(lm(write ~ race.ct, data = hsb2))
summary(lm(write ~ race.ch, data = hsb2))

hsb2 <- within(hsb2, {
  race.ch1 <- C(race.f, helmert, 3)
  print(attributes(race.ch1))
})

summary(lm(write ~ race.ch1, data = hsb2))

(a <- contrasts(hsb2$race.f))

(contrasts(hsb2$race.f) <- contr.treatment(4))
summary(lm(write ~ race.f, data = hsb2))

(contrasts(hsb2$race.f) <- contr.treatment(4, base = 2))
summary(lm(write ~ race.f, data = hsb2))

summary(lm(write ~ I(race.f == 1) + I(race.f == 3) + I(race.f == 4), data = hsb2))

(contrasts(hsb2$race.f) <- contr.helmert(4))
summary(lm(write ~ race.f, data = hsb2))
