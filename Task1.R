

datadir <- 'C:/Users/dycka/Downloads/Coursera-SwiftKey/final/en_US/'
filenames <- c('en_US.blogs.txt', 'en_US.news.txt', 'en_US.twitter.txt')


conT <- file(paste0(datadir, filenames[3]), "r")
conB <- file(paste0(datadir, filenames[1]), "r")
conN <- file(paste0(datadir, filenames[2]), "r")
# readLines(conT, 10)
dT <- readLines(conT)
dB <- readLines(conB)
dN <- readLines(conN)

# Love/Hate
length(grep('love', dT))/length(grep('hate', dT))

# Biostats tweet
dT[grep('biostats', dT)]

# Number of exact tweets
length(grep('A computer once beat me at chess, but it was no match for me at kickboxing', dt))



max(sapply(dB, FUN=nchar)) # max length = 40835
max(sapply(dN, FUN=nchar)) # max length = 5760

# Quiz 1
# en_US.blog.txt is 200 MB


