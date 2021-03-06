% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getSpatialData.R
\name{getSpatialData}
\alias{getSpatialData}
\title{Return spatial data associated with a set of locations}
\usage{
getSpatialData(lon, lat, SPDF, useBuffering = FALSE, verbose = FALSE)
}
\arguments{
\item{lon}{Vector of longitudes in decimal degrees.}

\item{lat}{Vector of latitudes in decimal degrees.}

\item{SPDF}{Object of class SpatialPolygonsDataFrame.}

\item{useBuffering}{Logical flag specifying the use of location buffering to 
find the nearest polygon if not target polygon is found.}

\item{verbose}{Logical flag controlling detailed progress statements.}
}
\value{
Vector or dataframe of data.
}
\description{
All locations are first converted to \code{SpatialPoints} 
objects. The \pkg{sp::over()} function is then used to determine which 
polygon from \code{SPDF} each location falls in. The dataframe row associated 
with each polygon is then associated with each location.
}
\details{
Occasionally for coastal locations the precise coordinates
lie outside the boundaries of a low resolution SpatialPolygonsDataFrame.
To account for this any location that remains unassociated after the first 
pass is then buffered to create a small circle around the original location. 
All polygons are then checked to see if there is any intersection with the 
now larger buffered locations. Each point is then checked for an intersecting 
polygon at the following radii: 1km, 2km, 5km, 10km, 20km, 50km, 100km, 200km.
If a buffered location is more than 200km away from any polygon, a value of 
\code{NA} (or data frame row with all \code{NA}s) is returned for that 
location.

Missing or invalid values in the incoming \code{lon} or \code{lat} vectors 
result in \code{NA}s at those positions in the returned vector or data frame.
}
\keyword{locator}
