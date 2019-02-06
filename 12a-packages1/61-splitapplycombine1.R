#plyr, dplyr, 

#http://krlmlr.github.io/pdlyr/vignettes/pdlyr.html

#https://coolbutuseless.bitbucket.io/2018/03/03/split-apply-combine-my-search-for-a-replacement-for-group_by---do/#split-apply-combine---prehistoric-times---split-lapply-do.callrbind-...


#plyr::ddply(mtcars, 'cyl', do(mean(.))
complex_func <- function(x) { mean(x)}            
result_df <- mtcars %>%  group_by(cyl) %>%  do(complex_func(.)) %>% ungroup() 
            