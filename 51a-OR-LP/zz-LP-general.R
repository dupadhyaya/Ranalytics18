#https://github.com/rewyllys/LinearOptimizationUsingR/blob/master/SolvingLinOptProbsUsinglpSolveAPI.doc

Example 1:  A Simple Airline Optimization Problem 
The first example (Video 1 of Part 1 of Unit 8) is called the "AirlineSimple" situation and is presented as follows:
  "To illustrate how linear optimization works in revenue management, let us consider a simple example:  a flight from New York to Los Angeles.  In this flight, there are two types of economy fares:  Early Bird [i.e., discount] fares that cost $238, and Last Minute [i.e., regular] fares that cost $617.
"In this flight, a Boeing 757 is used that has 166 economy seats.  Demand for these prices has been forecasted using analytics tools, looking at historical data and incorporating models like time series or linear regression.  Clearly, forecasts have errors, and therefore, we need to assess the sensitivity of our decisions to these errors.
"To illustrate the use of linear optimization, we assume that demand has already been forecasted.  We'll illustrate how our decisions on how many discount seats to sell vary as the demand forecasts vary.  If the demand for regular seats is 50, and for discounted fares is 150, and the capacity is 166 seats, then the optimal allocation is going to be to sell the 50 seats to satisfy the regular demand, and then we allocate the remaining 116 seats to the discounted fare class.  If the regular demand increases to 100 seats, then we allocate these 100 seats to these customers, and only 66 seats to discounted fare customers.  Finally, if the regular demand increases to 200, then we allocate all of our capacity, 166 seats, to these customers.  While this seems simple, what happens if we have 100 flights with connections in tens of fares?"
Part 1 of Unit 8 of "The Analytics Edge" has thus set up the objective in this problem as being the maximization of revenue from selling seats on this flight at either the Regular Fare, $617, or the Discount Fare, $238.  The key to seeing what variables are involved in a linear optimization problem is to examine the function that encapsulates the objective; this function must involve the variables whose values are to be determined in such a way as to optimize (to maximize, in this case, or in other cases, to minimize) the whole objective function.
In this first example, there are two variables in the objective function:  the number of seats to be sold at $617 and the number to be sold at $238.  If we represent the number of seats to be sold at the Regular Fare as xR and the number to be sold at the Discount Fare as xD, then the objective function to be maximized can be written as:
  617*xR + 238*xD
There are three constraints. One of them is that the aircraft used has 166 seats.  The other two are that the airline forecasts the demand for Regular seats as 100 and the demand for Discount seats as 150 on a typical instance of the flight.  These constraints can be written as shown next.  Note that in writing out each constraint it is important to include all the variables, even if the coefficient of one or more of them is 0 in a particular constraint.
1*xR + 1*xD <=  166
1*xR + 0*xD <=  100
0*xR + 1*xD <=  150
We see that there are three constraints, and that each involves the two variables in the objective.  The interpretation of these considerations in lpSolveAPI is that we need, first, to define a model along the following lines:
  AirlineSimple <-  make.lp(3,2)
Further, the constraints must be entered into the model as columns in an array.  In this example there are two variables, so the array has two columns.  In lpSolveAPI, these two columns are entered as shown next:
  set.column(AirlineSimple, 1, c(1, 1, 0))
set.column(AirlineSimple, 2, c(1, 0, 1))
The inequalities are handled as follows:
  set.constr.type(AirlineSimple, c("<=", "<=", "<="))
set.rhs(AirlineSimple, c(166, 100, 150))
The objective is entered into the model as follows:
  set.objfn(AirlineSimple, c(617, 238))
Since the default sense of what is to be done with the objective function is, in lpSolveAPI, to minimize it, we need to specify that here the objective is to be maximized:
  lp.control(AirlineSimple, sense="max")
When we have reached this point in constructing our model, it can be helpful to have lpSolveAPI print out its understanding of the model.  To do this, we simply issue, at the R prompt, the name of the model, which in this case is "AirlineSimple".
AirlineSimple
Here is what the AirlineSimple model looks like when the steps being detailed here are actually run in R:
  Model name: 
  C1    C2         
Maximize   617   238         
R1           1     1  <=  166
R2           1     0  <=  100
R3           0     1  <=  150
Kind       Std   Std         
Type      Real  Real         
Upper      Inf   Inf         
Lower        0     0         

If the printed-out model looks like what we intended it to be, we are ready to tell lpSolveAPI to solve the problem:
  solve(AirlineSimple)
This instruction will return the value 0 if lpSolvAPI is able to find a solution.  To see the details of the solution and the value of the objective, we issue the following commands:
  get.objective(AirlineSimple)
get.variables(AirlineSimple)
The script provided by "The Analytics Edge" concludes by saying that the objective value turns out to be $77,408, and that the optimal values of the variables turn out to be:  xR = 100 and xD = 66.
Below, between the two long rows of ###s, is the script provided in "The Analytics Edge".  (As you might expect, in R scripts any line beginning with # is not executed by R.)
My recommendation on how to run this script is to open, on your computer, a copy of RStudio, which is my favorite open-source GUI for using R.  You can obtain a free copy of RStudio from
http://www.rstudio.com/
  To use this script, you should: (i) copy and paste it into the upper left-hand portion of the RStudio window; and then (ii) select the entire script and click on the button labelled "Run" in the menu bar of this upper left-hand portion.
####################################################################################
#             R Script for the AirlineSimple Problem  

# The following is the R script as provided in Part 1 of Unit 8 of 
# "The Analytics Edge".

# In this script file, we show how the airline revenue management 
# problems discussed in this lecture [i.e., in the videos in the 
# Airline Revenue Management section (Part 1) of Unit 8 of "The 
# Analytics Edge"] can be solved in R using the "lpSolveAPI" package.
# This package allows you to solve linear optimization problems in 
# R using the lp_solve library, which is an open-source 
# optimization solver.

# If you are solving larger and more complex optimization problems,
# lp_solve might not be powerful enough to solve your problems. There 
# are other optimization packages available in R that rely on commercial
# solvers, such as cplexAPI and Rcplex. For more information, see the
# CRAN Optimization page: 
# http://cran.us.r-project.org/web/views/Optimization.html

# First, you need to install and load the lpSolveAPI package

install.packages("lpSolveAPI")
library(lpSolveAPI)

# Now let's start by solving the simple airline problem with just 
# two decision variables: the number of regular seats to offer, and 
# the number of discount seats to offer. 

# The first step is to create a model, which takes as arguments the
# number of constraints in your model, and the number of decision
# variables in your model. We have three constraints (one capacity
# constraint and two demand constraints) and two decision variables.

AirlineSimple = make.lp(3,2)

# Now we need to set up the constraints and objective. The best way to 
# do this using the lpSolveAPI package is by viewing the constraints in
# a matrix format. Our objective and three constraints are as follows:
# max         617*R + 238*D
# subject to    1*R +   1*D <= 166
#               1*R +   0*D <= 100
#               0*R +   1*D <= 150	

# So the first column in our constraint matrix is c(1,1,0), and the
# second column in our constraint matrix is c(1,0,1). We also need to
# indicate that these are less-than-or-equal constraints, and set the
# right-hand-side values to c(166,100,150):

set.column(AirlineSimple, 1, c(1,1,0))
set.column(AirlineSimple, 2, c(1,0,1))
set.constr.type(AirlineSimple, c("<=","<=","<="))
set.rhs(AirlineSimple, c(166,100,150))

# And our objective coefficients are c(617,238):

set.objfn(AirlineSimple, c(617,238))

# The default setting is minimize for the objective, so we need to 
# tell R that we are maximizing our objective:

lp.control(AirlineSimple,sense='max')

# If we want to take a look at our model, we can just type:

AirlineSimple

# You should see that there is a row called "Lower" in the model 
# output -- the values of zero indicate that our decision variables 
# are constrained to be non-negative, which is the default setting.
# If you want to change the lower or upper bounds for a decision
# variable, you can do so with the set.bounds function. (Next week 
# we will learn about integer and binary decision variables -- to 
# change a decision variable to one of these types, you can use 
# the set.type function.)

# Now we are ready to solve our model:

solve(AirlineSimple)

# An output of zero means that the model was successfully solved. 
# You can look at the optimal objective function value or optimal
# decision variable values with get.objective and get.variables:

get.objective(AirlineSimple)
get.variables(AirlineSimple)

# You should get an objective value of 77408 and decision variable values of 100 and 66, just as we did in the lecture.

#########################################################################

Example 2:  An Airline Optimization Problem that Includes Connecting Flights

Video 7 of Part 1 of Unit 8 of "The Analytics Edge" introduces a more complex problem, that of optimizing the revenue from a flight that includes an intermediate destination.  Tickets for this flight are sold for the entire flight (viz., from airport 1 to airport 3), or for either of two shorter flights:  to or from the intermediate destination (viz., from airport 1 to airport 2, or from airport 2 to airport 3).  

Here is what the transcript of Video 7 says about this more complex situation:
  
  "So far, we've only considered optimizing the fares for a single route.  In this video, we'll change our optimization formulation to include connecting flights.  Now, instead of just being able to go from JFK in New York to LAX in Los Angeles, let's suppose that the plane stops in Dallas at the Dallas Fort Worth airport.  We still are just using one plane, but the passengers can now fly from New York to Dallas, Dallas to Los Angeles, or from New York to Los Angeles by just staying on the plane in Dallas.

"So how does our optimization problem change?  We now have six types of seats that we can offer: the original two types, regular and discount from New York to LA, and four new types.  We can sell both regular and discount seats from New York to Dallas, and regular and discount seats from Dallas to Los Angeles.  We know the price of each type of ticket as well as the forecasted demand for each type of ticket.  

"We also know that we have a capacity of 166 seats on our plane for each leg of the trip.  There's room for 166 passengers on the plane from New York to Dallas, or the first leg of the trip.  Then the passengers with a final destination of Dallas will get off the plane and the passengers flying from Dallas to LA will get on the plane.  On the second leg of the trip, flying from Dallas to LA, we also have a capacity of 166 seats.  So we need to remember that the passengers flying from New York to LA will take up capacity on both legs of the trip, while the other types of passengers will take up capacity on only one leg of the trip.

"What are our decisions now?  They're the number of regular tickets to sell for each type, and the number of discount tickets to sell for each type.  So in total, we have six decisions to make.  Now, let's define our objective.  As before, it's to maximize the total revenue.  This is the sum of the price of the ticket times the number of seats of that type we sell, for each type of ticket.  And as before, we have two types of constraints:  capacity constraints and demand constraints.

"For the capacity constraints, the airline shouldn't sell more seats than the capacity of the plane, for each leg of the trip.  So we need two capacity constraints here: one for the New York to Dallas leg and one for the Dallas to LA leg.  Note that the New York to LA passengers have to be counted on both legs of the trip.  So the first constraint accounts for all passengers that need to be on the plane when it flies from New York to Dallas, and the second constraint accounts for all passengers that need to be on the plane when it flies from Dallas to LA.  

"We also need six demand constraints, one for each type of ticket.  The number of seats sold should not exceed the forecasted demand for each type.  And last, we can't sell a negative number of seats, so we have our non-negativity constraints to prevent the variables from being negative." 

The remainder of the discussion of this problem, the AirlineConnecting problem, is essentially as presented in a script provided in the course, "The Analytics Edge".   In the hope of contributing additional clarity and understanding, I have changed the names of the variables and added comments in various places.

The situation in this problem is that there are two classes of tickets, and each class can be sold for any of 3 different flights.  Thus, there are six variables to be considered.  We can denote these variables as follows:  xRjl represents a Regular fare from JFK to LAX; xDjl represents a Discount fare from JFK to LAX; xRjd represents a Regular fare from JFK to DFW; xDjd represents a Discount fare from JFK to DFW; xRdl represents a Regular fare from DFW to LAX; and xDdl represents a Discount fare from DFW to LAX.

The objective is to maximize the revenue from this function:
  
  428*xRjl  + 190*xDjl + 642*xRjd + 224*xDjd + 512*xRdl + 190*xDdl

From additional information provided in the statement of the problem in "The Analytics Edge", we have the following forecasts of demand: for Regular seats from JFK to LAX, 80; for Discount seats from JFK to LAX, 120;  for Regular seats from JFK to DFW, 75; for Discount seats from JFK to DFW, 100;  for Regular seats from DFW to LAX, 60; and for Discount seats from DFW to LAX, 110.

The constraints can be shown as follows: 
  
  legs 1 & 2          leg 1 only          leg 2 only
col 1       col 2       col 3        col 4       col 5        col 6        RHS
subject to   1*xRjl + 1*xDjl + 1*xRjd + 1*xDjd +0*xRdl + 0*xDdl  <=  166			
1*xRjl + 1*xDjl + 0*xRjd + 0*xDjd +1*xRdl + 1*xDdl  <=  166             
1*xRjl + 0*xDjl + 0*xRjd + 0*xDjd +0*xRdl + 0*xDdl  <=    80
0*xRjl + 1*xDjl + 0*xRjd + 0*xDjd +0*xRdl + 0*xDdl  <=  120
0*xRjl + 0*xDjl + 1*xRjd + 0*xDjd +0*xRdl + 0*xDdl  <=    75
0*xRjl + 0*xDjl + 0*xRjd + 1*xDjd +0*xRdl + 0*xDdl  <=  100
0*xRjl + 0*xDjl + 0*xRjd + 0*xDjd +1*xRdl + 0*xDdl  <=    60
0*xRjl + 0*xDjl + 0*xRjd + 0*xDjd +0*xRdl + 1*xDdl  <=  110

This list of constraints makes it clear that the AirlineConnecting model needs to have 8 rows and 6 columns.  To build this model using lpSolveAPI, we issue the following command in R;

AirlineConnecting = make.lp(8,6)

To detail the columns of this model using lpSolveAPI, we issue the following commands:
  
  set.columns(AirlineConnecting, 1, c(1,1,1,0,0,0,0,0))
set.columns(AirlineConnecting, 2, c(1,1,0,1,0,0,0,0))
set.columns(AirlineConnecting, 3, c(1,0,0,0,1,0,0,0))
set.columns(AirlineConnecting, 4, c(1,0,0,0,0,1,0,0))
set.columns(AirlineConnecting, 5, c(0,1,0,0,0,0,1,0))
set.columns(AirlineConnecting, 6, c(0,1,0,0,0,0,0,1))
set.constr.type(AirlineConnecting, rep("<=",8))
set.rhs(AirlineConnecting, c(166,166,80,120,75,100,60,110))

For the remaining steps in setting up the AirlineConnecting model, we issue:
  
  set.objfn(AirlineConnecting, c(428,190,642,224,512,190))
lp.control(AirlineConnecting, sense="max")

To check on the model we have created, we can type AirlineConnecting.

Airline Connecting

Here is how the model should look:
  Model name: 
  C1    C2    C3    C4    C5    C6         
Maximize   428   190   642   224   512   190         
R1           1     1     1     1     0     0  <=  166
R2           1     1     0     0     1     1  <=  166
R3           1     0     0     0     0     0  <=   80
R4           0     1     0     0     0     0  <=  120
R5           0     0     1     0     0     0  <=   75
R6           0     0     0     1     0     0  <=  100
R7           0     0     0     0     1     0  <=   60
R8           0     0     0     0     0     1  <=  110
Kind       Std   Std   Std   Std   Std   Std         
Type      Real  Real  Real  Real  Real  Real         You should get an objective function value of 120514 and decision variable values of 80, 0, 75, 11, 60, 26. 
Upper      Inf   Inf   Inf   Inf   Inf   Inf         
Lower        0     0     0     0     0     0  

The remaining steps are to issue the following commands:
  
  solve(AirlineConnecting)
get.objective(AirlineConnecting)
get.variables(AirlineConnecting)

You should get an objective function value of $120,514 and decision variable values of 80, 0, 75, 11, 60, 26. 

Below, between the two long rows of ###s, is the script provided in "The Analytics Edge" for the AirlineConnecting problem.
########################################################################

# The following commands set up and solve the more sophisticated airline
# problem with six decision variables.

# First, you need to install and load the lpSolveAPI package:

install.packages("lpSolveAPI")
library(lpSolveAPI)

# We can distinguish the three different trips as: JFK-LAX, "jl"; 
# JFK-DFW, "jd"; and DFW-LAX, "dl".
# The objective to be maximized is: 
# 428*Rjl + 190*Djl + 642*Rjd + 224*Djd + 512*Rdl + 190*Ddl

# legs 1 & 2 leg 1 only leg 2 only
# col 1 col 2 col 3 col 4 col 5 col 6 RHS
# subject to 1*Rjl + 1*Djl + 1*Rjd + 1*Djd +0*Rdl + 0*Ddl <= 166 
# 1*Rjl + 1*Djl + 0*Rjd + 0*Djd +1*Rdl + 1*Ddl <= 166 
# 1*Rjl + 0*Djl + 0*Rjd + 0*Djd +0*Rdl + 0*Ddl <= 80
# 0*Rjl + 1*Djl + 0*Rjd + 0*Djd +0*Rdl + 0*Ddl <= 120
# 0*Rjl + 0*Djl + 1*Rjd + 0*Djd +0*Rdl + 0*Ddl <= 75
# 0*Rjl + 0*Djl + 0*Rjd + 1*Djd +0*Rdl + 0*Ddl <= 100
# 0*Rjl + 0*Djl + 0*Rjd + 0*Djd +1*Rdl + 0*Ddl <= 60
# 0*Rjl + 0*Djl + 0*Rjd + 0*Djd +0*Rdl + 1*Ddl <= 110

AirlineConnecting = make.lp(8,6)

set.column(AirlineConnecting, 1, c(1,1,1,0,0,0,0,0))
set.column(AirlineConnecting, 2, c(1,1,0,1,0,0,0,0))
set.column(AirlineConnecting, 3, c(1,0,0,0,1,0,0,0))
set.column(AirlineConnecting, 4, c(1,0,0,0,0,1,0,0))
set.column(AirlineConnecting, 5, c(0,1,0,0,0,0,1,0))
set.column(AirlineConnecting, 6, c(0,1,0,0,0,0,0,1))
set.constr.type(AirlineConnecting, rep("<=",8))
set.rhs(AirlineConnecting, c(166,166,80,120,75,100,60,110))

set.objfn(AirlineConnecting, c(428,190,642,224,512,190))
lp.control(AirlineConnecting,sense='max')

# To check on the model we have created, type AirlineConnecting.

AirlineConnecting

solve(AirlineConnecting)
get.objective(AirlineConnecting)
get.variables(AirlineConnecting)

# You should get an objective function value of 120514 and 
# decision variable values of 80, 0, 75, 11, 60, 26.

# For additional examples, we direct you to the lpSolveAPI User's Guide:
# http://www.icesi.edu.co/CRAN/web/packages/lpSolveAPI/vignettes/lpSolveAPI.pdf

###########################################################################

Example 3:  A Problem Involving the Optimization of Beamlets of Radioactivity to Attack                  	              Cancerous Tumors
Part 2 of Unit 8 of "The Analytics Edge" deals with the optimizing the administration of radiation therapy treatments for cancer patients.  The transcript of Video 1 of Part 2 of Unit 8 says in part:
  "Cancer can be treated using radiation therapy, where beams of high-energy photons are fired into the patient to kill cancerous cells.  This is a very common form of treatment for many types of cancers, and in the United States, about half of all cancer patients undergo some form of radiation therapy.  Radiation therapy has a history going back to the late 1800s.  X-rays were discovered by Wilhelm Rontgen in 1895, who was later awarded the first Nobel Prize in Physics.  Shortly after the discovery, X-rays started being used to treat skin cancers.  This image shows an x-ray of Rontgen's wife's hand.  You can see the bones in her hand as well as her wedding ring on her finger.  A few years later in 1898, radium was discovered by Marie and Pierre Curie.  They won the Nobel Prize for this discovery in 1911.  Radium started being used to treat cancer, as well as other diseases.  
"Later in the 1900s, the first radiation delivery machines, called linear accelerators, were developed.  Then computed tomography, or CT scans, were invented in 1971.  These discoveries led to the invention of Intensity Modulated Radiation Therapy, or IMRT, in the early 1980s.  The invention of IMRT significantly improved the ability of radiation therapy to target cancerous cells.  
"To reach the tumor, radiation passes through healthy tissue and therefore damages both healthy and cancerous tissue.  This damage to healthy tissue can lead to undesirable side effects that reduce post-treatment quality of life.  For example, blistering and burning of skin can occur because of the damage to healthy skin cells.  For this reason, we want the dose to fit the tumor as closely as possible to reduce the dose to healthy tissue.  This became possible with the invention of IMRT.  In IMRT, the intensity profile of each beam is non-uniform.  Before IMRT, each beam had to have the same intensity, so the tumor could not be targeted very well.  But by using non-uniform intensity profiles, the radiation dose can better fit the tumor.  Let's see what this looks like.  












In this image, we have a person's body outlined in black, and then the target, or tumor, and two critical structures also outlined.  We would like to maximize the radiation to the target, while minimizing the dose to healthy tissue,  and especially to the critical structures."
From Video 2 of Part 2 of Unit 8 of "The Analytics Edge" provides further discussion of how IMRT works.  The transcript of this video says in part:
  "The data are collected in the treatment-planning process, which starts from a CT scan, like the one you see here, on the right.  Using a CT scan, a radiation oncologist contours, or draws outlines around the tumor and various critical structures.  In [the CT] image, the oncologist would contour structures like the parotid glands, the largest of the saliva glands, and the brain.
"Then, each structure is discretized into voxels, or volume elements, which are typically four millimeters in dimension.  The second image here shows a closer view of the brain.  You can see the small squares, or voxels.  Here, they're two-dimensional, but in reality they would be three-dimensional.  Now, we can compute how much dose each beamlet, or piece of the beam, delivers to each voxel."
"We'll start with a small example.  Suppose we have nine voxels and six beamlets.  Our voxels can be categorized into three types:  the tumor voxels, which are colored pink here; the spinal cord voxel, colored dark green; and other healthy tissue voxels, colored light green.  So we have four tumor voxels, one spinal cord voxel, and four other healthy tissue voxels.  We have two beams that are each split into three beamlets.  Beam 1 is composed of beamlets 1, 2, and 3, and comes in from the right.  Beam 2 is composed of beamlets 4, 5, and 6, and comes in from the top.
"Our objective is to minimize the total dose to healthy tissue, both to the spinal cord and to the other healthy tissue.  We have two types of constraints.  The first is that the dose to the tumor voxels must be at least 7 Gray, which is the unit of measure for radiation.  Our second constraint is that the dose to the spinal cord voxel can't be more than 5 Gray, since we want to be careful to protect the spinal cord.  
"We know the dose that each beamlet gives to each voxel at unit intensity.  This table shows the dose that each beamlet in Beam 1 gives to the voxels.  Remember that this is at unit intensity.  If we double the intensity of the beamlet, we double the doses.  The dose to each voxel can depend on how far the beamlet has to travel, or the type of tissue that the beamlet has to travel through.  Similarly, we know the dose that each beamlet in Beam 2 gives to each voxel, again at unit intensity.
"The dose depends on the direction of the beam and what it travels through.  Putting these tables together, we can write out our optimization problem."

"Our decision variables are the intensities of each beamlet.  We'll call them: x1, the intensity for beamlet 1; x2, the intensity for beamlet 2; x3, the intensity for beamlet 3; etc., all the way up through x6.  As we mentioned before, our objective is to minimize the total dose to the healthy tissue, including the spinal cord.  So we want to minimize the total dose beamlet 1 gives to healthy tissue, which is (1 + 2)*x1, plus the total dose beamlet 2 gives to healthy tissue, which is (2 + 2.5)*x2, plus the total dose beamlet 3 gives to healthy tissue, which is 2.5*x3.  Now for beamlets 4, 5, and 6, beamlet 4 just gives one dose to healthy tissue; beamlet 5, 2*x5; and then beamlet 6 gives (1 + 2 + 1)*x6.  
"Now for our constraints.  First, we need to make sure that each voxel of the tumor gets a dose of at least 7.  Let's start with the  tumor voxel in the top row.  So 2*x1 + x5 needs to be greater than or equal to 7.  For the tumor voxel in the second row, we have x2 + 2*x4, also greater than or equal to 7.  For the two tumor voxels in the bottom row, we have 1.5*x3 + x4, greater than or equal to 7.  And 1.5*x_3 + x5, greater than or equal to 7.  Then for the spinal cord, we need to make sure that 2*x2 + 2*x5 is less than or equal to 5.  And lastly, we just need to make sure that all of our decision variables are non-negative."
Just below, between the long rows of ###s, is the R script that I developed to provide a linearly optimized solution to the IMRT problem using the lpSolveAPI function in R:
######################################################################

# Script for Solving the "Analytics Edge" IMRT Linear Optimization
# Problem in R

# In this script file, we show how the Intensity Modulated Radiation
# Therapy problem discussed in "The Analytics Edge" (specifically, 
# in the videos in the IMRT part of Unit 8 of "The Analytics Edge")
# can be solved in R using the "lpSolveAPI" package. This package 
# allows you to solve linear optimization problems in R using the 
# lp_solve library, which is an open-source optimization solver.

# If you are solving larger and more complex optimization problems, 
# lp_solve might not be powerful enough to solve your problems. 
# There are other optimization packages available in R that rely 
#on commercial solvers, such as cplexAPI and Rcplex.  
# For more information, see the CRAN Optimization page: 
# http://cran.us.r-project.org/web/views/Optimization.html

# First, you need to install and load the lpSolveAPI package:

install.packages("lpSolveAPI")
library(lpSolveAPI)

# The IMRT problem is how to minimize the amount of radiation 
# delivered to the spinal cord and other healthy tissue while 
# ensuring that at least the minimum needed radiation reaches the 
# tumor.  The target region of the human body is divided into 
# volume elements called voxels, which are typically 4mm in each 
# dimension.  The first step is to create a model, which takes as 
# arguments the number of constraints in your model, and the number 
# of decision variables in your model.

# In the IMRT problem, we deal with 9 voxels of body matter, arranged 
# in a 3 x 3 array.  In the top row, we have voxels 1, 2, 3; in the 
# middle row, voxels 4, 5, 6; and in the bottom row, voxels 7, 8, 9.  

# The healthy voxels are 1, 3, 5 (spinal cord), 6, and 9.  
# The tumor voxels are 2, 4, 7, and 8.
# The modulatable beamlets i, (i in 1:6), have intensities 
# x1, x2, . . ., x6.

# For beams of UNIT intensity, the beamlets deliver varying amounts 
# of radiation, measured in Grays, to the voxels as follows. 
# beamlet 1: 1 dose to voxel 1, 2 doses to voxel 2, 2 doses to 
# voxel 3
# beamlet 2: 1 dose to voxel 4, 2 doses to voxel 5, 2.5 doses to 
# voxel 6
# beamlet 3: 1.5 doses to voxel 7, 1.5 doses to voxel 8, 2.5 doses to 
# voxel 9
# beamlet 4: 1 dose to voxel 1, 2 doses to voxel 4, 1 dose to voxel 7
# beamlet 5: 1 dose to voxel 2, 2 doses to voxel 5, 1 dose to voxel 8
# beamlet 6: 1 dose to voxel 3, 2 doses to voxel 6, 1 doses to 
# voxel 9

# Our decision variables are the intensities of each beamlet.  We'll 
# call them:  x1, the intensity for beamlet 1; x2, the intensity for 
# beamlet 2; x3, the intensity for beamlet 3; etc., all the way up 
# through x6.  As we mentioned before, our objective is to minimize 
# the total dose to the healthy tissue, including the spinal cord. 
# Hence, we want to minimize the total dose beamlet 1 gives to 
# healthy tissue, which is (1 + 2)*x1, plus the total dose beamlet 2 
# gives to healthy tissue, which is (2 + 2.5)*x2, plus the total dose 
# beamlet 3 gives to healthy tissue, which is 2.5*x3.  
# For beamlets 4, 5, and 6: beamlet 4 just gives one dose to healthy 
# tissue, 1*x4; beamlet 5 gives 2 doses, 2*x5; and beamlet 6 gives 
# 1 + 2 + 1 = 4 doses, 4*x6.  

# Next, we consider our constraints.  First, we need to make sure 
# that each voxel of the tumor gets a dose of at least 7.  Let's 
# start  with the tumor voxel in the top row: 2*x1 + 1*x5 needs to 
# be greater than or equal to 7.  For the tumor voxel in the second 
# row, we have x2 + 2*x4, which also needs to be greater than or 
# equal  to 7.  For the first tumor voxel in the bottom row, we need 
# 1.5*x3 + 1*x4 to be greater than or equal to 7.  For the second 
# tumor voxel in the bottom row, we need 1.5*x3 + 1*x5 to be greater 
# than or equal to 7.  

# For the spinal cord, we need to make sure that 2*x2 + 2*x5 is less 
# than or equal to 5.  

# Finally, we need to make sure that all of our decision variables 
# are non-negative:  x1, x2, . . ., x6 >= 0.

# Writing all these considerations out in the form of inequalities, 
# we have:
# 2*x1 + 0*x2 +   0*x3 + 0*x4 + 1*x5 + 0*x6  >= 7
# 0*x1 + 1*x2 +   0*x3 + 2*x4 + 0*x5 + 0*x6  >= 7
# 0*x1 + 0*x2 + 1.5*x3 + 1*x4 + 0*x5 + 0*x6  >= 7 
# 0*x1 + 0*x2 + 1.5*x3 + 0*x4 + 1*x5 + 0*x6  >= 7
# 0*x1 + 2*x2 +   0*x3 + 0*x4 + 2*x5 + 0*x6  <= 5
# x1, x2, . . ., x6 >= 0  (Note: This non-negativity constraint is built into the lpSolveAPI function.)

IMRT <- make.lp(5,6)

set.column(IMRT, 1, c(2,0,0,0,0))
set.column(IMRT, 2, c(0,1,0,0,2))
set.column(IMRT, 3, c(0,0,1.5,1.5,0))
set.column(IMRT, 4, c(0,2,1,0,0))
set.column(IMRT, 5, c(1,0,0,1,2))
set.column(IMRT, 6, c(0,0,0,0,0))
set.constr.type(IMRT, c(">=",">=",">=",">=","<="))
set.rhs(IMRT, c(7,7,7,7,5))

# The objective is to minimize the total number of Grays of radiation 
# delivered to the healthy tissue: 
# (1+2)*x1 + (2+2.5)*x2 + 2.5*x3 + 1*x4 + 2*x5 + (1+2+1)*x6

set.objfn(IMRT, c(3,4.5,2.5,1,2,4))

# By default, the lpSolveAPI function assumes that the desired sense
# of the objective is minimization.  However, no harm is done by 
# making the sense explicit. (If the sense were maximization, we 
# would write sense="max" in lp.control.)

lp.control(IMRT, sense="min") 

# To check on our model, we can type IMRT.

IMRT

# Model name: 
#             C1    C2    C3    C4    C5    C6       
# R1           2     0     0     0     1      0  >=  7
# R2           0     1     0     2     0      0  >=  7
# R3           0     0   1.5     1     0      0  >=  7
# R4           0     0   1.5     0     1      0  >=  7
# R5           0     2     0     0     2      0  <=  5
# Kind        Std   Std   Std   Std   Std    Std       
# Type       Real  Real  Real  Real  Real   Real       
# Upper       Inf   Inf   Inf   Inf   Inf    Inf       
# Lower        0     0     0     0     0      0     

solve(IMRT)
get.objective(IMRT)
get.variables(IMRT)

# You should get an objective value of 22.75 total Grays, and 
# beamlet intensities of 2.25, 0, 3, 3.5, 2.5, 0.

######################################################################

Example 4:  A Linear Optimization Problem Involving the Amounts of Certain Cargoes to be    		 Asssigned to Certain Wagons (i.e., Boxcars) of a Train
This problem was first presented on the World-Wide Web as "Linear programming in R: an lpSolveAPI Example", written by Bart and posted on July 14, 2012.iii  Its URL is:
  http://www.r-bloggers.com/linear-programming-in-r-an-lpsolveapi-example/
  Bart's post indicates that an R script is available at:  http://fishyoperations.com/r/linear-programming-in-r-an-lpsolveapi-example/uploads/lpsolve_example.R.  However, this site appears to be no longer available on the Web.
Bart states the problem as follows: 
"A trading company is looking for a way to maximize profit per transportation of their goods. The company has a train available with 3 wagons. When stocking the wagons they can choose between 4 types of cargo, each with its own specifications."
The following data concerning the wagons and the cargoes are available:
Train Wagon
Weight Capacity 
(in tonnes)
Space Capacity 
(in cubic metres)
w1
w2
w3
10
8
12
5000
4000
8000
Cargo Type
Cargo Availability 
(in tonnes)
Cargo Volume 
(in cubic metres)
Cargo Profit 
(per tonne)
c1
c2
c3
c4
18
10
5
20
400
300
200
500
2000
2500
5000
3500

The variables in this problem are more complicated than those in Examples 1 - 3 of this discussion.  Here the variables consist of pairings of wagon and cargo.  Since there are 3 types of wagons and 4 types of cargo, there are 12 pairings to be considered.  We shall represent them by xij, where i = type of wagon and j = type of cargo:   x11, x12,  . . . , x14, x21, . . . , x31, . . . , x34.
The goal of the company is to maximize the profit from each trip by its three wagons, so the objective function is to maximize the following:
2000*x11 + 2500*x12 + 5000*x13 + 3500*x14 +2000*x21 + 2500*x22
+ 5000*x23 + 3500*x24 + 2000*x31 + 2500*x32 + 5000*x33 + 3500*x34
There are constraints due to the weight capacities of the wagons, constraints due to the space capacities of the wagons, and further constraints due to the availability of the cargoes.
The weight constraints can be expressed as:
x11 + x12 + x13 + x14  <=  10
x21 + x22 + x23 + x24  <=   8
x31 + x32 + x33 + x34  <=  12
The space capacity constraints can be expressed as:
400*x11 + 300*x12 + 200*x13 +500*x14  <=  5000
400*x21 + 300*x22 + 200*x23 + 500*x24  <=  4000
400*x31 + 300*x32 + 200*x33 + 500*x34  <=  8000
The cargo availability constraints can be expressed as:
x11 + x21 + x31   <=  18
x12 + x22 + x32   <=  10
x13 + x23 + x33   <=    5
x14 + x24 + x34   <=  20
Next, we need to combine the statements of these constraints into columns corresponding to the 12 variables, so that we can easily see how to enter the correct values into the model when we use the set.column function:
x11     x12     x13     x14     x21    x22     x23     x24     x31     x32     x33     x34          
1         1         1         1         0         0        0         0         0         0         0          0      <=       10
0         0         0         0         1         1        1         1         0         0         0          0      <=         8
0         0         0         0         0         0        0         0         1         1         1          1      <=        12           
400     300     200     500         0         0        0         0         0         0         0          0       <=    5000
0         0         0         0     400     300    200     500         0         0         0          0       <=    4000
0         0         0         0         0         0        0         0     400     300     200      500       <=    8000
1         0         0         0         1         0        0         0         1         0         0          0       <=        18
0         1         0         0         0         1        0         0         0         1         0          0       <=        10
0         0         1         0         0         0        1         0         0         0         1          0       <=          5
0         0         0         1         0         0        0         1         0         0         0          1       <=        20   

Now we are ready to use the make.lp and set.column functions:
wagoncargo <- make.lp(10, 12)
set.column(wagoncargo, 1, c(1, 0, 0, 400, 0, 0, 1, 0, 0, 0))
set.column(wagoncargo, 2, c(1, 0, 0, 300, 0, 0, 0, 1, 0, 0))
set.column(wagoncargo, 3, c(1, 0, 0, 200, 0, 0, 0, 0, 1, 0))
set.column(wagoncargo, 4, c(1, 0, 0, 500, 0, 0, 0, 0, 0, 1))
set.column(wagoncargo, 5, c(0, 1, 0, 0, 400, 0, 1, 0, 0, 0))
set.column(wagoncargo, 6, c(0, 1, 0, 0, 300, 0, 0, 1, 0, 0))
set.column(wagoncargo, 7, c(0, 1, 0, 0, 200, 0, 0, 0, 1, 0))
set.column(wagoncargo, 8, c(0, 1, 0, 0, 500, 0, 0, 0, 0, 1))
set.column(wagoncargo, 9, c(0, 0, 1, 0, 0, 400, 1, 0, 0, 0))
set.column(wagoncargo, 10, c(0, 0, 1, 0, 0, 300, 0, 1, 0, 0))
set.column(wagoncargo, 11, c(0, 0, 1, 0, 0, 200, 0, 0, 1, 0))
set.column(wagoncargo, 12, c(0, 0, 1, 0, 0, 500, 0, 0, 0, 1))

Next, we set the inequalities, the right-hand side of the model, the objective function, and the lp.control function:

set.constr.type(wagoncargo, rep("<=", 10))
set.rhs(wagoncargo, c(10, 8, 12, 5000, 4000, 8000, 18, 10, 5, 20))
set.objfn(c(2000, 2500, 5000, 3500, 2000, 2500, 5000, 3500, 2000, 2500, 5000, 3500))
lp.control(wagoncargo, sense="max")

To check on whether the model looks correct, we can issue the command:

wagoncargo

The remaining commands to be issued are:

solve(wagoncargo)
get.objective(wagoncargo)
get.variables(wagoncargo)

This finishes the discussion of Example 4 and how to solve it.  Immediately below, between the long rows of ###s, is an R script for solving Example 4.  Since the discussion above has been extensive, in the script below I have supplied a terser set of comments.

########################################################################

# We begin by installing the lpSolveAPI package and loading it into R.

install.packages("lpSolveAPI")
library(lpSolveAPI)

# The variables in this problem consist of pairings of wagon and cargo. 
# Since there are 3 types of wagons and 4 types of cargo, there are 12 
# pairings to be considered.  They are represented by xij, where 
# i = type of wagon and j = type of cargo:   
# x11, x12,  . . . , x14, x21, . . . , x31, . . . , x34. 

# The goal of the company is to maximize the profit from each trip by 
# its three wagons, so the objective function is to maximize the 
# following: 
# 2000*x11 + 2500*x12 + 5000*x13 + 3500*x14 +2000*x21 + 2500*x22 
# + 5000*x23 + 3500*x24 + 2000*x31 + 2500*x32 + 5000*x33 + 3500*x34 

# The weight constraints can be expressed as: 
# x11 + x12 + x13 + x14  <=  10 
# x21 + x22 + x23 + x24  <=   8 
# x31 + x32 + x33 + x34  <=  12 

# The space capacity constraints can be expressed as: 
# 400*x11 + 300*x12 + 200*x13 + 500*x14  <=  5000 
# 400*x21 + 300*x22 + 200*x23 + 500*x24  <=  4000 
# 400*x31 + 300*x32 + 200*x33 + 500*x34  <=  8000 

# The cargo availability constraints can be expressed as: 
# x11 + x21 + x31   <=  18 
# x12 + x22 + x32   <=  10 
# x13 + x23 + x33   <=   5 
# x14 + x24 + x34   <=  20 

# Now we are ready to use the make.lp and set.column functions: 

wagoncargo <- make.lp(10, 12) 
set.column(wagoncargo, 1, c(1, 0, 0, 400, 0, 0, 1, 0, 0, 0)) 
set.column(wagoncargo, 2, c(1, 0, 0, 300, 0, 0, 0, 1, 0, 0)) 
set.column(wagoncargo, 3, c(1, 0, 0, 200, 0, 0, 0, 0, 1, 0)) 
set.column(wagoncargo, 4, c(1, 0, 0, 500, 0, 0, 0, 0, 0, 1)) 
set.column(wagoncargo, 5, c(0, 1, 0, 0, 400, 0, 1, 0, 0, 0)) 
set.column(wagoncargo, 6, c(0, 1, 0, 0, 300, 0, 0, 1, 0, 0)) 
set.column(wagoncargo, 7, c(0, 1, 0, 0, 200, 0, 0, 0, 1, 0)) 
set.column(wagoncargo, 8, c(0, 1, 0, 0, 500, 0, 0, 0, 0, 1)) 
set.column(wagoncargo, 9, c(0, 0, 1, 0, 0, 400, 1, 0, 0, 0)) 
set.column(wagoncargo, 10, c(0, 0, 1, 0, 0, 300, 0, 1, 0, 0)) 
set.column(wagoncargo, 11, c(0, 0, 1, 0, 0, 200, 0, 0, 1, 0)) 
set.column(wagoncargo, 12, c(0, 0, 1, 0, 0, 500, 0, 0, 0, 1)) 

# Next, we set the inequalities, the right-hand side of the model, 
# the objective function, and the lp.control function: 

set.constr.type(wagoncargo, rep("<=", 10)) 
set.rhs(wagoncargo, c(10, 8, 12, 5000, 4000, 8000, 18, 10, 5, 20)) 
set.objfn(wagoncargo, c(2000, 2500, 5000, 3500, 2000, 2500, 5000, 3500, 2000, 2500, 5000, 3500)) 

lp.control(wagoncargo, sense="max") 

# To check on whether the model looks correct, we issue the command: 

wagoncargo 

# The remaining commands to be issued are: 

solve(wagoncargo) 
get.objective(wagoncargo) 
get.variables(wagoncargo)

# For the maximized profit per trip, you should get $107,500.
# For the loadings of wagons with cargoes, you should get:
# x11 = 0, x12 = 5, x13 = 5, x14 = 0; i.e., in wagon 1, 5 tonnes each 
# of cargo types 2 and 3
# x21 = 0, x22 = 0, x23 = 0, x24 = 8; i.e., in wagon 2, 8 tonnes of 
# cargo type 4
# x31 = 0, x32 = 0, x33 = 0, x34 = 12; i.e., in wagon 3, 12 tonnes of 
# cargo type 4

########################################################################

With Example 4, this discussion of how to perfom linear optimization by using the lpSolveAPI function in R has finished.  I hope the discussion and the examples have been of interest and assistance to fellow R enthusiasts.



Additional Resources on lpSolveAPI

An excellent short resource is "lpSolveAPI Package Users Guide"iv by Kjell Konis, the maintainer of lpSolveAPI.  The URL of this guide is:  

http://www.icesi.edu.co/CRAN/web/packages/lpSolveAPI/vignettes/lpSolveAPI.pdf

Detailed information about the lpSolveAPI packagev is available at:

http://cran.cnr.berkeley.edu/web/packages/lpSolveAPI/lpSolveAPI.pdf