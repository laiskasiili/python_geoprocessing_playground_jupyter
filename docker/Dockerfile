FROM python:3.9-slim-bullseye

LABEL description="Various python geoprocessing components \
(geopandas, gdal bindings, rasterio, ...) with dependiencies neatly working together."

RUN mkdir /geo
WORKDIR /geo

# Install GDAL
RUN apt update && apt install -y binutils libproj-dev gdal-bin libgdal-dev

# Install Python GDAL bindings
# Kudos to these people:
# https://gis.stackexchange.com/questions/28966/python-gdal-package-missing-header-file-when-installing-via-pip
RUN apt install -y python3-dev build-essential
ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
ENV C_INCLUDE_PATH=/usr/include/gdal
RUN pip install --upgrade pip && pip install --global-option=build_ext --global-option="-I/usr/include/gdal" GDAL==`gdal-config --version`

# Install python packages for geoprocessing and workflow
RUN pip install \
    # Shapely does planar geometric processing (uses GEOS).
    shapely \
    # Fiona reads and writes everything (uses OGR).
    fiona \
    # Pyproj handles projections (uses PROJ).
    pyproj \
    # Rtree spatial indexing (plays well with geopandas).
    Rtree \
    # Openpyxl is required by geopandas to write excel files.
    openpyxl \
    # Matplotlib is required by geopandas to visualize geometries.
    matplotlib \
    # Geopandas extends pandas with geospatial capabilities
    # (uses shapely, fiona, pyproj, Rtree, ...)
    geopandas \
    # Rasterio makes working with rasters fun (uses GDAL).
    rasterio \
    # Xarray deals with multidimensional data. Ideal to read/writes netCDF files.
    xarray \
    # Various io plugins to read/write data in xarray, e.g. netCDF, GRIB,...
    xarray[io] \
    # As of 20220401 there is a bug in xarray[io] for ecmw. Explicitly install ecmwflibs
    # here, but in future xarray[io] should suffice.
    ecmwflibs \
    # Extension of xarray to seamlessly interface with rasterio for 2D raster data.
    rioxarray \
    # Jupyterlab allows to write rich scripts (notebooks) and run code interactively in the browser.
    jupyterlab

# TODO:
# Install QGIS and make PyQGIS available in notebooks as kernel.
# Judging from first research this is going to be non-trivial.

# Setup to run jupyterlab when starting container
RUN mkdir /scripts
COPY ./start_jupyter.sh /scripts/start_jupyter.sh
RUN ["chmod", "+x", "/scripts/start_jupyter.sh"]
CMD ["/scripts/start_jupyter.sh"]
#CMD ["/bin/bash"]
