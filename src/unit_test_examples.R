# testing testthat

#requires packages:
install.packages('testthat')
install.packages('devtools')
install.packages('remotes')

library(testthat)

# create a fucntion that takes any numeric data frame, finds the mean of all col, then find the max col mean, then the min col mean from that data frame and returns those min & max values in a vector (min_mean_value, max_mean_value)

# apply(X = df, MARGIN = 2, FUN = mean, na.rm = TRUE)

#' This function calculates the mean for each column in a dataset, then identifies the minimum and maximum mean of those columns, and returns the min and max means as a vector
#'
#' @param df This is the dataframe you want to work with
#'
#' @return
#' @export
#'
#' @examples
mean_range <- function(df) {
  col_means <- apply(df, 2, mean, na.rm = TRUE)
  max_col_mean <- max(col_means)
  min_col_mean <- min(col_means)
  return(c(min_col_mean, max_col_mean))
}

mean_range(mtcars)

# run some tests on this

expect_length(mean_range(df = mtcars), 2)

# if you run this and nothing happens, the function is passing the test

# if you say you expect the output to be 3, it gives you an error


expect_length(mean_range(df = mtcars), 3)

#test if the first vector is less than the second vector

expect_true(mean_range(df = mtcars)[1] < mean_range(mtcars)[2])
#this should return nothing because it is true
#if you change the direction from < to >, you will get an error because it is not true that the min > max
# you cannot replace mean_range(df = mtcars)[1] with min_col_mean because that object was NOT stored, it was created intermittently in the function you wrote

# A data frame is built from a list:
#expect_type(x, "list")

#typeof(mean_range(mtcars))

expect_type(mean_range(mtcars), "double")
#returns nothing beause this is true
expect_type(mean_range(mtcars), "character")
#returns error




