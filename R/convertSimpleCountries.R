#' @keywords datagen
#' @title Convert (Simple) World Borders Shapefile
#' @param nameOnly logical specifying whether to only return the name without creating the file
#' @description Returns a SpatialPolygonsDataFrame for a simple world divisions
#' @details A world borders shapefile is downloaded and converted to a
#' SpatialPolygonsDataFrame with additional columns of data. The resulting file will be created
#' in the package \code{SpatialDataDir} which is set with \code{setSpatialDataDir()}.
#'
#' This shapefile is a greatly simplified version of the TMWorldBorders shapefile and is especially suited
#' for spatial searches. This is the default dataset used in \code{getCountry()} and \code{getCountryCode()}.
#' Users may wish to use a higher resolution dataset when plotting.
#' @note This is a non-exported function used only for updating the package dataset.
#' @return Name of the dataset being created.
#' @references \url{http://thematicmapping.org/downloads/}
#' @seealso setSpatialDataDir
#' @seealso getCountry, getCountryCode
convertSimpleCountries <- function(nameOnly=FALSE) {

  # NOTE:  This function only needs to be run once to update the package SimpleTimezones
  # NOTE:  dataset. It is included here for reproducibility.
  
  # NOTE:  This function should be run wile working with the package source code.
  # NOTE:  The working directory should be MazamaSpatialUtils/ and the resulting
  # NOTE:  .RData file will be kept in the data/ directory
  
  sourceCodeDir <- getwd()
  
  # Use package internal data directory
  dataDir <- getSpatialDataDir()

  # Specify the name of the dataset and file being created
  datasetName <- 'SimpleCountries'

  if (nameOnly) return(datasetName)

  # Build appropriate request URL for TM World Borders data
  url <- 'http://thematicmapping.org/downloads/TM_WORLD_BORDERS-0.3.zip'
  
  filePath <- file.path(dataDir,basename(url))
  utils::download.file(url,filePath)
  # NOTE:  This zip file has no directory so extra subdirectory needs to be created
  utils::unzip(filePath,exdir=file.path(dataDir,'world'))

  # Convert shapefile into SpatialPolygonsDataFrame
  # NOTE:  The 'world' directory has been created
  dsnPath <- file.path(dataDir,'world')
  SPDF <- convertLayer(dsn=dsnPath, layerName='TM_WORLD_BORDERS-0.3')

  # Rationalize naming:
  # * human readable full nouns with descriptive prefixes
  # * generally lowerCamelCase
  # with internal standards:
  # * countryCode (ISO 3166-1 alpha-2)
  # * stateCode (ISO 3166-2 alpha-2)
  # * longitude (decimal degrees E)
  # * latitude (decimal degrees N)
  # * area (m^2)

  # Relabel and standardize the naming in the SpatialPolygonsDataFrame
  names(SPDF) <- c('FIPS','countryCode','ISO3','UN_country','countryName',
                   'area','population2005','UN_region','UN_subregion',
                   'longitude','latitude')
  
  # NOTE:  http://conjugateprior.org/2013/01/unicode-in-r-packages-not/
  # Transliterate unicode characters for this package-internal dataset
  SPDF$countryName <- iconv(SPDF$countryName, from="UTF-8", to="ASCII//TRANSLIT")

  # Rationalize units:
  # * SI
  # NOTE:  Area seems to be in units of (10 km^2). Convert these to m^2
  SPDF$area <- SPDF$area * 1e7

  # Group polygons with the same identifier (countryCode)
  SPDF <- organizePolygons(SPDF, uniqueID='countryCode', sumColumns=c('area','population2005'))

  # Simplify to 5% of the vertices
  SPDF <- rmapshaper::ms_simplify(SPDF, 0.05)
  SPDF@data$rmapshaperid <- NULL
  
  # Assign a name and save the data
  assign(datasetName,SPDF)
  save(list=c(datasetName),file=paste0(sourceCodeDir,'/data/',datasetName,'.RData'))

  # Clean up
  unlink(filePath, force=TRUE)
  unlink(dsnPath, recursive=TRUE, force=TRUE)

  return(invisible(datasetName))
}

