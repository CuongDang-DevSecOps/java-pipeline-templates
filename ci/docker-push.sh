echo "[DEBUG] Docker Push"

SERVICE_NAME=$1
DOCKER_USERNAME=$2
DOCKER_ACCESS_TOKEN=$3
DOCKER_HUB_REPOSITORY=$4
BUILD_VERSION=$5

if [ -z "$DOCKER_USERNAME" ]; then
    echo "[ERROR] docker username is required"
    exit 1
fi

if [ -z "$DOCKER_ACCESS_TOKEN" ]; then
    echo "[ERROR] docker access token is required"
    exit 1
fi

if [ -z "$DOCKER_HUB_REPOSITORY" ]; then
    echo "[ERROR] docker hub repository is required"
    exit 1
fi

if [ -z "$BUILD_VERSION" ]; then
    echo "[ERROR] build version is required"
    exit 1
fi

if [ -z "$SERVICE_NAME" ]; then
    echo "[ERROR] service name is required"
    exit 1
fi

echo "[DEBUG] Docker Tag Image $BUILD_VERSION"
docker tag "$SERVICE_NAME":latest "$DOCKER_HUB_REPOSITORY:$BUILD_VERSION"

echo "$DOCKER_ACCESS_TOKEN" | docker login --username "$DOCKER_USERNAME" --password-stdin

echo "[DEBUG] Push Docker Image $DOCKER_HUB_REPOSITORY:$BUILD_VERSION"
docker push "$DOCKER_HUB_REPOSITORY:$BUILD_VERSION"