library(rtweet)
library(tidytext)
library(dplyr)
library(stringr)
library(wordcloud2)

create_token(
  app = 'riley_tweet',
  consumer_key = 'rhmDAMhXYy0cSFxa5KxXXHbUo',
  consumer_secret = '4IYEq3h0Ux4t58rHz2Ylb35qgIpu7DNfsUH207nKxIQ97jVma9'
)

dt <-
  search_tweets('#trump',
                n = 2000,
                include_rts = FALSE)

dt_table <-
  dt %>% 
  unnest_tokens(word, text)

dt_table <-
  dt_table %>% 
  anti_join(stop_words)

dt_table <-
  dt_table %>% 
  count(word,
        sort = TRUE)

dt_table <-
  dt_table %>%
  filter(
    !word %in% c(
      't.co',
      'https',
      'tvtime',
      'watched',
      'watching',
      'watch',
      'la',
      "it's",
      'el',
      'en',
      'tv',
      'je',
      'ep',
      'week',
      'amp',
      'de'
    )
  ) 

wordcloud2(dt_table,
           size = 1)
