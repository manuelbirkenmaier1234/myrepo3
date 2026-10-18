#Handbook Reading for Practical 1 (Chapter 3)
neutro <- read.csv("neutrophils.csv")
head(neutro)
dim(neutro)
neutro <- read.csv("neutrophils.csv", header = FALSE)
head(neutro)

colnames(neutro) <- c("TypeA", "TypeB", "TypeC", "TypeD")
neutro
head(neutro, 10)
dim(neutro)
summary(neutro)
neutro[,1]
sum(neutro[,1])
sum(neutro[,2])
sum(neutro[,2], na.rm=TRUE)
colSums(neutro, na.rm=TRUE)
mean(neutro$TypeD, na.rm=TRUE)
mean(col(neutro))
colmean(neutro)
colMeans(neutro)
col(neutro)


#Practical 1 of Practical exercises

#Question1
films <- read.csv("films.csv")
head(films)
dim(films)
#Question 2
colnames(films)

#Question 3
films[35:70, 4]
films[35:79,1:4]
#Question 4
class(films$numVotes)
#Question 5
sum(films$numVotes) / length(films$numVotes)
mean(films$numVotes)

#Question 6
colMeans(films[,c("averageRating", "numVotes", "startYear")])
summary(films[,c("averageRating", "numVotes", "startYear")])






