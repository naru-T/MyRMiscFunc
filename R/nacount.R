# count how many NAs are in the vector
#' @param x vector
#' @return nacount
#' @export
nacount <- function(x){sum( is.na(x) ) }
