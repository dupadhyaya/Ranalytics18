# Classification - ID3 
#https://cis.temple.edu/~giorgio/cis587/readings/id3-c45.html

# basic ideas behind ID3 are that:
# In the decision tree each node corresponds to a non-categorical attribute and each arc to a possible value of that attribute. A leaf of the tree specifies the expected value of the categorical attribute for the records described by the path from the root to that leaf. [This defines what is a Decision Tree.]
# In the decision tree at each node should be associated the non-categorical attribute which is most informative among the attributes not yet considered in the path from the root. [This establishes what is a "Good" decision tree.]
# Entropy is used to measure how informative is a node. [This defines what we mean by "Good". By the way, this notion was introduced by Claude Shannon in Information Theory.]
#C4.5 is an extension of ID3 that accounts for unavailable values, continuous attribute value ranges, pruning of decision trees, rule derivation, and so on.

library(data.tree)

# http://r.789695.n4.nabble.com/Is-there-an-ID3-implementation-in-R-td4696375.html

## load RWeka 

Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre1.8.0_111\\bin') # for 64-bit version

system("java -version")
# This is important.. Use rJava Home instead of Windows Home
if(Sys.getenv("JAVA_HOME")!=""){
  Sys.setenv(JAVA_HOME="")
}
library(rJava)
library("RWekajars")
library(RWeka)  # needs rJava
## look for a package providing id3 
WPM("refresh-cache") 
WPM("list-packages", "available") ## look for id3 
## install package providing id3 
WPM("install-package", "simpleEducationalLearningSchemes") 
## load the package 
WPM("load-package", "simpleEducationalLearningSchemes") 
## make classifier 
ID3 <- make_Weka_classifier("weka/classifiers/trees/Id3") 
## test it out. 
DF2 <- read.arff(system.file("arff", "contact-lenses.arff", package = "RWeka")) 
.jinit(".")
str(DF2)
ID3(`contact-lenses` ~ ., data = DF2) 

WPM("load-package", "Decorate") 
make_Weka_classifier("Decorate") 
WPM("load-package", "naiveBayesTree")

print(.jclassPath())
