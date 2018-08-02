# CV using women dataset

women

mydata=women

(fit1 = lm(weight ~ height, data=mydata))
summary(fit1)
(RSS <- c(crossprod(fit1$residuals)))
(MSE <- RSS / length(fit1$residuals))
(RMSE <- sqrt(MSE))
(sig2 <- RSS / fit1$df.residual)
predict(fit1)
library(DAAG)
(fit1 = lm(weight ~ height, data=mydata))

(cvfit1 = DAAG::CVlm(data=mydata, form.lm=lm(weight ~ height,
              data=mydata), m=3, plotit="Observed" ))
predict(fit1)
attributes(cvfit1a)
(76.9 + 8.29 + 15.9)/15

cvfit1a$cvpred
women$height #58 59 60 61 62 63 64 65 66 67 68 69 70 71 72
women$weight #115 117 120 123 126 129 132 135 139 142 146 150 154 159 164


# Model2

(fit2 = lm(weight ~ I(height^2), data=mydata))
summary(fit2)

(RSS <- c(crossprod(fit2$residuals)))
(MSE <- RSS / length(fit2$residuals))
(RMSE <- sqrt(MSE))
(sig2 <- RSS / fit2$df.residual)
predict(fit2)
library(DAAG)

(fit2 = lm(weight ~ I(height^2), data=mydata))
summary(fit2)
#(cvfit2a = DAAG::CVlm(data=mydata, form.lm=fit2 ))
(cvfit2a = DAAG::CVlm(data=mydata, form.lm=lm(weight ~ height + I(height^2), data=mydata),m=3, dots = TRUE, seed=29, plotit=TRUE, printit=TRUE))
(cvfit2a = DAAG::CVlm(data=mydata, form.lm=fit2, dots = TRUE, seed=29, plotit=TRUE, printit=TRUE))


(15.4 + 1.66 + 3.88 )/3
summary(cvfit2a)
cvfit2a$cvpred


s1 = caTools::sample.split(mydata, SplitRatio = .75)
s1
df=mydata
stopifnot(nrow(df) %% N == 0)
df    <- df[order(runif(nrow(df))), ]
bins  <- rep(1:N, nrow(df) / N)
split(df, bins)
N= nrow(df)
split(df, sample(1:N, nrow(df), replace=T))


n <- 3
nr <- nrow(df)
nr
split1 = split(df, rep(1:ceiling(nr/n), each=n, length.out=nr))
split1
split1$`1`
(fit1 = lm(weight ~ height, data=split1$`1`))
summary(fit1)


CVres1= c(-0.154, 1.9,2.8, 4.69, 6.59)
CVres1^2
sum(CVres1^2)
sum(CVres1^2)/5

