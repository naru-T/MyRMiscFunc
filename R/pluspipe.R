#plus_pipe
plus_pipe <- function(){
  {
    function(x,y){ paste0(x,y)}
  }

}


#' plus_pipe
#'
#' @return characters
#' @export
#'
`%+%` <- plus_pipe()

#' @examples
#' "A" %+% "B" %+% "C"
#' "hoge_" %+% c("A" %+% 1:4 , "B" %+% 1:4)
