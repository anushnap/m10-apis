### Exercise 5 ###
library(jsonlite)
library(dplyr)

# Write a function that allows you to specify a movie, then does the following:
Movie <- function(movie) {
  # Remove spaces from movie title
  no.spaces <- gsub(" ", "+", movie)
  base <- "https://api.nytimes.com/svc/movies/v2/reviews/search.json?"
  api.key <- "&api-key=b6b10475121545bcb57a32c6d725d336"
  # Construct a search query using YOUR api key
  query <- paste0(base, "query='", no.spaces, "'", api.key)
  
  # The base URL is https://api.nytimes.com/svc/movies/v2/reviews/search.json?
  # See the interactive console for more detail:https://developer.nytimes.com/movie_reviews_v2.json#/Console/GET/reviews/search.json
  
  
  # Request data using your search query
  data <- fromJSON(query)
  
  # What type of variable does this return?
  
  # Flatten the data stored in the `$results` key of the data returned to you
  flat <- flatten(data$results)
  
  # From the most recent review, store the headline, short summary, and link to full article each in their own variables
  headline <- flat$headline
  short.sum <- flat$summary_short
  link <- flat$link.url
  
  # Return an list of the three pieces of information from above
  info <- list(headline, short.sum, link)
  return (info)
}  

  

# Test that your function works with a movie of your choice

