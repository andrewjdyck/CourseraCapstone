

#datadir <- 'C:/Users/dycka/Downloads/Coursera-SwiftKey/final/en_US/'
datadir <- '~/Downloads/CourseraCapstone/final/en_US/'
filenames <- c('en_US.blogs.txt', 'en_US.news.txt', 'en_US.twitter.txt')

library(stringr)
Clean_String <- function(string) {
  # Lowercase
  temp <- tolower(string)
  #' Remove everything that is not a number or letter (may want to keep more 
  #' stuff in your actual analyses). 
  temp <- stringr::str_replace_all(temp,"[^a-zA-Z\\s]", " ")
  # Shrink down to just one white space
  temp <- stringr::str_replace_all(temp,"[\\s]+", " ")
  # Split it
  temp <- stringr::str_split(temp, " ")[[1]]
  # Get rid of trailing "" if necessary
  indexes <- which(temp == "")
  if(length(indexes) > 0){
    temp <- temp[-indexes]
  } 
  return(temp)
}




conT <- file(paste0(datadir, filenames[3]), "r")
conB <- file(paste0(datadir, filenames[1]), "r")
conN <- file(paste0(datadir, filenames[2]), "r")

# Read the data
tt <- readLines(conT, 10)
#dT <- readLines(conT)
#dB <- readLines(conB)
#dN <- readLines(conN)

# user   system  elapsed 
# 1021.859   24.306 1059.381
system.time(words1 <- unique(unlist(sapply(dT, Clean_String)))) 
writeLines(words1, "./Data/en_US.unique.twitter.txt")
system.time(words2 <- unique(unlist(sapply(dN, Clean_String)))) 
writeLines(words2, "./Data/en_US.unique.news.txt")
system.time(words3 <- unique(unlist(sapply(dB, Clean_String)))) 
writeLines(words3, "./Data/en_US.unique.blogs.txt")
  