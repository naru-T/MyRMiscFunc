#spatial mean function based on k nearest neighbors
#' @param shp spatial data
#' @param varname variable names which are used
#' @param nb neibors list
#' @export
spatialmean_func <- function(shp, varname, nb){
  shp_nacount <- apply(shp@data[,varname],1,is.na)

  if(!all(shp_nacount==FALSE)){

    for(i in 1:table(shp_nacount)[2]){
      nb_specific <- nb[[which(shp_nacount)[i]]]

      shp@data[which(shp_nacount)[i], varname] <- shp@data[nb_specific,] %>%
        as.matrix() %>%
        c() %>%
        mean(.,na.rm=TRUE)
    }
  }
  return(shp)
}
