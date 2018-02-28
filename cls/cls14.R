R Cls4
Sys.getenv("JAVA_HOME")

Sys.setenv(JAVA_HOME="C:\\Program Files\\Java\\jre1.8.0_111")


#Eg1
library(RWeka)
data(iris)
fit <- J48(Species~., data=iris)
summary(fit)
predictions <- predict(fit, iris[,1:4])
table(predictions, iris$Species)
#Eg2
library(RWeka)
data(iris)
fit <- PART(Species~., data=iris)
summary(fit)
predictions <- predict(fit, iris[,1:4])
table(predictions, iris$Species)



# Load the party package. It will automatically load other dependent packages.
library(party)

# Create the input data frame.
input.dat <- readingSkills[c(1:105),]
str(readingSkills)
?readingSkills
# Give the chart file a name.
png(file = "decision_tree.png")

# Create the tree.
output.tree <- ctree(
  nativeSpeaker ~ age + shoeSize + score, 
  data = input.dat)

# Plot the tree.
plot(output.tree)

# Save the file.
dev.off()

??fourier
