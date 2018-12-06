#Write data as a geopackage format, based on tmaptools::write_shape

#'
#' @param shp spatial*
#' @export
write_gpkg <- function (shp, file) {
  shpname <- deparse(substitute(shp))
  dir <- dirname(file)
  base <- basename(file)
  if (!file.exists(dir))
    stop("unknown directory", call. = FALSE)
  if (substr(base, nchar(base) - 4, nchar(base)) == ".gpkg")
    base <- substr(base, 1, nchar(base) - 5)
  if (inherits(shp, c("sf", "sfc")))
    shp <- as(shp, "Spatial")
  if (!inherits(shp, "Spatial"))
    stop("shpname is not a Spatial object", call. = FALSE)
  rgdal::writeOGR(obj=shp, dsn = dir %+% "/" %+% file, layer = base, driver = "GPKG", overwrite_layer = TRUE)
}

