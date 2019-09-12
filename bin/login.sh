#!/usr/bin/env bash
set -x
set -e

ENVIRONMENT_KEY=$( echo $1 | tr '[a-z]' '[A-Z]' )
if [ "$ENVIRONMENT_KEY" = "" ]; then
    echo "Missing environment parameter"
    exit -1
fi

AZURE_SP_USER="AZURE_${ENVIRONMENT_KEY}_SP_USER"
AZURE_SP_TENANT="AZURE_${ENVIRONMENT_KEY}_SP_TENANT"
AZURE_SP_PASSWORD="AZURE_${ENVIRONMENT_KEY}_SP_PASSWORD"
AZURE_SUBSCRIPTION_ID="AZURE_${ENVIRONMENT_KEY}_SUBSCRIPTION_ID"
AZURE_SUBSCRIPTION_ID=${!AZURE_SUBSCRIPTION_ID}

echo ${AZURE_SP_USER}


echo "Logging in to Azure"
az login -u ${!AZURE_SP_USER} --service-principal --tenant ${!AZURE_SP_TENANT} -p ${!AZURE_SP_PASSWORD}

if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
    echo "No subscription set - will use the default."
else
    az account set -s $AZURE_SUBSCRIPTION_ID
fi