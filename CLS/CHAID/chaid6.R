data("BreastCancer", package = "mlbench")
#install.packages("CHAID", repos="http://R-Forge.R-project.org")

library("CHAID")
b_chaid <- chaid(Class ~ Cl.thickness + Cell.size + Cell.shape +
    Marg.adhesion + Epith.c.size + Bare.nuclei +
    Bl.cromatin + Normal.nucleoli + Mitoses, data = BreastCancer)
plot(b_chaid)
