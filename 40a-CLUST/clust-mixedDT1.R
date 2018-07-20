#Clustetering - College Data

set.seed(1680) # for reproducibility

library(dplyr) # for data cleaning
library(ISLR) # for college dataset
library(cluster) # for gower similarity and pam
library(tsne) # for t-SNE plot
library(ggplot2) # for visualization

college_clean <- College %>%  mutate(name = row.names(.), accept_rate = Accept/Apps,  isElite = cut(Top10perc, breaks = c(0, 50, 100),labels = c("Not Elite", "Elite"),include.lowest = TRUE)) %>% mutate(isElite = factor(isElite)) %>% select(name, accept_rate, Outstate, Enroll, Grad.Rate, Private, isElite)

glimpse(college_clean)

# Remove college name before clustering

gower_dist <- daisy(college_clean[, -1],metric = "gower",
        type = list(logratio = 3))
gower_dist
# Check attributes to ensure the correct methods are being used
# (I = interval, N = nominal)
# Note that despite logratio being called, 
# the type remains coded as "I"

summary(gower_dist)
## 301476 dissimilarities, summarized :
##      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
## 0.0018601 0.1034400 0.2358700 0.2314500 0.3271400 0.7773500 
## Metric :  mixed ;  Types = I, I, I, I, N, N 
## Number of objects : 777

gower_mat <- as.matrix(gower_dist)
gower_mat

# Output most similar pair
college_clean[which(gower_mat == min(gower_mat[gower_mat != min(gower_mat)]),
        arr.ind = TRUE)[1, ], ]

# Output most dissimilar pair
college_clean[which(gower_mat == max(gower_mat[gower_mat != max(gower_mat)]),
        arr.ind = TRUE)[1, ], ]


# Calculate silhouette width for many k using PAM

sil_width <- c(NA)
for(i in 2:10){
  pam_fit <- pam(gower_dist,
                 diss = TRUE,
                 k = i)
  sil_width[i] <- pam_fit$silinfo$avg.width
}

# Plot sihouette width (higher is better)
plot(1:10, sil_width,
     xlab = "Number of clusters",
     ylab = "Silhouette Width")
lines(1:10, sil_width)


pam_fit <- pam(gower_dist, diss = TRUE, k = 3)

pam_results <- college_clean %>%
  dplyr::select(-name) %>%
  mutate(cluster = pam_fit$clustering) %>%
  group_by(cluster) %>%
  do(the_summary = summary(.))

pam_results$the_summary

college_clean[pam_fit$medoids, ]


#tsne_obj <- tsne(gower_dist, is_distance = TRUE)
tsne_obj <- tsne(gower_dist)

tsne_data <- tsne_obj$Y %>%
  data.frame() %>%
  setNames(c("X", "Y")) %>%
  mutate(cluster = factor(pam_fit$clustering),
         name = college_clean$name)

ggplot(aes(x = X, y = Y), data = tsne_data) +
  geom_point(aes(color = cluster))

tsne_data %>%
  filter(X > 15 & X < 25,
         Y > -15 & Y < -10) %>%
  left_join(college_clean, by = "name") %>%
  collect %>%
  .[["name"]]
