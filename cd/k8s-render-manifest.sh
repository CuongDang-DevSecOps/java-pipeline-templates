echo "[DEBUG] Render K8S Manifest"
echo "[DEBUG] Helm version: $(helm version)"

BUILD_VERSION=$1
HELM_VALUES_PATH=$2

if [ -z "$BUILD_VERSION" ]; then
    echo "[ERROR] build version is required"
    exit 1
fi

if [ -z "$HELM_VALUES_PATH" ]; then
    echo "[ERROR] helm values path is required"
    exit 1
fi

cp "$HELM_VALUES_PATH" helm-chart-templates

helm lint helm-chart-templates
helm template --output-dir helm-chart-templates/manifests helm-chart-templates -f "$HELM_VALUES_PATH"

echo "[DEBUG] Replace <IMAGE_TAG> $BUILD_VERSION"
sed -i "s/<IMAGE_TAG>/$BUILD_VERSION/g" helm-chart-templates/manifests/helm-chart-templates/templates/deployment.yaml

echo "[DEBUG] Show manifests"
cat helm-chart-templates/manifests/helm-chart-templates/templates/*.yaml