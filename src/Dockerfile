FROM python:3.9-slim@sha256:f4efbe5d1eb52c221fded79ddf18e4baa0606e7766afe2f07b0b330a9e79564a

LABEL description="Various python geoprocessing components \
(geopandas, gdal bindings, rasterio, ...) with dependiencies neatly working together."

# Install GDAL & Python bindings
# Kudos: https://gis.stackexchange.com/questions/28966/python-gdal-package-missing-header-file-when-installing-via-pip
RUN apt update && apt install -y binutils libproj-dev gdal-bin libgdal-dev python3-dev build-essential
ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
ENV C_INCLUDE_PATH=/usr/include/gdal
RUN pip install --upgrade pip && pip install --global-option=build_ext --global-option="-I/usr/include/gdal" GDAL==`gdal-config --version`

# Install python packages for geoprocessing and workflow:
# -------------------------------------------------------
# Shapely: Does planar geometric processing (uses GEOS).
# Fiona: Reads and writes everything (uses OGR).
# Pyproj: Handles projections (uses PROJ).
# Rtree: Spatial indexing (plays well with geopandas).
# Openpyxl: Is required by geopandas to write excel files.
# Matplotlib: Is required by geopandas to visualize geometries.
# Geopandas: Extends pandas with geospatial capabilities (uses shapely, fiona, pyproj, Rtree, ...)
# Rasterio Makes working with rasters fun (uses GDAL).
# Xarray: Deals with multidimensional data. Ideal to read/writes netCDF files.
# Xaaray[io]: Various io plugins to read/write data in xarray, e.g. netCDF, GRIB,...
# Ecmwflibs: Install because of bug in xarray[io] as of 20210104, but in future xarray[io] should suffice.
# Rioxarray: Extension of xarray to seamlessly interface with rasterio for 2D raster data.
# Jupyterlab: Allows to write rich scripts (notebooks) and run code interactively in the browser.
RUN mkdir /geo
WORKDIR /geo
COPY ./requirements.txt /geo/requirements.txt
RUN pip install -r /geo/requirements.txt

# TODO:
# Install QGIS and make PyQGIS available in notebooks as kernel.
# Judging from first research this is going to be non-trivial.

# Setup to run jupyterlab when starting container
RUN mkdir /scripts
COPY ./start_jupyter.sh /scripts/start_jupyter.sh
RUN ["chmod", "+x", "/scripts/start_jupyter.sh"]
CMD ["/scripts/start_jupyter.sh"]
