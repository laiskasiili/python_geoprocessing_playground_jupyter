IMAGE_VERSION_TAG="v0.0.1"
MOUNT_PATH=$(pwd)

docker run -it --rm -p 8888:8888 --volume="$MOUNT_PATH":"/geo/data" ghcr.io/laiskasiili/python_geoprocessing_playground_jupyter:$IMAGE_VERSION_TAG