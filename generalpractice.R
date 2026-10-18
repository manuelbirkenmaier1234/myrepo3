install.packages("tidyverse")
library(tidyverse)

neutro <- read.csv("neutrophils.csv", header = FALSE)
neutro
colnames(neutro) <- c("TypeA", "TypeB", "TypeC", "TypeD")
colnames.neutro <- colnames(neutro)
class(colnames.neutro)

data(mtcars)
head(mtcars)

data(mtcars)
mtcars$cyl <- factor(mtcars$cyl, 
                     levels = c("4", "6", "8"),
                     labels = c("low.cyl", "middle.cyl", "high.cyl"))
class(mtcars$cyl)
mtcars$cyl

mtcars$cyl
head(mtcars)
boxplot(hp ~ cyl*am, data = mtcars)

mtcars[,1]

sum(mtcars$hp)
mean(mtcars$hp)
sd(mtcars$hp)
data(mtcars)
head(mtcars)


#







hist(mtcars$mpg, breaks = seq(10, 34, by=4))
plot(mtcars$mpg, mtcars$disp, data=mtcars)
plot(mpg~ disp, data=mtcars)
plot(mpg~ cyl, data=mtcars)

xtabs(~ cyl, data=mtcars)
aggregate(hp ~cyl, data=mtcars, mean)
head(mtcars)
xtabs(~ am + cyl, data=mtcars)
prop.table(xtabs(~am + cyl, data=mtcars), margin = 2)




#Practical 2 rehearsal

head(ToothGrowth)
dim(ToothGrowth)
xtabs(~ dose, data=ToothGrowth)
xtabs(~ dose + supp, data=ToothGrowth)
xtabs(~supp, data=ToothGrowth)
prop.table(xtabs(~dose + supp, data=ToothGrowth), margin = NULL)
?aggregate
aggregate(len ~ dose, data=ToothGrowth, min)
aggregate(len ~ dose + supp, data=ToothGrowth, mean)
ToothGrowth$supp <- factor(ToothGrowth$supp, levels = c("VC", "OJ"))
boxplot(len ~dose*supp, data=ToothGrowth)
data("ToothGrowth")

boxplot(len ~ dose*factor(supp, levels = c("VC", "OJ")), data=ToothGrowth)
hist(ToothGrowth$len, breaks = 10)

#Practical 3 rehearsal
films <- read.csv("films.csv")
head(films)
films <- films |> 
  select(-X)
which(colnames(films) == "originalTitle")
colnames(films)[which(colnames(films) == "originalTitle")] <- "Title"
colnames(films)
dim(films)
sbst.films <- films %>%
  select("tconst", "averageRating", "numVotes", "titleType",
         "primaryTitle", "startYear", "genres")
head(sbst.films)
dim(sbst.films) 
unique(sbst.films$titleType)
summary(sbst.films$averageRating[sbst.films$titleType == "tvMovie"])

movies.only <- sbst.films[sbst.films$titleType == "movie",]
head(movies.only)
pop.movies.only <- movies.only %>%
  subset(subset = averageRating > 7.5 & numVotes > 100)
dim(pop.movies.only)
dim(pop.movies.only)

#practical 4 rehearsal
#Question