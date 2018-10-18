#Data Understanding
#https://cran.r-project.org/web/packages/skimr/vignettes/Using_skimr.html
#https://cran.r-project.org/web/packages/skimr/skimr.pdf

library(skimr)
#skimr, a package for quickly skimming data by data type

skim(iris)
skim(iris) %>%  dplyr::filter(stat == "mean")
skim(mtcars) %>%  dplyr::filter(stat == "mean")

mtcars %>% dplyr::group_by(gear) %>% skim()

skim(iris, Sepal.Length, Species)

skim(datasets::lynx)

iris_setosa <- iris %>%  skim_tee(iris) %>% dplyr::filter(Species == "setosa")

iris %>% skim_to_list()

n_missing(mtcars)
