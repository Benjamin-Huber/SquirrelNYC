

```r
#Author: Benjamin Huber
#Date: February 27, 2023
#Project: Squirrel Census Analysis

#Objective: Model Predictors of squirrel Activity

#Output:

#Setup:
require(tidyverse)
require(gee)
require(gtsummary)
setwd("C:/Users/bdh22/Dropbox/P8170S23/P8170-Lectures/SquirrelCodingSample/SquirrelNYC")
squirrel_analysis_data <- read.csv("Data/squirrel_analysis_data.csv")


gee(eat_forag ~ busy_park, id = Park.ID, family = "binomial", data = squirrel_analysis_data) %>%
  summary()
```

```
## Beginning Cgee S-function, @(#) geeformula.q 4.13 98/01/27
```

```
## running glm to get initial regression estimate
```

```
## (Intercept)   busy_park 
##  -0.2090918  -0.1963733
```

```
## 
##  GEE:  GENERALIZED LINEAR MODELS FOR DEPENDENT DATA
##  gee S-function, version 4.13 modified 98/01/27 (1998) 
## 
## Model:
##  Link:                      Logit 
##  Variance to Mean Relation: Binomial 
##  Correlation Structure:     Independent 
## 
## Call:
## gee(formula = eat_forag ~ busy_park, id = Park.ID, data = squirrel_analysis_data, 
##     family = "binomial")
## 
## Summary of Residuals:
##        Min         1Q     Median         3Q        Max 
## -0.4479167 -0.4479167 -0.4000000  0.5520833  0.6000000 
## 
## 
## Coefficients:
##               Estimate Naive S.E.    Naive z Robust S.E.   Robust z
## (Intercept) -0.2090918  0.1187704 -1.7604709   0.2353376 -0.8884758
## busy_park   -0.1963733  0.2073050 -0.9472674   0.4876192 -0.4027186
## 
## Estimated Scale Parameter:  1.00464
## Number of Iterations:  1
## 
## Working Correlation
##       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12] [,13] [,14] [,15] [,16] [,17]
##  [1,]    1    0    0    0    0    0    0    0    0     0     0     0     0     0     0     0     0
##  [2,]    0    1    0    0    0    0    0    0    0     0     0     0     0     0     0     0     0
##  [3,]    0    0    1    0    0    0    0    0    0     0     0     0     0     0     0     0     0
##  [4,]    0    0    0    1    0    0    0    0    0     0     0     0     0     0     0     0     0
##  [5,]    0    0    0    0    1    0    0    0    0     0     0     0     0     0     0     0     0
##  [6,]    0    0    0    0    0    1    0    0    0     0     0     0     0     0     0     0     0
##  [7,]    0    0    0    0    0    0    1    0    0     0     0     0     0     0     0     0     0
##  [8,]    0    0    0    0    0    0    0    1    0     0     0     0     0     0     0     0     0
##  [9,]    0    0    0    0    0    0    0    0    1     0     0     0     0     0     0     0     0
## [10,]    0    0    0    0    0    0    0    0    0     1     0     0     0     0     0     0     0
## [11,]    0    0    0    0    0    0    0    0    0     0     1     0     0     0     0     0     0
## [12,]    0    0    0    0    0    0    0    0    0     0     0     1     0     0     0     0     0
## [13,]    0    0    0    0    0    0    0    0    0     0     0     0     1     0     0     0     0
## [14,]    0    0    0    0    0    0    0    0    0     0     0     0     0     1     0     0     0
## [15,]    0    0    0    0    0    0    0    0    0     0     0     0     0     0     1     0     0
## [16,]    0    0    0    0    0    0    0    0    0     0     0     0     0     0     0     1     0
##       [,18] [,19] [,20] [,21] [,22] [,23] [,24] [,25] [,26] [,27] [,28] [,29] [,30] [,31] [,32] [,33]
##  [1,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##  [2,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##  [3,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##  [4,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##  [5,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##  [6,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##  [7,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##  [8,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##  [9,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
## [10,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
## [11,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
## [12,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
## [13,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
## [14,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
## [15,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
## [16,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##       [,34] [,35] [,36] [,37] [,38] [,39] [,40] [,41] [,42] [,43] [,44] [,45] [,46] [,47] [,48] [,49]
##  [1,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##  [2,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##  [3,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##  [4,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##  [5,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##  [6,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##  [7,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##  [8,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##  [9,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
## [10,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
## [11,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
## [12,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
## [13,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
## [14,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
## [15,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
## [16,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##       [,50] [,51] [,52] [,53] [,54] [,55] [,56] [,57] [,58] [,59]
##  [1,]     0     0     0     0     0     0     0     0     0     0
##  [2,]     0     0     0     0     0     0     0     0     0     0
##  [3,]     0     0     0     0     0     0     0     0     0     0
##  [4,]     0     0     0     0     0     0     0     0     0     0
##  [5,]     0     0     0     0     0     0     0     0     0     0
##  [6,]     0     0     0     0     0     0     0     0     0     0
##  [7,]     0     0     0     0     0     0     0     0     0     0
##  [8,]     0     0     0     0     0     0     0     0     0     0
##  [9,]     0     0     0     0     0     0     0     0     0     0
## [10,]     0     0     0     0     0     0     0     0     0     0
## [11,]     0     0     0     0     0     0     0     0     0     0
## [12,]     0     0     0     0     0     0     0     0     0     0
## [13,]     0     0     0     0     0     0     0     0     0     0
## [14,]     0     0     0     0     0     0     0     0     0     0
## [15,]     0     0     0     0     0     0     0     0     0     0
## [16,]     0     0     0     0     0     0     0     0     0     0
##  [ reached getOption("max.print") -- omitted 43 rows ]
```

```r
gee(above_ground ~ busy_park, id = Park.ID, family = "binomial", data = squirrel_analysis_data) %>%
  summary()
```

```
## Beginning Cgee S-function, @(#) geeformula.q 4.13 98/01/27
## running glm to get initial regression estimate
```

```
## (Intercept)   busy_park 
##  -0.6159881  -0.1188318
```

```
## 
##  GEE:  GENERALIZED LINEAR MODELS FOR DEPENDENT DATA
##  gee S-function, version 4.13 modified 98/01/27 (1998) 
## 
## Model:
##  Link:                      Logit 
##  Variance to Mean Relation: Binomial 
##  Correlation Structure:     Independent 
## 
## Call:
## gee(formula = above_ground ~ busy_park, id = Park.ID, data = squirrel_analysis_data, 
##     family = "binomial")
## 
## Summary of Residuals:
##        Min         1Q     Median         3Q        Max 
## -0.3506944 -0.3506944 -0.3241379  0.6493056  0.6758621 
## 
## 
## Coefficients:
##               Estimate Naive S.E.    Naive z Robust S.E.   Robust z
## (Intercept) -0.6159881  0.1237713 -4.9768237   0.4481278 -1.3745813
## busy_park   -0.1188318  0.2166705 -0.5484447   0.4911000 -0.2419706
## 
## Estimated Scale Parameter:  1.00464
## Number of Iterations:  1
## 
## Working Correlation
##       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12] [,13] [,14] [,15] [,16] [,17]
##  [1,]    1    0    0    0    0    0    0    0    0     0     0     0     0     0     0     0     0
##  [2,]    0    1    0    0    0    0    0    0    0     0     0     0     0     0     0     0     0
##  [3,]    0    0    1    0    0    0    0    0    0     0     0     0     0     0     0     0     0
##  [4,]    0    0    0    1    0    0    0    0    0     0     0     0     0     0     0     0     0
##  [5,]    0    0    0    0    1    0    0    0    0     0     0     0     0     0     0     0     0
##  [6,]    0    0    0    0    0    1    0    0    0     0     0     0     0     0     0     0     0
##  [7,]    0    0    0    0    0    0    1    0    0     0     0     0     0     0     0     0     0
##  [8,]    0    0    0    0    0    0    0    1    0     0     0     0     0     0     0     0     0
##  [9,]    0    0    0    0    0    0    0    0    1     0     0     0     0     0     0     0     0
## [10,]    0    0    0    0    0    0    0    0    0     1     0     0     0     0     0     0     0
## [11,]    0    0    0    0    0    0    0    0    0     0     1     0     0     0     0     0     0
## [12,]    0    0    0    0    0    0    0    0    0     0     0     1     0     0     0     0     0
## [13,]    0    0    0    0    0    0    0    0    0     0     0     0     1     0     0     0     0
## [14,]    0    0    0    0    0    0    0    0    0     0     0     0     0     1     0     0     0
## [15,]    0    0    0    0    0    0    0    0    0     0     0     0     0     0     1     0     0
## [16,]    0    0    0    0    0    0    0    0    0     0     0     0     0     0     0     1     0
##       [,18] [,19] [,20] [,21] [,22] [,23] [,24] [,25] [,26] [,27] [,28] [,29] [,30] [,31] [,32] [,33]
##  [1,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##  [2,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##  [3,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##  [4,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##  [5,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##  [6,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##  [7,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##  [8,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##  [9,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
## [10,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
## [11,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
## [12,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
## [13,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
## [14,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
## [15,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
## [16,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##       [,34] [,35] [,36] [,37] [,38] [,39] [,40] [,41] [,42] [,43] [,44] [,45] [,46] [,47] [,48] [,49]
##  [1,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##  [2,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##  [3,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##  [4,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##  [5,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##  [6,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##  [7,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##  [8,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##  [9,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
## [10,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
## [11,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
## [12,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
## [13,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
## [14,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
## [15,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
## [16,]     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0
##       [,50] [,51] [,52] [,53] [,54] [,55] [,56] [,57] [,58] [,59]
##  [1,]     0     0     0     0     0     0     0     0     0     0
##  [2,]     0     0     0     0     0     0     0     0     0     0
##  [3,]     0     0     0     0     0     0     0     0     0     0
##  [4,]     0     0     0     0     0     0     0     0     0     0
##  [5,]     0     0     0     0     0     0     0     0     0     0
##  [6,]     0     0     0     0     0     0     0     0     0     0
##  [7,]     0     0     0     0     0     0     0     0     0     0
##  [8,]     0     0     0     0     0     0     0     0     0     0
##  [9,]     0     0     0     0     0     0     0     0     0     0
## [10,]     0     0     0     0     0     0     0     0     0     0
## [11,]     0     0     0     0     0     0     0     0     0     0
## [12,]     0     0     0     0     0     0     0     0     0     0
## [13,]     0     0     0     0     0     0     0     0     0     0
## [14,]     0     0     0     0     0     0     0     0     0     0
## [15,]     0     0     0     0     0     0     0     0     0     0
## [16,]     0     0     0     0     0     0     0     0     0     0
##  [ reached getOption("max.print") -- omitted 43 rows ]
```

```r
glm(above_ground~eat_forag, data = squirrel_analysis_data, family = "binomial") %>%
  summary()
```

```
## 
## Call:
## glm(formula = above_ground ~ eat_forag, family = "binomial", 
##     data = squirrel_analysis_data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.1226  -1.1226  -0.6231   1.2332   1.8626  
## 
## Coefficients:
##             Estimate Std. Error z value Pr(>|z|)    
## (Intercept)  -0.1303     0.1278  -1.019    0.308    
## eat_forag    -1.4102     0.2305  -6.119 9.44e-10 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for binomial family taken to be 1)
## 
##     Null deviance: 556.17  on 432  degrees of freedom
## Residual deviance: 514.27  on 431  degrees of freedom
## AIC: 518.27
## 
## Number of Fisher Scoring iterations: 3
```

```r
squirrel_analysis_data %>%
  select(eat_forag, above_ground, busy_park)%>%
  tbl_summary(by = busy_park) %>%
  add_overall()
```

<!--html_preserve--><div id="zmfarimbwe" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#zmfarimbwe .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#zmfarimbwe .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#zmfarimbwe .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#zmfarimbwe .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#zmfarimbwe .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#zmfarimbwe .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#zmfarimbwe .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#zmfarimbwe .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#zmfarimbwe .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#zmfarimbwe .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#zmfarimbwe .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#zmfarimbwe .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#zmfarimbwe .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#zmfarimbwe .gt_from_md > :first-child {
  margin-top: 0;
}

#zmfarimbwe .gt_from_md > :last-child {
  margin-bottom: 0;
}

#zmfarimbwe .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#zmfarimbwe .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#zmfarimbwe .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#zmfarimbwe .gt_row_group_first td {
  border-top-width: 2px;
}

#zmfarimbwe .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#zmfarimbwe .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#zmfarimbwe .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#zmfarimbwe .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#zmfarimbwe .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#zmfarimbwe .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#zmfarimbwe .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#zmfarimbwe .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#zmfarimbwe .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#zmfarimbwe .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-left: 4px;
  padding-right: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#zmfarimbwe .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#zmfarimbwe .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#zmfarimbwe .gt_left {
  text-align: left;
}

#zmfarimbwe .gt_center {
  text-align: center;
}

#zmfarimbwe .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#zmfarimbwe .gt_font_normal {
  font-weight: normal;
}

#zmfarimbwe .gt_font_bold {
  font-weight: bold;
}

#zmfarimbwe .gt_font_italic {
  font-style: italic;
}

#zmfarimbwe .gt_super {
  font-size: 65%;
}

#zmfarimbwe .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 75%;
  vertical-align: 0.4em;
}

#zmfarimbwe .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#zmfarimbwe .gt_slash_mark {
  font-size: 0.7em;
  line-height: 0.7em;
  vertical-align: 0.15em;
}

#zmfarimbwe .gt_fraction_numerator {
  font-size: 0.6em;
  line-height: 0.6em;
  vertical-align: 0.45em;
}

#zmfarimbwe .gt_fraction_denominator {
  font-size: 0.6em;
  line-height: 0.6em;
  vertical-align: -0.05em;
}
</style>
<table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1"><strong>Characteristic</strong></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1"><strong>Overall</strong>, N = 433<sup class="gt_footnote_marks">1</sup></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1"><strong>0</strong>, N = 288<sup class="gt_footnote_marks">1</sup></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1"><strong>1</strong>, N = 145<sup class="gt_footnote_marks">1</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td class="gt_row gt_left">eat_forag</td>
<td class="gt_row gt_center">187 (43%)</td>
<td class="gt_row gt_center">129 (45%)</td>
<td class="gt_row gt_center">58 (40%)</td></tr>
    <tr><td class="gt_row gt_left">above_ground</td>
<td class="gt_row gt_center">148 (34%)</td>
<td class="gt_row gt_center">101 (35%)</td>
<td class="gt_row gt_center">47 (32%)</td></tr>
  </tbody>
  
  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="4"><sup class="gt_footnote_marks">1</sup> n (%)</td>
    </tr>
  </tfoot>
</table>
</div><!--/html_preserve-->

```r
#setwd("C:/Users/bdh22/Dropbox/P8170S23/P8170-Lectures/SquirrelCodingSample/SquirrelNYC/Output")
#
```

