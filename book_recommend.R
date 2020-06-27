book <- read.csv(file.choose())
View(book)
str(book)

library("recommenderlab")
library(caTools)

book_data <- book[-c(1,2)]

#rating distribution
hist(book$ratings...3.)

#inorder to build Recommendation System
book_rating_matrix <- as(book_data, 'realRatingMatrix')

#popularity based
book_model <- Recommender(book_rating_matrix, method="POPULAR")

getModel(book_model)

recommenderRegistry$get_entry("POPULAR", dataType="realRatingMatrix")
recommenderRegistry$get_entry("SVD", dataType="realRatingMatrix")

#Predictions for two users 
recommended_items1 <- predict(book_model, book_rating_matrix[450:451])
as(recommended_items1, "list")

#User Based Collaborative Filtering
#book_model2 <- Recommender(book_rating_matrix, method="UBCF")
#recommended_items2 <- predict(book_model2, book_rating_matrix[450:451], n=5)
#as(recommended_items2, "list")

######################3

book_author_matrix <- as(book_data, 'realRatingMatrix')

#popularity based
book_author_model <- Recommender(book_author_matrix, method="POPULAR")

getModel(book_author_model)

#Predictions for two users 
recommended_authors <- predict(book_author_model, book_author_matrix[450:451])
as(recommended_authors, "list")

##############################

book_publisher_matrix <- as(book_data, 'realRatingMatrix')

#popularity based
book_publisher_model <- Recommender(book_publisher_matrix, method="POPULAR")

getModel(book_publisher_model)

#Predictions for two users 
recommended_publishers <- predict(book_publisher_model, book_publisher_matrix[450:451])
as(recommended_publishers, "list")

## got the same result
