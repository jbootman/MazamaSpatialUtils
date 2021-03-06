% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/convertTMWorldBordersSimple.R
\name{convertTMWorldBordersSimple}
\alias{convertTMWorldBordersSimple}
\title{Convert (Simple) World Borders Shapefile}
\usage{
convertTMWorldBordersSimple(nameOnly = FALSE)
}
\arguments{
\item{nameOnly}{logical specifying whether to only return the name without creating the file}
}
\value{
Name of the dataset being created.
}
\description{
Returns a SpatialPolygonsDataFrame for a simple world divisions
}
\details{
A world borders shapefile is downloaded and converted to a
SpatialPolygonsDataFrame with additional columns of data. The resulting file will be created
in the package \code{SpatialDataDir} which is set with \code{setSpatialDataDir()}.

This shapefile is a greatly simplified version of the TMWorldBorders shapefile and is especially suited
for spatial searches. This is the default dataset used in \code{getCountry()} and \code{getCountryCode()}.
Users may wish to use a higher resolution dataset when plotting.
}
\references{
\url{http://thematicmapping.org/downloads/}
}
\seealso{
setSpatialDataDir

getCountry, getCountryCode
}
\keyword{datagen}
