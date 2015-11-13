source(file="readreport.R")
source(file="complete.R")

# Computes the correlation between sulfate and nitrate for monitor locations
# where the number of completely observed cases is greater than the threshold
corr <- function(directory, threshold = 0) {
  
  #get the number of oberservations for the locations
  locations <- complete(directory)
  
  #get the location ids which are greater than the threshold
  locations <- locations[locations$nobs > threshold, ]$id
  
  # Compute the correlations for the ids above the threshold
  correlations <- numeric(length(locations))
  if(length(locations) > 0) {
    for(i in 1:length(locations)) {
      dat <- readReport("specdata", locations[i])
      dat <- dat[complete.cases(dat), ][c("sulfate", "nitrate")]
      correlations[i] <- cor(dat)[1,2]
    }
  }
  correlations
}
