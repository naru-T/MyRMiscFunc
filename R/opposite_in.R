#opposite of %in%
#https://stackoverflow.com/questions/5831794/opposite-of-in

opposite_in <- function(){
  function(x,y)!('%in%'(x,y))
}

#' @export
`%!in%` <- opposite_in()
