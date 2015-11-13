## Opens the pollutant report csv given a directory and sensor id
readReport <- function(directory, id){
  read.csv(sprintf("%s/%03d.csv", directory, id))
}