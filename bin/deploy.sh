#!/usr/bin/env bash
export BUILD_VERSION=$1
if [ "$BUILD_VERSION" = "" ]; then
    echo "Missing build version parameter (Git commit SHA)"
    exit -1
fi

ENVIRONMENT_KEY=$( echo $2 | tr '[a-z]' '[A-Z]' )
if [ "$ENVIRONMENT_KEY" = "" ]; then
    echo "Missing environment parameter"
    exit -1
fi

AZURE_RESOURCE_GROUP="AZURE_${ENVIRONMENT_KEY}_RESOURCE_GROUP"
AZURE_CLUSTER_NAME="AZURE_${ENVIRONMENT_KEY}_CLUSTER_NAME"

echo "Get credentials from Azure for Kubernetes"
az aks get-credentials --resource-group=${!AZURE_RESOURCE_GROUP} --name=${!AZURE_CLUSTER_NAME}

echo "Performing kubernetes deployment"

kubectl apply -f deployment.yml
#cat deployment.yml | kubectl apply -f -
