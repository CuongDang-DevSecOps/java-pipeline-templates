echo "[DEBUG] Docker Build"

SERVICE_NAME=$1

if [ -z "$SERVICE_NAME" ]; then
    echo "[ERROR] service name is required"
    exit 1
fi

docker build . -t "$SERVICE_NAME" -f java-pipeline-templates/docker/Dockerfile