#Reading the Handbook
#Chapter 4
data(mtcars)
head(mtcars)
summary(mtcars)
class(mtcars$cyl)
mtcars$cyl <- factor(mtcars$cyl)
class(mtcars$cyl)
mtcars$cyl[1]#
mtcars$am <- factor(mtcars$am, 
                    levels=c(0,1),
                    labels=c("auto", "manual"))
head(mtcars[,c(1,7:9)])#
boxplot(mpg ~ cyl, data=mtcars)
boxplot(mpg ~ am*cyl, data=mtcars)
hist(mtcars$mpg)
xtabs(~ am, data=mtcars)
xtabs(~ cyl, data=mtcars)

plot(mtcars$cyl) #cannot use hist, as a histogramm needs numeric x values (not factors)
data(mtcars)
mtcars$am <- factor(mtcars$am, levels = c(0, 1), labels = c("auto", "manual"))

aggregate(mpg ~ am, data=mtcars, mean)
aggregate(mpg ~ am + cyl, data = mtcars, FUN = mean)

aggregate(mpg ~am+factor(cyl, levels=c("6","8","4")), data=mtcars, mean)


#PRACTICALS
#Practical 2


#Question 1
head(ToothGrowth)
?ToothGrowth
dim(ToothGrowth)
ToothGrowth
#how many received each dose
xtabs(~ dose, data=ToothGrowth)
#how many received each supp type
xtabs(~ supp, data=ToothGrowth)
#how many received each combination of dose and supplement type
xtabs (~ supp + dose, dat=ToothGrowth)

#2
#proportion of total guinea pigs received each combination of dose & supp
prop.table(xtabs(~ supp + dose, data = ToothGrowth))
prop.table(xtabs(~ supp + dose, data = ToothGrowth), margin = 1)
prop.table(xtabs(~ supp + dose, data = ToothGrowth), margin = 2)
?prop.table
#3
#max tooth length
aggregate(len ~ dose, data=ToothGrowth, max)
#For each combination of dose and supplement 
#type, what is the mean of the tooth lengths?
aggregate(len ~ supp+dose, data=ToothGrowth, mean)

#4
#boxplot tooth length for each dose
boxplot(len ~ dose, data=ToothGrowth)
#first two boxplots showing dose 0.5
boxplot(len ~ supp*dose, data = ToothGrowth)
#second boxplot
#Option1
ToothGrowth$supp <- factor(ToothGrowth$supp, levels=c("VC", "OJ"))
levels(ToothGrowth$supp)

boxplot(len ~ supp*dose, data=ToothGrowth)
#Option 2
boxplot(len ~ factor(supp, levels=c("VC", "OJ"))*dose, data=ToothGrowth)

#5
#Histogram
hist(ToothGrowth$len, breaks=15)
?seq

           