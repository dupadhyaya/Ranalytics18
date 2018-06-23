#CHAID on Breast Cancer

data("BreastCancer", package = "mlbench")
#install.packages("CHAID", repos="http://R-Forge.R-project.org")

library("CHAID")
b_chaid <- chaid(Class ~ Cl.thickness + Cell.size + Cell.shape + Marg.adhesion + Epith.c.size + Bare.nuclei + Bl.cromatin + Normal.nucleoli + Mitoses, data = BreastCancer)
plot(b_chaid)
dim(BreastCancer)

attach(BreastCancer)
table(BreastCancer$class, BreastCancer$Cell.size)
table(table(BreastCancer$Cell.size), BreastCancer$class)
table(BreastCancer$Cell.size, BreastCancer$class)
