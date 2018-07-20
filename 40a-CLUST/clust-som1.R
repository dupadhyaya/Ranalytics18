# Creating Self-organising maps in R
#https://www.shanelynn.ie/self-organising-maps-for-customer-segmentation-using-r/


# Load the kohonen package 
require(kohonen)
# Create a training data set (rows are samples, columns are variables
# Here I am selecting a subset of my variables available in "data"
data_train <- data[, c(2,4,5,8)]
# Change the data frame with training data to a matrix
# Also center and scale all variables to give them equal importance during
# the SOM training process. 
data_train_matrix <- as.matrix(scale(data_train))
# Create the SOM Grid - you generally have to specify the size of the 
# training grid prior to training the SOM. Hexagonal and Circular 
# topologies are possible
som_grid <- somgrid(xdim = 20, ydim=20, topo="hexagonal")
# Finally, train the SOM, options for the number of iterations,
# the learning rates, and the neighbourhood are available
som_model <- som(data_train_matrix, 
                 grid=som_grid, 
                 rlen=500, 
                 alpha=c(0.05,0.01), 
                 keep.data = TRUE )

#Training progress for SOM
plot(som_model, type="changes")