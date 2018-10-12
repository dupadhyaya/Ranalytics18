#adv web based graphs
#https://towardsdatascience.com/tableau-esque-drag-and-drop-gui-visualization-in-r-901ee9f2fe3f

library(esquisse)
#loading tidyverse to read input
library(tidyverse)
# loading itunesr for retrieving itunes review data that we will use in this analysis
library(itunesr)
#loading the magical esquisse library
library(esquisse)
# Flipkart Reviews
reviews <- getReviews(742044692,'in',1)
reviews
#converting Rating to numeric type
reviews$Rating <- as.numeric(reviews$Rating)
#let us say we want to see if there's any correlation between rating and review length
reviews$len <- nchar(reviews$Review)
#let the magic begin
esquisse::esquisser(reviews)

esquisse::esquisser(mtcars)


#copied code
ggplot(data = reviews) +
  aes(x = len, y = Rating) +
  geom_point(color = '#e31a1c') +
  labs(title = 'Ratings vs Reviews Length',
       x = 'Length of Review',
       y = 'Rating associated with Review',
       caption = 'Data Source: App Store',
       subtitle = 'Flipkart iOS App Reviews') +
  theme_linedraw()

ggplot(data = mtcars) +
  aes(x = mpg, y = hp) +
  geom_point(color = '#e31a1c') +
  labs(title = 'MPG vs HP',
       x = 'MPG',
       y = 'HP',
       caption = 'mtcars dataset',
       subtitle = 'R Programming') +
  theme_linedraw()
