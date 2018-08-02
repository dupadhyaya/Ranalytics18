# pca
?USJudgeRatings
str(USJudgeRatings)

#Eg1
library(psych)
?fa.parallel
fa.parallel(USJudgeRatings[,-1], fa="pc", n.iter=100,  
            show.legend=FALSE, main="Scree plot with parallel analysis")
abline(h=1)
text(6,1.2, "EV > 1")
text(4,10, label='Obsereved EVs straight line segments and x-x-x', cex=.85)
text(3,2,'Mean EVs derived from 100 random data matrices -- line', cex=.85,
     col='red')

?text

?principal
library(psych)
pc = principal(USJudgeRatings[ , -1], nfactors=1)
pc

#2
fa.parallel(Harman23.cor$cov, n.obs=302, fa='pc',
            n.iter=100, show.legend=F, main='Scree plot with
            Parallel Analysis')
pc = principal(Harman23.cor$cov,
               nfactors=2, rotate='none')
pc

rc = principal ( Harman23.cor$cov,
                 nfactors=2, rotate= 'varimax')
rc


pc = principal(USJudgeRatings[,-1], nfactors=1, score=T )
pc
head(pc$scores)
cor(USJudgeRatings$CONT, pc$score)

rc = principal(Harman23.cor$cov,
               nfactors=2, rotate='varimax')
rc
round(unclass(rc$weights),2)
rownames(rc$weights)
print(paste(round(rc$weights[,1],2),rownames(rc$weights), sep=' * ', collapse=' + '), quote=F)

print(paste(round(rc$weights[,2],2),rownames(rc$weights), sep=' * ', collapse=' + '), quote=F)


