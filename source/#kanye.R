library(rtweet)
library(tidytext)
library(tidyverse)


kanye <-
  search_tweets(
  '#kanye',
  n = 2000,
  include_rts = FALSE
)
