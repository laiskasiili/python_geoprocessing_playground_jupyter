# pythonGeoprocessingPlayground
## What is this about?
This repository is primarily a playground for me to do first baby steps in expanding my horizon towards the devops world to learn about containerization, CI/CD, etc.

The goal is to make it easy and fun to experiment with Python's geoprocessing ecosystem without worrying about the sometimes tedious installation of dependencies (yes, I am looking at you GDAL and geopandas). The dockerfile in this repository allows to spin up a jupyterlab instance whose kernel has access to many common packages like Fiona, Shapely, Geopandas, Rasterio, etc. which work neatly together. Concentrate on the fun part of exploring the tools and processing your data without worrying about setup.

## Run with image from github package repository

1. Make sure you have docker engine installed. This might be a little fiddly, just stick to the [documentation](https://docs.docker.com/engine/install/). Make sure that after installation docker engine is actually up and running. You are good when the following terminal command returns some kind of version instead of an error :pray:
```console
docker --version
```

2. Almost there! Select a path on your system you want to be accessible through jupyterlab and replace <MOUNT_PATH> in the command below with this path. Run the command.

```console
docker run -it --rm -p 8888:8888 --volume="<MOUNT_PATH>":"/geo/data" ghcr.io/laiskasiili/python_geoprocessing_playground_jupyter:v0.0.3
```

The first run will take osme time because a lot of data is being downloaded, subsequent runs of this command will take merely a second. After some time you should see a link in the terminal containing 127.0.0.1... - open it in your browser to open jupyterlab. Opening the data folder in the left pane will show you the content of <MOUNT_PATH>. Make sure to save everything you want to be persisted over time in this folder.

3. When you are done, just hit Ctrl + C in the terminal to shut down the container and jupyterlab. Run the command above to start a new jupterlab session.

## How to clean up all of this stuff I did above?
To completely clean up all traces from the steps above, open Docker Desktop and remove the image you see in the images tab. Then uninstall Docker Desktop.