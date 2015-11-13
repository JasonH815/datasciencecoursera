source(file="readreport.R")

## Calculates the mean of a poluttant (sulfate or nitrate) accross
## a range of monitor ids
pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  rcount <- 0
  total <- 0
  
  #get total and count for each file and add them to the running totals
  for(i in id) {
    # Read file, get pollutant and calculate the mean
    pol <- readReport(directory, i)[[pollutant]]
    pol <- pol[!is.na(pol)]
    rcount = rcount + length(pol)
    total = total + sum(pol)
  }
  
  # Return the mean
  total/rcount

}