# https://hub.docker.com/r/rocker/geospatial/tags
FROM rocker/geospatial:3.6.3
MAINTAINER Jonathan Callahan <jonathan@mazamascience.com>


# For MazamaSpatialUtils
RUN install2.r --error -r "https://cran.rstudio.com" \
    maps \
    rmapshaper \
    MazamaSpatialUtils

# Add spatial data required by MazamaSpatialUtils
RUN mkdir -p /home/mazama/data/Spatial \
  && wget -nv http://mazamascience.com/RData/Spatial/mazama_spatial_files-0.6.tar.gz \
  && tar -xzf mazama_spatial_files-0.6.tar.gz -C /home/mazama/data/Spatial \
  && rm mazama_spatial_files-0.6.tar.gz
