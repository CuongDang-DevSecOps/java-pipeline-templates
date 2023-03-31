echo "[DEBUG] GitOps Push Changes"

BUILD_VERSION=$1
NAMESPACE=$2
SERVICE_NAME=$3

if [ -z "$BUILD_VERSION" ]; then
    echo "[ERROR] build version is required"
    exit 1
fi

if [ -z "$NAMESPACE" ]; then
    echo "[ERROR] namespace is required"
    exit 1
fi

if [ -z "$SERVICE_NAME" ]; then
    echo "[ERROR] service name is required"
    exit 1
fi

echo "[DEBUG] copy manifests to git-ops deploy $CHART_NAME"
cp helm-chart-templates/manifests/helm-chart-templates/templates/* git-ops/deploys/"$NAMESPACE"/"$SERVICE_NAME"/

echo "[DEBUG] push to git-ops"
cd git-ops || return
git status
git add .
git commit -m "chore: update $NAMESPACE/$SERVICE_NAME:$BUILD_VERSION"
git push

cd ..