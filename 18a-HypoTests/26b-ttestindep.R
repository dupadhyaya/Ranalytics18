#t-test Independent : Difference Between Means
#two-sample t-test

#links
#http://www.sthda.com/english/wiki/unpaired-two-samples-t-test-in-r#r-function-to-compute-unpaired-two-samples-t-test
#https://ww2.coastal.edu/kingw/statistics/R-tutorials/independent-t.html
#http://www.r-tutor.com/elementary-statistics/inference-about-two-populations/population-mean-between-two-independent-samples


#Criteria
#simple random sampling.
#The samples are independent.
#Each population is at least 20 times larger than its respective sample.
#The sampling distribution is approximately normal, which is generally the case if any of the following conditions apply.
#   The population distribution is normal.
#   The population data are symmetric, unimodal, without outliers, and the sample size is 15 or less.
#   The population data are slightly skewed, unimodal, without outliers, and the sample size is 16 to 40.
#   The sample size is greater than 40, without outliers.

#http://stattrek.com/hypothesis-test/difference-in-means.aspx?Tutorial=AP
#Hypothesis #H0: μ1 = μ2 Ha: μ1 ≠ μ2
(class1 = sample(60:100,25))
(class2 = sample(60:100,30))

#determine whether the difference between means found in the sample is significantly 
#different from the hypothesized difference between means ?t.test
#t.test(x, y ,  alternative = c("two.sided", "less", "greater"),  mu = 0, paired = FALSE, var.equal = FALSE, conf.level = 0.95, ...)

(ttest2s1 = t.test(x=class1, y=class2))

ttest2s1$statistic ; ttest2s1$p.value ;ttest2s1$conf.int
names(ttest2s1)

(n1 = length(class1)); (n2=length(class2))
qt(1-.05/2,df=min(n1,n2))

#Equal Variance
(ttest2s1 = t.test(x=class1, y=class2, var.equal = T))

#Unequal Variance
(ttest2s1 = t.test(x=class1, y=class2, var.equal = F))


# Smokers
nonsmokers = c(18,22,21,17,20,17,23,20,22,21)
smokers = c(16,20,14,21,20,18,13,15,17,21)

#sample size < 30
t.test(nonsmokers,smokers) # 2 sample
t.test(nonsmokers, mu=20)  #1 sample
(n1 = length(nonsmokers))
(n2 = length(smokers))
dfs = n1 + n2 -2 
qt(1-.05/2,df=dfs)
qt(.05/2,df=dfs)
t.test(nonsmokers,smokers)
#2.5 > absolute(2.1)
# t calc > t-table : pval < 0.03 : Reject Ho
# Diff in means != 0

par(mfrow=c(1,2))               # set graphics window to plot side by side
plot(density(nonsmokers), main="nonsmokers")
plot(density(smokers), main="smokers")
par(mfrow=c(1,1))
boxplot(nonsmokers, smokers, ylab="Scores on Digit Span Task",     # plot and label y-axis
        names=c("nonsmokers","smokers"),                           # group names on x-axis
        main="Digit Span Performance by\n Smoking Status")         # main title

# 1 Tail, Equal variance
t.test(nonsmokers, smokers, alternative="greater", var.equal=T)


# Formula Method
scores = c(nonsmokers, smokers)
groups = c("nonsmokers","smokers")        # Make sure these are in the right order!
groups = rep(groups, times=c(10,10))      # 10 nonsmokers, 10 smokers
mj.data = data.frame(groups, scores)
mj.data
by(scores, groups, mean)
boxplot(scores ~ groups)     
t.test(scores ~ groups, data=mj.data) 

#
wilcox.test(nonsmokers, smokers)

# One Tail Tests ---------
#Null hypothesis: μ1 - μ2 >= 7 
#Alternative hypothesis: μ1 - μ2 < 7
