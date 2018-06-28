library(rtweet)
library(tidytext)
library(tidyverse)


kanye <-
  search_tweets(
  '#kanye',
  n = 2000,
  include_rts = FALSE
)

kanye_tbl <-
  kanye %>% 
  unnest_tokens(word,
                text)

kanye_tbl <-
  kanye_tbl %>% 
  anti_join(stop_words)

kanye_tbl <-
  kanye_tbl %>% 
  count(word,
        sort = TRUE)

kanye_tbl <-
  kanye_tbl %>% 
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

wordcloud2::wordcloud2(kanye_tbl,
                       size = 1.5)
