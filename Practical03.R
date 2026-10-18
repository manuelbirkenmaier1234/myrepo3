#Course Handbook
#Chapter 5: Subsetting and Filtering data

a <- seq(101,110, by =2)
a[3:5]
a[c(1,4,5)]
b <- 3
a[b]
head(property)
property <- data.frame(id=c("REF001", "REF002", "REF003", "REF004", "REF005", "REF006"),
                       house.prices=c(100, 200, 1000, 50, 500, 500),
                       no.bedrooms=c(1, 2, 5, 1, 3, 2),
                       parking=c("Yes", "Yes", "Yes", "No", "Yes", "Yes"),
                       type=c("terrace", "terrace", "detached", "flat", "detached", "detached"),
                       bathrooms=c(1, 1, 3, 1, 2, 2),
                       city.centre=c("No", "No", "Yes", "No", "Yes", "No"))

property                       

property$house.prices == 500
property$house.prices > 300
which(property$house.prices > 300)

expensive.houses <- which(property$house.prices > 300)
property$house.prices[expensive.houses]

head(property)
property[which(property$house.prices > 300), 
          c("id", "house.prices", "parking")]
nice.houses <- subset(property, house.prices > 300 
                      & parking == "Yes", select = -parking)
nice.houses
dim(nice.houses)
head(property)


#Practical
#3

#Question 1
head(films)
films[,"originalTitle"]
colnames(films)
#Option 1
col.to.change <- colnames(films) == "originalTitle"
col.to.change
names(films)[col.to.change] <- "Title"
colnames(films)
#Option 2
read.csv("films.csv")
colnames(films)
col.to.change2 <- which(colnames(films) == "titleType")
col.to.change2
?read
#readBin#Question 2
films <- subset(films, select = c("tconst", "averageRating", 
                                  "numVotes", "titleType", 
                                  "primaryTitle", "startYear",
                                  "genres"))                                  
head(films)
dim(films)
#Question 3a
a <- unique(films$titleType)
films$titleType <- factor(films$titleType)
films$titleType
#Question 3b
summary(films[films$titleType == "short", "averageRating"])
?subset
summary(subset(films, films$titleType == "movie", "averageRating"))
summary(subset(films, films$titleType == "tvMovie", select = "averageRating"))

#Question 4
head(films)
only.movie <- films$titleType == "movie"
only.movie
movies.only <- films[only.movie,]
head(movies.only)



#Question 5
#Option 1
movies.only.fltr <- subset(x = movies.only,
                          averageRating > 7.5 & 
                             numVotes > 100)
dim(movies.only.fltr)
head(movies.only.fltr)
#Option 2
pop.movies.only <- movies.only$averageRating > 7.5 & movies.only$numVotes > 100
pop.movies.only

df.pop.movies.only <- movies.only[pop.movies.only,]

head(df.pop.movies.only)
