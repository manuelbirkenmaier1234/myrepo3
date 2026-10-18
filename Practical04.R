#Course Workbook
#chapter 6

#loading packages
library(ggplot2)
install.packages("librarian")
library(librarian)
shelf(ggplot2) #checks if updates can be installed and loads package
shelf(tidyr)
#7.2 plot single variable
ggplot(data = mtcars, mapping = aes(x=wt)) + 
        geom_histogram(binwidth = 0.5)

ggplot(data = mtcars, mapping = aes(x =wt, y = mpg)) + 
        geom_point()
#making things look more professional
ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) + 
      geom_point() +
      labs(title = "Car weight against miles per gallon",
           subtitle = "For 32 cars",
           caption = "Data source: Some R course",
           x = "Weight (1000 lbs)",
           y = "Miles per gallon")

#assignming out plot to an object
myggplot <- ggplot(data = mtcars, mapping = aes(x = wt, y = mpg)) + 
  geom_point() +
  labs(title = "Car weight against miles per gallon",
       subtitle = "For 32 cars",
       caption = "Data source: Some R course",
       x = "Weight (1000 lbs)",
       y = "Miles per gallon")
myggplot

#now we can modify that object without having to type
#that code every time,

myggplot.pretty <- myggplot + theme_bw()
myggplot.pretty
?theme_update

#Scatterplots in Base R
plot(mpg ~ wt, data=mtcars)
class(mtcars$cyl)
mtcars$cyl <- as.factor(mtcars$cyl)
myplot2 <- ggplot(data = mtcars, aes(x=cyl, y=mpg)) + 
          geom_dotplot(binaxis = "y", stackdir="center", binwidth =0.5)
myplot2
ggplot(data = mtcars, mapping = aes(x=wt, y=mpg)) + 
      geom_point() + 
      facet_grid(rows=vars(cyl), cols=vars(am), labeller = label_both) + 
      theme_bw()
ggplot(data = mtcars, aes(x=wt, y=mpg, shape=cyl, col=cyl)) + 
      geom_point()

#using dataset "Orange"
head(Orange)
ggplot(Orange, aes(x=age, y=circumference, col=Tree)) + 
      geom_line()
#show count of categorical variables
mtcars$cyl <- factor(mtcars$cyl, levels = c("6", "4", "8"))
ggplot(mtcars, aes(x=cyl))+
  geom_bar()


myplot3 <- ggplot(mtcars, aes(x=factor(cyl, levels = c("8", "4", "6"), labels = c("high(8)", "low(4)", "middle(6)")))) +
              geom_bar() +
              xlab("cyl")
myplot3 + xlab("cyl2")         

#coloring the plot 
mtcars$am <- factor(mtcars$am, labels = c("auto", "manuel"))
myplot4 <- ggplot(mtcars, aes(x=cyl, fill=am)) + 
            geom_bar(position="dodge") + 
                       scale_fill_brewer(palette = "Set2") + 
            scale_y_continuous(expand = expansion(mult = c(0.01, 0.01)))
myplot4
ggsave("new-ggplot.pdf")
display.brewer.all()


counts2by2 <- table(mtcars$am, mtcars$cyl)
counts2by2
barplot(counts2by2, beside=TRUE) 
# What happens if we don't set beside=TRUE?


#Practial 04
#Question 1
plot5 <- ggplot(films, aes(x=averageRating, fill=titleType)) + 
        geom_histogram(bins = 35) +
        facet_grid(cols=vars(titleType)) + 
  scale_y_continuous(expand = expansion(mult = c(0.01, 0.03)))

plot5 + labs(
          title = "Average Movie Rating",
          subtitle = "For each movie type",
          caption = "Data source: df.films",
          x = "average Rating",
          y = "Number of films") + 
          scale_fill_brewer(palette = "Set1")
#Question 2
#boxplot of average rating by titleType
box.av.rating <- ggplot(data = films, 
                mapping = aes(x=titleType, y = averageRating, fill = titleType)) + 
                geom_boxplot() + 
              labs(title ="Average Movie Rating",
                   subtitle = "Boxplot for each movie type",
                   caption = "Data source: df.films",
                   x = "movie type",
                   y = "Average Rating")
box.av.rating

#Question 3
#scatterplot rating ~ start year (title type own color)

films.popular <- films[films$numVotes > 800,]

ggplot(films.popular, aes(x=startYear, y = averageRating,
                          colour=titleType)) + 
      geom_point() + 
      labs( title = "Average Movie Rating over start year",
            x = "start year",
            y = "average rating")

#Question 4
shelf(palmerpenguins)
head(penguins)
dim(penguins)

table(penguins$sex, penguins$species)
#scatterplots
penguins |> 
  drop_na(sex) |> 
ggplot(aes(x=body_mass_g, y = bill_length_mm, colour = interaction(species, sex))) + 
      geom_point() + 
      facet_grid(rows = vars(species), cols = vars(sex), labeller = label_both) + 
      labs(title = "Body mass (g) vs bill length (mm), per sex and species",
           x = "body mass (g)",
           y = "bill length (mm)")
      scale_color_brewer(palette = "Set1")
#Question 5a
#bar chart
penguins |> 
  ggplot(aes(x = island, fill = island)) + 
  geom_bar() + 
    labs(title = "Number of penguin on each islands")

#Question 5b
penguins |> 
  ggplot(aes(x = species, fill = species)) + 
  geom_bar() + 
  facet_grid(cols = vars(island)) + 
  labs(title = "Penguin Distribution over islands")


penguins |> 
  ggplot(aes(x = interaction(species, island), fill = species)) + 
  geom_bar() + 
   labs(title = "Penguin Distribution over islands by species")

#Question 6a
shelf(pastecs)
peng.mean <- mean(penguins$flipper_length_mm, na.rm = TRUE)
peng.sd <- sd(penguins$flipper_length_mm, na.rm = TRUE)  

#Question 6b
a <- rnorm(10000, mean = peng.mean, sd = peng.sd)
hist(a)

#Question 6c
hist(penguins$flipper_length_mm, xlim = c(140, 260))

#Question 6d
par(mfrow=c(2,1))

#Question 6e
same.limits = c(140, 260)
same.breaks = seq(140, 260, by = 5)
hist(penguins$flipper_length_mm, xlim = same.limits, main = "Flipper length data", breaks = same.breaks)
a <- rnorm(10000, mean = peng.mean, sd = peng.sd)
hist(a, main = "Simulated flipper length", xlim = same.limits, breaks = same.breaks)

#Question 6f
head(penguins$species)
fliplen.adelie <- penguins[penguins$species == "Adelie", "flipper_length_mm", na.rm = TRUE]
fliplen.chinstrap <- penguins[penguins$species == "Chinstrap", "flipper_length_mm", na.rm = TRUE]
fliplen.gentoo <- penguins[penguins$species == "Gentoo", "flipper_length_mm", na.rm = TRUE]
same.limits = c(160, 240)
same.yaxis = c(0, 50)
same.breaks = seq(140, 260, by = 5)

#BaseR
par(mfrow=c(3,1))
hist(fliplen.adelie$flipper_length_mm, xlim = same.limits, ylim = same.yaxis, main = "Flipper length Adelie")
hist(fliplen.chinstrap$flipper_length_mm, xlim = same.limits, ylim = same.yaxis, main = "Flipper length Adelie")
hist(fliplen.gentoo$flipper_length_mm, xlim = same.limits, ylim = same.yaxis, main = "Flipper length Adelie")

#ggplot
penguins |> 
  ggplot(aes(x = flipper_length_mm, fill = species)) + 
  geom_histogram() + 
  facet_grid(rows=vars(species)) + 
  labs(title = "Penguin flipper length",
       x= "Flipper length (mm)")
