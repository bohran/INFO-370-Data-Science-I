# Functions for segregation metrics

# Compute Correlaiton Metric

correlation <- function(cities){
  x <- cities$pop.not.white # non-white population in each census tract
  t <- cities$pop           # total population of each census tract
  p_total  <- sum(x) / sum(t) # total proportion of the metropolitan area’s population that is minority
  isolation <- sum((x/sum(x)) * (x/t))
  
  result_corr <- (isolation - p_total) / (1 - p_total)
  return(result_corr)
}

# Compute Isolation Metric

isolation <- function(cities){
  x <- cities$pop.not.white # non-white people in each census tract
  t <- cities$pop # total population in each census tract
  
  result_iso <- sum((x/sum(x)) * (x/t))
  return(result_iso)
}

# Compute Dissimilarity Metric

dissimilarity <- function(cities){
  t <- cities$pop # non-white people in each census tract
  x <- cities$pop.not.white # total population in each census tract
  p_area <- x / t # proportion of area's population is minority 
  p_total <- sum(x)/sum(t) # total proportion of the metropolitan area’s population that is minority
  
  result_diss <- sum(t * abs(p_area - p_total)) / (2 * sum(t) * p_total * (1 - p_total))
  return(result_diss)
}

new <- function(cities){
  x <- cities$pop.not.white # non-white people in each census tract
  t <- cities$pop # total population in each census tract
  
  result_new <- (sum((x/sum(x)) * (x/t))) / 4
  return(result_new)
}
