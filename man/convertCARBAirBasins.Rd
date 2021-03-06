% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/convertCARBAirBasins.R
\name{convertCARBAirBasins}
\alias{convertCARBAirBasins}
\title{Convert California Air Resources Board basin shapefiles}
\usage{
convertCARBAirBasins(nameOnly = FALSE, simplify = FALSE)
}
\arguments{
\item{nameOnly}{Logical specifying whether to only return the name without 
creating the file.}

\item{simplify}{Logical specifying whether to create "_05", _02" and "_01" 
versions of the file that are simplified to 5\%, 2\% and 1\%.}
}
\value{
Name of the dataset being created.
}
\description{
Returns a SpatialPolygonsDataFrame for CARB air basins,

The California Air Basins layer is a polygon shapefile coverage representing 
the 15 California air basins, as defined in state statute and regulation.  
See the California Health and Safety Code, Section 39606 et seq. and 
California Code of Regulations, Title 17, Section 60100 et seq.

Air Basins are designated pursuant to California statute and regulation.  
Air Basins identify regions of similar meteorological and geographic conditions 
and consideration for political boundary lines, and are related to air 
pollution and its transport.
}
\note{
March, 2004 version.
}
\references{
\url{https://www.arb.ca.gov/ei/gislib/gislib.htm}
}
\keyword{datagen}
