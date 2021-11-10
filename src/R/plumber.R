library(tidyverse)
library(jsonlite)
library("mongolite")

# plumber.R

#* Teams back the input
#* @param msg The message to echo
#* @get /team
function(team="") {
    con2 <- mongo(collection = "data", url = "mongodb://charly:charlypass@mymongo:27017/test?authSource=admin&retryWrites=true&w=majority&ssl=false")
    mydata <- con2$find(paste0('{ "$or": [ { "HomeTeam" : "', team, '" }, { "AwayTeam" : "', team, '" } ] }'))
    toJSON(x=mydata)
}

#* ManyTeams back the input
#* @param msg The message to echo
#* @get /manyTeams
function(team1="", team2="") {
    con2 <- mongo(collection = "data", url = "mongodb://charly:charlypass@mymongo:27017/test?authSource=admin&retryWrites=true&w=majority&ssl=false")
    mydata <- con2$find(paste0('{ "$and": [ {"$or": [ { "HomeTeam" : "', team1, '" }, { "AwayTeam" : "', team1, '" } ]},  {"$or": [ { "HomeTeam" : "', team2, '" }, { "AwayTeam" : "', team2, '" } ] } ] }'))
    toJSON(x=mydata)
}
