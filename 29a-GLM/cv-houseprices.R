#CV - houseprices
#Eg1
str(houseprices)
?houseprices
(fit = lm(sale.price ~ ., data=houseprices))
summary(fit)
attr(fit,"ms")

(fit1 <- lm(sale.price ~ area, data=houseprices))
(cv1 <- DAAG::CVlm(houseprices, fit1, plotit=TRUE, m=4))
attr(cv1, "ms")
anova(fit1)
summary(fit1)
(673 + 1849 + 6070 + 6287)/4

(fit2 <- lm(sale.price ~ bedrooms, data=houseprices))
(cv2 <- DAAG::CVlm(houseprices, fit2, plotit=TRUE, m=4))
attr(cv2, "ms")
anova(fit2)
summary(fit2)
(40 + 954 + 2781 + 4563)/4
