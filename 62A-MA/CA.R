#Perceptual Maps
#http://www.sthda.com/english/articles/31-principal-component-methods-in-r-practical-guide/113-ca-correspondence-analysis-in-r-essentials/

library("FactoMineR")
library("factoextra")
data(housetasks)
head(housetasks)
housetasks

library("gplots")
# 1. convert the data as a table
dt <- as.table(as.matrix(housetasks))
# 2. Graph
balloonplot(t(dt), main ="housetasks", xlab ="", ylab="",
            label = FALSE, show.margins = FALSE)

chisq <- chisq.test(housetasks)
chisq

#CA(X, ncp = 5, graph = TRUE)

library("FactoMineR")
res.ca <- CA(housetasks, graph = FALSE)

print(res.ca)

# Chi-square statistics
chi2 <- 1944.456
# Degree of freedom
df <- (nrow(housetasks) - 1) * (ncol(housetasks) - 1)
# P-value
pval <- pchisq(chi2, df = df, lower.tail = FALSE)
pval

library("factoextra")
eig.val <- get_eigenvalue(res.ca)
eig.val

fviz_screeplot(res.ca, addlabels = TRUE, ylim = c(0, 50))

fviz_screeplot(res.ca) +
  geom_hline(yintercept=33.33, linetype=2, color="red")

# repel= TRUE to avoid text overlapping (slow if many point)
fviz_ca_biplot(res.ca, repel = T)

fviz_ca_row(res.ca, col.row="steelblue", shape.row = 15)

# Color by cos2 values: quality on the factor map
fviz_ca_row(res.ca, col.row = "cos2",
            gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"), 
            repel = TRUE)
