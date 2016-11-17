
# Location of the stored data
datadir <- 'C:/Users/dycka/Downloads/Coursera-SwiftKey/final/en_US/'

# Dataset connections
conT <- file(paste0(datadir, 'en_US.twitter.txt'), "r")
conB <- file(paste0(datadir, 'en_US.blogs.txt'), "r")
conN <- file(paste0(datadir, 'en_US.news.txt'), "r")

# Inspect the first line of a dataset
# readLines(conT, 1)

# load all the datasets into memory. Each is about 200MB. Careful!
dT <- readLines(conT)
dB <- readLines(conB)
dN <- readLines(conN)

# Quiz questions
# Love/Hate
length(grep('love', dT))/length(grep('hate', dT))

# Biostats tweet
dT[grep('biostats', dT)]

# Number of exact tweets
length(grep('A computer once beat me at chess, but it was no match for me at kickboxing', dt))

# Max length of row in dataset.
max(sapply(dB, FUN=nchar)) # max length = 40835
max(sapply(dN, FUN=nchar)) # max length = 5760

# Size of file
# en_US.blog.txt is 200 MB


