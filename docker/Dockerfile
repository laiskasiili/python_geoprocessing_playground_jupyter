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

# Install further geo-python and work-tool dependencies
RUN pip install shapely fiona pyproj Rtree openpyxl geopandas rasterio matplotlib jupyter jupyterlab

# TODO: Install QGIS and make PyQGIS available in notebooks (this is goind to be painful O.o )
# RUN apt install -y wget gnupg software-properties-common
# RUN wget -qO - https://qgis.org/downloads/qgis-2021.gpg.key | gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/qgis-archive.gpg --import
# RUN chmod a+r /etc/apt/trusted.gpg.d/qgis-archive.gpg
# RUN add-apt-repository "deb https://qgis.org/ubuntu $(lsb_release -c -s) main"
# RUN apt install -y python3-qgis qgis qgis-plugin-grass
# ENV PYTHONPATH=/usr/share/qgis/python
# ENV LD_LIBRARY_PATH=/usr/lib

# Setup to run jupyter when starting container
RUN mkdir /scripts
COPY ./start_jupyter.sh /scripts/start_jupyter.sh
RUN ["chmod", "+x", "/scripts/start_jupyter.sh"]
CMD ["/scripts/start_jupyter.sh"]
#CMD ["/bin/bash"]
