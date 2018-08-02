#pca5
#
#R in Action
library(psych)
str(USJudgeRatings)
?USJudgeRatings
head(USJudgeRatings)
fa.parallel(USJudgeRatings[,-1], fa='pc', n.iter=100,
            show.legend = F, main='Scree Plot with Parallel Analysis')
abline(h=1)
(pc = principal(USJudgeRatings[,-1], nfactors = 1))
pc
pc = psych::principal(USJudgeRatings[,-1], nfactors = 1)
pc2 = principal(USJudgeRatings[,-1], nfactors = 2)
pc2

library(psych)
pc2 = principal(Harman23.cor$cov, nfactors=2, rotate='none')
pc2
