# Decision Tree

library(rpart)
raw.orig <- read.csv(file='E:/dataSets/DM/rsei212_chemical.txt', header=T, sep="\t")
str(raw.orig)
head(raw.orig)
# Keep the dataset small and tidy
# The Dataverse: hdl:1902.1/21235
raw = subset(raw.orig, select=c("Metal","OTW","AirDecay","Koc"))

row.names(raw) = raw.orig$CASNumber
raw = na.omit(raw);
raw
frmla = Metal ~ OTW + AirDecay + Koc

# Metal: Core Metal (CM); Metal (M); Non-Metal (NM); Core Non-Metal (CNM)

fit = rpart(frmla, method="class", data=raw)

printcp(fit) # display the results
plotcp(fit) # visualize cross-validation results
summary(fit) # detailed summary of splits

# plot tree
plot(fit, uniform=TRUE, main="Classification Tree for Chemicals")
text(fit, use.n=TRUE, all=TRUE, cex=.8)

# tabulate some of the data
table(subset(raw, Koc>=190.5)$Metal)

