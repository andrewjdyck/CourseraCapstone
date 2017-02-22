
library(dplyr)
#datadir <- 'C:/Users/dycka/Downloads/Coursera-SwiftKey/final/en_US/'
datadir <- '~/Downloads/CourseraCapstone/final/en_US/'
filenames <- c('en_US.blogs.txt', 'en_US.news.txt', 'en_US.twitter.txt')

conB <- file(paste0(datadir, filenames[1]), "r")
conN <- file(paste0(datadir, filenames[2]), "r")
conT <- file(paste0(datadir, filenames[3]), "r")

# Read the data
#tt <- readLines(conT, 10)
dB <- readLines(conB, 1000)
dN <- readLines(conN, 1000)
dT <- readLines(conT, 1000)





# user   system  elapsed 
# 1021.859   24.306 1059.381
system.time(words1 <- unique(unlist(sapply(dT, Clean_String)))) 
writeLines(words1, "./Data/en_US.unique.twitter.txt")
system.time(words2 <- unique(unlist(sapply(dN, Clean_String)))) 
writeLines(words2, "./Data/en_US.unique.news.txt")
system.time(words3 <- unique(unlist(sapply(dB, Clean_String)))) 
writeLines(words3, "./Data/en_US.unique.blogs.txt")
  