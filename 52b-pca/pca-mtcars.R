#PCA on mtcars
require(psych) 
data(mtcars) 
rawd <- mtcars[,c("am","carb","cyl","disp","drat","gear","hp","mpg")] 

## compute acp 
.PC <- princomp(~am+carb+cyl+disp+drat+gear+hp+mpg, cor=TRUE, data=mtcars) 
pca <- principal(rawd, nfactors = 8, residuals = T, rotate="none", scores=T) 

## eigenvectors of the correlation matrix of raw data 
eigens <- eigen(cor(rawd)) 
eigens$vectors 
unclass(loadings(.PC))  # component 'loadings' in ?princomp parlance 
#not sure if ?principal outputs this 

## correlation matrix between raw data and unrotated component scores 
## 'loadings' in ?principal parlance and 'component matrix' in SPSS 
eigens$vectors %*% diag(sqrt(eigens$values)) 
cor(cbind(rawd, .PC$scores)) 
unclass(pca$loadings) 

## extract un-rotated scores of principal components 
head(scale(rawd) %*% eigens$vectors) # app, but very similar results 
head(.PC$scores) 
head(pca$scores) # scale'd, and obtained via regression on scale'd data 
head(factor.scores(scale(rawd), 
                   unclass(pca$loadings))) # same scores as from ?principal 
#for differeneces between ?princomp and ?principal scores 
#see last paragraph of Details in ?principal 



data (mtcars) 
pc1 = prcomp (mtcars, center = TRUE, scale = TRUE) $ x [1: 2] #principal scaled components, mean subtracted 
pc1 
pc2 = prcomp (mtcars, center = TRUE, scale = FALSE) $ x [1: 2] #principal components not scaled, not mean subtracted 
pc2 
pc3 = princomp(mtcars) $ score [1: 2] # main components, same value as: prcomp (mtcars, center = TRUE, scale = FALSE) $ x [, 1: 2], with a possible sign change 
pc3

# OBTAIN loadings 
load1 = prcomp (mtcars) $ rot [1: 2] 
load1 
load2 = princomp (mtcars) $ loadings [1: 2] # same value as: prcomp (mtcars ) $ rot [, 1: 2] ,, with a possible sign change load2
load2


mtcars 
mtcars_2 = prcomp (mtcars) $ x %*% t (prcomp (mtcars) $ rot) 
mtcars_2 # not the same as mtcars 
mtcars_3 = princomp (mtcars) $ score %*% t (princomp (mtcars) $ loadings) 
mtcars_3 # not the same as mtcars 
mtcars_2_c = prcomp (mtcars)$ x %*% t (prcomp (mtcars) $ rotation) + matrix (rep (prcomp (mtcars) $ center , each = nrow (mtcars)), nrow = nrow (mtcars)) 
mtcars_2_c # after adding the mean substracted previously, the result is the same as mtcars 
mtcars_3_c = princomp (mtcars) $ score %*% t (princomp (mtcars) $ loadings) + matrix (rep (princomp (mtcars) $ center, each = nrow (mtcars)), nrow = nrow (mtcars)) 
mtcars_3_c # same as mtcars
#in case of using scaling it is needed to multiply by the scale factor: 