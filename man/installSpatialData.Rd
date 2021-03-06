% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/installSpatialData.R
\name{installSpatialData}
\alias{installSpatialData}
\title{Install spatial datasets}
\usage{
installSpatialData(
  urlBase = "http://data.mazamascience.com/MazamaSpatialUtils/Spatial",
  file = "mazama_spatial_files-0.6.tar.gz"
)
}
\arguments{
\item{urlBase}{location of spatial data files}

\item{file}{name of the tar.gz file containing spatial datasets}
}
\value{
Nothing.
}
\description{
Install spatial datasets found  at \code{url} into the directory 
previously set with \code{setSpatialDataDir()}.
}
\keyword{environment}
