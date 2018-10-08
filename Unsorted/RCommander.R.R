
library(abind, pos=18)
library(e1071, pos=19)
numSummary(df2[,"a", drop=FALSE], statistics=c("mean", "sd", "IQR",   "quantiles", "skewness"), quantiles=c(0,.25,.5,.75,1), type="2")

set.seed(52410)
qnorm(c(.4), mean=0, sd=1, lower.tail=TRUE)
summary(df)
with(df2, Hist(excel, groups=course, 
  scale="frequency", breaks="Sturges", col="darkgray", 
  xlab="X", ylab="Y", main="Title"))
local({
  .Table <- xtabs(~city+course, data=df2)
  cat("\nFrequency table:\n")
  print(.Table)
  .Test <- chisq.test(.Table, correct=FALSE)
  print(.Test)
})
local({
  .Table <- xtabs(~gender+hostel+city, data=df2)
  cat("\nFrequency table:\n")
  print(.Table) 
})
Dataset <- 
  read.table("E:/rWork/rdata/Student Attnd Marks.csv", 
  header=TRUE, sep="", na.strings="NA", dec=".", 
  strip.white=TRUE)
Dataset <- read.table("E:/rWork/rdata/dbacs4.csv", 
  header=TRUE, sep="", na.strings="NA", dec=".", 
  strip.white=TRUE)
Dataset <- 
  read.table("E:/rWork/rProjects/dspgmsc2017/data/student.csv",
   header=TRUE, sep="", na.strings="NA", dec=".", 
  strip.white=TRUE)
Dataset <- 
  read.table("E:/rWork/rProjects/dspgmsc2017/data/student.csv",
   header=TRUE, sep="", na.strings="NA", dec=".", 
  strip.white=TRUE)
summary(student)
local({
  .Table <- xtabs(~batch+city, data=student)
  cat("\nFrequency table:\n")
  print(.Table)
  .Test <- chisq.test(.Table, correct=FALSE)
  print(.Test)
})
local({
  .Table <- with(student, table(gender))
  cat("\ncounts:\n")
  print(.Table)
  cat("\npercentages:\n")
  print(round(100*.Table/sum(.Table), 2))
})
sapply(student, function(x)(sum(is.na(x)))) 
  # NA counts
cor(student[,c("cbnst","cgpa")], use="complete")
normalityTest(~java, test="shapiro.test", 
  data=student)
with(student, (t.test(age, alternative='less', mu=30, 
  conf.level=.95)))

