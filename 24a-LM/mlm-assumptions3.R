# Assumptions
http://www.sthda.com/english/articles/39-regression-model-diagnostics/161-linear-regression-assumptions-and-diagnostics-in-r-essentials/
  
Regression assumptions
Linear regression makes several assumptions about the data, such as :
  
  Linearity of the data. The relationship between the predictor (x) and the outcome (y) is assumed to be linear.
Normality of residuals. The residual errors are assumed to be normally distributed.
Homogeneity of residuals variance. The residuals are assumed to have a constant variance (homoscedasticity)
Independence of residuals error terms.
You should check whether or not these assumptions hold true. Potential problems include:
  
  Non-linearity of the outcome - predictor relationships
Heteroscedasticity: Non-constant variance of error terms.
Presence of influential values in the data that can be:
  Outliers: extreme values in the outcome (y) variable
High-leverage points: extreme values in the predictors (x) variable

All these assumptions and potential problems can be checked by producing some diagnostic plots visualizing the residual errors.

Regression diagnostics {reg-diag}
Diagnostic plots
Regression diagnostics plots can be created using the R base function plot() or the autoplot() function [ggfortify package], which creates a ggplot2-based graphics.

Create the diagnostic plots with the R base function:
  par(mfrow = c(2, 2))
plot(model)


Create the diagnostic plots using ggfortify:
  library(ggfortify)
autoplot(model)
The diagnostic plots show residuals in four different ways:
  
  Residuals vs Fitted. Used to check the linear relationship assumptions. A horizontal line, without distinct patterns is an indication for a linear relationship, what is good.

Normal Q-Q. Used to examine whether the residuals are normally distributed. It’s good if residuals points follow the straight dashed line.

Scale-Location (or Spread-Location). Used to check the homogeneity of variance of the residuals (homoscedasticity). Horizontal line with equally spread points is a good indication of homoscedasticity. This is not the case in our example, where we have a heteroscedasticity problem.

Residuals vs Leverage. Used to identify influential cases, that is extreme values that might influence the regression results when included or excluded from the analysis. This plot will be described further in the next sections.

The four plots show the top 3 most extreme data points labeled with with the row numbers of the data in the data set. They might be potentially problematic. You might want to take a close look at them individually to check if there is anything special for the subject or if it could be simply data entry errors. We’ll discuss about this in the following sections.

The metrics used to create the above plots are available in the model.diag.metrics data, described in the previous section.

# Add observations indices and
# drop some columns (.se.fit, .sigma) for simplification
model.diag.metrics <- model.diag.metrics %>%
  mutate(index = 1:nrow(model.diag.metrics)) %>%
  select(index, everything(), -.se.fit, -.sigma)
# Inspect the data
head(model.diag.metrics, 4)
##   index sales youtube .fitted .resid    .hat .cooksd .std.resid
## 1     1  26.5   276.1   21.56   4.96 0.00970 0.00794      1.273
## 2     2  12.5    53.4   10.98   1.50 0.01217 0.00092      0.387
## 3     3  11.2    20.6    9.42   1.74 0.01649 0.00169      0.449
## 4     4  22.2   181.8   17.08   5.12 0.00501 0.00434      1.312
We’ll use mainly the following columns:
  
  .fitted: fitted values
.resid: residual errors
.hat: hat values, used to detect high-leverage points (or extreme values in the predictors x variables)
.std.resid: standardized residuals, which is the residuals divided by their standard errors. Used to detect outliers (or extreme values in the outcome y variable)
.cooksd: Cook’s distance, used to detect influential values, which can be an outlier or a high leverage point
In the following section, we’ll describe, in details, how to use these graphs and metrics to check the regression assumptions and to diagnostic potential problems in the model.

Linearity of the data
The linearity assumption can be checked by inspecting the Residuals vs Fitted plot (1st plot):
  
  plot(model, 1)