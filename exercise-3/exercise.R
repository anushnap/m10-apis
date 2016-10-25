### Exercise 3 ###
library(jsonlite)
library(dplyr)
# Use the `load` function to load in the nelly_tracks file.  That should make the data.frame
# `top_nelly` available to you
setwd('~/Documents/INFO-201/m10-apis/exercise-3')
load('nelly_tracks.RData')
# Use the `flatten` function to flatten the data.frame -- note what differs!
flat.top.nelly <- flatten(top.nelly)

# Use your `dplyr` functions to get the number of the songs that appear on each albumt
n.songs <- flat.top.nelly %>%
  group_by(album.name) %>%
  summarize(n = n())
  arrange(desc(n))


# Bonus: perform both of the steps above in one line (one statement)
