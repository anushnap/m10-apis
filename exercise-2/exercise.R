### Exercise 2 ###

# As you noticed, it often takes multiple queries to retrieve the desired information.
# This is a perfect situation in which writing a function will allow you to better structure your
# code, and give a name to a repeated task.
library(jsonlite)
setwd('~/Documents/INFO-201/m10-apis/exercise-2')


# Write a function that allows you to specify an artist, and returns the top 10 tracks of that artist
Top10 <- function(artist) {
  artist <- "adele"
  base <- "https://api.spotify.com/v1/"
  artist.url <- paste0(base, "search?q=", artist, "&type=artist")
  artist.data <- fromJSON(artist.url)
  artist.id <- artist.data$artists$items$id[1]
  
  top.tracks.url <- paste0(base, "artists/", artist.id, "/top-tracks?country=us")
  top.tracks.data <- fromJSON(top.tracks.url)
  top.tracks <- top.tracks.data$tracks
}


# What are the top 10 tracks by Nelly?




### Bonus ### 
# Write a function that allows you to specify a search type (artist, album, etc.), and a string, 
# that returns the album/artist/etc. page of interest


# Search albums with the word "Sermon"

