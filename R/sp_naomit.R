## Remove NA included rows in sp data
# remove na rows by taking a great script given at http://gis.stackexchange.com/questions/89512/r-dealing-with-missing-data-in-spatialpolygondataframes-for-moran-test
#' @param x SpatialPointsDataFrame or SpatialPolygonsDataFrame
#' @return SpatialPointsDataFrame or SpatialPolygonsDataFrame
#' @export
#'
sp_naomit <- function(x, margin=1) {
  if (!inherits(x, "SpatialPointsDataFrame") & !inherits(x, "SpatialPolygonsDataFrame"))
    stop("MUST BE sp SpatialPointsDataFrame OR SpatialPolygonsDataFrame CLASS OBJECT")
  na.index <- unique(as.data.frame(which(is.na(x@data),arr.ind=TRUE))[,margin])
  if(margin == 1) {
    cat("DELETING ROWS: ", na.index, "\n")
    return( x[-na.index,]  )
  }
  if(margin == 2) {
    cat("DELETING COLUMNS: ", na.index, "\n")
    return( x[,-na.index]  )
  }
}

#' @example
#'  data.sp <- sp.na.omit(data.sp)
