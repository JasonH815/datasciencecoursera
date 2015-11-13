source(file="readreport.R")

## Reads a the directory of pollutant reports and returns
## the number of completely observed cases (where both pollutant data is reported)
complete <- function(directory, id = 1:332) {
  
  nobs = numeric(332)
  
  # Compute the number of complete observations for each file
  for(i in id) {
    report <- readReport(directory, i)
    nobs[i] <- nrow(report[complete.cases(report),])
  }
  
  data.frame(id = id, nobs = nobs[id])
  
}