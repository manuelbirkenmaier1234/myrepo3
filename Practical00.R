id <- c("REF001", "REF002", "REF003", "REF004", "REF0055", "REF006")
house.prices <- c(100, 200, 1000, 50, 500, 500)
no.bedrooms <- c(1,2,5,1,3,2)
parking <- c("YES", "YES", "YES", "NO", "YES", "YES")

property <- data.frame(id, house.prices, no.bedrooms, parking)
property

colnames(property) <- c("ID", "price", "beds", "park")
property

property <- cbind(property,   # An existing data frame
                  bathrooms=c(1, 1, 3, 1, 2, 2),   # First new column
                  city.centre=c("No", "No", "Yes", "No", "Yes", "No")) # Second new column

property

property.partA <- property[,1:4]
property.partB <- property[3:6, c(1,2,4:6)]

print(property.partA)
print(property.partB)

merge(property.partA, property.partB, all=TRUE, by="ID")
merge(property.partA, property.partB, all=TRUE)


intersect(names(property.partA), names(property.partB))
names(property.partA)
colnames(property.partA)
