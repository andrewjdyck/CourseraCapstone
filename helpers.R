# helpers.R

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

Clean_ngram_Phrase <- function(string, n) {
  # Lowercase
  temp <- tolower(string)
  #' Remove everything that is not a number or letter (may want to keep more 
  #' stuff in your actual analyses). 
  temp <- stringr::str_replace_all(temp,"[^a-zA-Z\\s\\']", "")
  # Shrink down to just one white space
  temp <- stringr::str_replace_all(temp,"[\\s]+", " ")
  # Split it
  # temp <- stringr::str_split(temp, " ")[[1]]
  # Get rid of trailing "" if necessary
  # indexes <- which(temp == "")
  # if(length(indexes) > 0){
  #   temp <- temp[-indexes]
  # } 
  return(temp)
}

library(ngram)
calc_big_ngram <- function(data, ngram_length=2) {
  ng <- ngram(unlist(sapply(
    data, 
    function(x) {
        a <- ifelse(length(stringr::str_split(Clean_ngram_Phrase(x), " ")[[1]])>=ngram_length, Clean_ngram_Phrase(x), "")
    }
    ))
    , ngram_length
  )
  return(ngram)
}

