
#devtools::install_github('juliasilge/tidytext')
#install.packages(c('tidytext', 'caret', 'tm'))
#install.packages(c('dplyr', 'tidydata', 'ggplot2'))
library(tidytext)
library(dplyr)
library(tidyr)
#library(tibble)

# d <- read.csv('./data/WriteOffs.csv', stringsAsFactors = FALSE, encoding = 'latin1') %>%
d <- read.csv('./data/jira_pass_issue_vw.csv', stringsAsFactors = FALSE, encoding = 'latin1') %>%
  tbl_df() %>% 
  filter(!grepl('06', REGION)) %>%
  filter(!grepl('Woodstock', FIELD)) %>%
  filter(!grepl('Charlottetown', FIELD)) %>%
  filter(!grepl('Casselman', FIELD))

# french adjustment types
# d$ADJUSTMENT_TYPE %in% c("Ajustements à l'assurance", 'Décaissement', 'Décaissement')
data("stop_words")

tidy_docs <- d[which(grepl('06', d$REGION)==FALSE), c('ID', 'DESCRIPTION')] %>%
  setNames(c('id', 'text')) %>%
  unnest_tokens(word, text) %>%
  anti_join(stop_words)


# count words
tidy_docs %>%
  count(word, sort = TRUE) 

tidy_docs$numbers <- ifelse(
  grepl('[0-9]+(\\.[0-9][0-9]?)?', tidy_docs$word),
  as.numeric(tidy_docs$word),
  NA
)
dollar_size <- function(dollar_num) {
  if (is.na(dollar_num)) {
    ret <- NA
  } else if (dollar_num < 100) {
    '< 100'
  } else if (dollar_num < 500) {
    '100 < x < 500'
  } else {
    '>= 500'
  }
}
tidy_docs$size <- sapply(tidy_docs$numbers, dollar_size)

tidy_docs %>%
  count(size, sort = TRUE) 


####
tidy_docs %>%
  count_dollars(word)


count_dollars <- function(data, var) {
  data %>%
    group_by_(.dots = lazyeval::lazy(var)) %>%
    summarize(count_dollars = )
}





#get_sentiments("bing")


adj_sentiment <- tidy_docs %>%
  inner_join(get_sentiments("bing"), by = "word") %>% 
  count(id, sentiment) %>% 
  spread(sentiment, n, fill = 0) %>% 
  mutate(sentiment = positive - negative)