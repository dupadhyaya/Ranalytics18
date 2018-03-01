# Classification : Dataset - readingSkills
?readingSkills
head(readingSkills)
library(party)
str(readingSkills)
readingSkills

# Create the input data frame.
input.dat <- readingSkills[c(1:105),]
?readingSkills

# Give the chart file a name.
#png(file = "decision_tree.png")

# Create the tree.
output.tree <- ctree( nativeSpeaker ~ age + shoeSize + score,  data = input.dat)
output.tree

# Plot the tree.
plot(output.tree)

# Save the file.
#dev.off()

